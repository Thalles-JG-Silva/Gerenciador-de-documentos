using Microsoft.AspNetCore.Mvc;
using CertificadosApp.Data;
using CertificadosApp.Models;
using System.Linq;

namespace CertificadosApp.Controllers
{
    public class AccountController : Controller
    {
        private readonly ApplicationDbContext _context;

        public AccountController(ApplicationDbContext context)
        {
            _context = context;
        }

        public IActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Login(string username, string password)
        {
            var user = _context.Usuarios.FirstOrDefault(u => (u.NomeUsuario == username || u.Email == username) && u.Senha == password);
            if (user != null)
            {
                // Autenticação bem-sucedida
                // Adicione lógica para redirecionar após login
                return RedirectToAction("Index", "Home");
            }

            ViewBag.ErrorMessage = "Credenciais inválidas";
            return View();
        }

        public IActionResult Register()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Register(UsuarioViewModel usuarioViewModel)
        {
            if (ModelState.IsValid)
            {
                // Verifique se a senha e a confirmação de senha coincidem
                if (usuarioViewModel.Senha != usuarioViewModel.ConfirmarSenha)
                {
                    ModelState.AddModelError("Senha", "A senha e a confirmação de senha não coincidem.");
                    return View(usuarioViewModel);
                }

                var usuario = new Usuario
                {
                    Nome = usuarioViewModel.Nome,
                    NomeUsuario = usuarioViewModel.NomeUsuario,
                    Email = usuarioViewModel.Email,
                    Senha = usuarioViewModel.Senha,
                };

                _context.Usuarios.Add(usuario);
                _context.SaveChanges();
                return RedirectToAction("Login");
            }
            return View(usuarioViewModel);
        }
    }
}
