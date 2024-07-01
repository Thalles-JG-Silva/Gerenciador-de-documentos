using Microsoft.AspNetCore.Mvc;
using CertificadosApp.Data;
using System.Linq;

namespace CertificadosApp.Controllers
{
    public class LixeiraController : Controller
    {
        private readonly ApplicationDbContext _context;

        public LixeiraController(ApplicationDbContext context)
        {
            _context = context;
        }

        public IActionResult Index()
        {
            var certificados = _context.Certificados.Where(c => c.Excluido).ToList();
            return View(certificados);
        }

        [HttpPost]
        public IActionResult Restaurar(int[] ids)
        {
            var certificados = _context.Certificados.Where(c => ids.Contains(c.CertificadoID)).ToList();
            foreach (var cert in certificados)
            {
                cert.Excluido = false;
                _context.Certificados.Update(cert);
            }
            _context.SaveChanges();
            return RedirectToAction(nameof(Index));
        }

        [HttpPost]
        public IActionResult ExcluirPermanentemente(int[] ids)
        {
            var certificados = _context.Certificados.Where(c => ids.Contains(c.CertificadoID)).ToList();
            _context.Certificados.RemoveRange(certificados);
            _context.SaveChanges();
            return RedirectToAction(nameof(Index));
        }
    }
}
