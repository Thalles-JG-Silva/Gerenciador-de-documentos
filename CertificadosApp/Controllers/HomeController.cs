using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using CertificadosApp.Models;
using Microsoft.Extensions.Logging;

namespace CertificadosApp.Controllers
{    
    public class CertificadoController : Controller
    {
        // GET: Certificado/Editar/5
        public IActionResult Editar(int id)
        {
            // Obtenha o certificado pelo ID e passe-o para a view
            // Certificado certificado = _certificadoService.ObterCertificadoPorId(id);
            // return View(certificado);

            // Temporariamente retornando a view sem lógica de obtenção
            return View();
        }

        // POST: Certificado/Editar/5
        [HttpPost]
        public IActionResult Editar(int id, string Titulo, string Tipo, int Horas, DateTime Data, string Participante, string Participacao)
        {
            // Lógica para salvar as alterações do certificado aqui
            // _certificadoService.AtualizarCertificado(id, Titulo, Tipo, Horas, Data, Participante, Participacao);

            // Redirecionar para a página principal após salvar as alterações
            return RedirectToAction("PaginaPrincipal", "Home");
        }
        // GET: Certificado/Criar
        public IActionResult Criar()
        {
            return View();
        }

        // POST: Certificado/Criar
        [HttpPost]
        public IActionResult Criar(string Titulo, string Tipo, int Horas, DateTime Data, string Participante, string Participacao)
        {
            // Lógica para salvar o certificado aqui
            // Por exemplo, salvar no banco de dados

            // Redirecionar para a página principal após salvar
            return RedirectToAction("PaginaPrincipal", "Home");
        }        
    }   

    public class HomeController : Controller
    { 
        public IActionResult Contato()
        {
            return View();
        }      
        private readonly ILogger<HomeController> _logger;

        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }

        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Privacy()
        {
            return View();
        }

        public IActionResult PaginaPrincipal()
        {
            return View();
        }

        public IActionResult Lixeira()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }

    public class AccountController : Controller
    {
        private readonly ILogger<AccountController> _logger;

        public AccountController(ILogger<AccountController> logger)
        {
            _logger = logger;
        }

        // GET: Account/Login
        public IActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Login(string Username, string Password)
        {
            // Lógica de autenticação para aceitar "admin" como usuário e senha
            if (Username == "admin" && Password == "admin")
            {
                return RedirectToAction("PaginaPrincipal", "Home");
            }

            // Falha na autenticação
            ModelState.AddModelError("", "Usuário ou senha inválidos.");
            return View();
        }

        // GET: Account/Register
        public IActionResult Register()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Register(string Nome, string NomeUsuario, string Email, string Senha, string ConfirmarSenha)
        {
            // Lógica de cadastro aqui
            if (ModelState.IsValid)
            {
                // Verificar se a senha e a confirmação de senha coincidem
                if (Senha != ConfirmarSenha)
                {
                    ModelState.AddModelError("", "As senhas não coincidem.");
                    return View();
                }

                // Supondo que o cadastro foi bem-sucedido
                // Redirecionar para a página de login
                return RedirectToAction("Login", "Account");
            }

            // Falha no cadastro
            ModelState.AddModelError("", "Erro ao cadastrar. Por favor, tente novamente.");
            return View();
        }
    }
}
