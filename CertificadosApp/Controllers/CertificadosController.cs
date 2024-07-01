using Microsoft.AspNetCore.Mvc;
using CertificadosApp.Data;
using CertificadosApp.Models;
using System.Linq;

namespace CertificadosApp.Controllers
{
    public class CertificadosController : Controller
    {
        private readonly ApplicationDbContext _context;

        public CertificadosController(ApplicationDbContext context)
        {
            _context = context;
        }

        public IActionResult Index()
        {
            var certificados = _context.Certificados.Where(c => !c.Excluido).ToList();
            return View(certificados);
        }

        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Create(Certificado certificado)
        {
            if (ModelState.IsValid)
            {
                _context.Certificados.Add(certificado);
                _context.SaveChanges();
                return RedirectToAction(nameof(Index));
            }
            return View(certificado);
        }

        public IActionResult Edit(int id)
        {
            var certificado = _context.Certificados.Find(id);
            if (certificado == null)
            {
                return NotFound();
            }
            return View(certificado);
        }

        [HttpPost]
        public IActionResult Edit(Certificado certificado)
        {
            if (ModelState.IsValid)
            {
                _context.Certificados.Update(certificado);
                _context.SaveChanges();
                return RedirectToAction(nameof(Index));
            }
            return View(certificado);
        }

        public IActionResult Delete(int id)
        {
            var certificado = _context.Certificados.Find(id);
            if (certificado == null)
            {
                return NotFound();
            }
            return View(certificado);
        }

        [HttpPost, ActionName("Delete")]
        public IActionResult DeleteConfirmed(int id)
        {
            var certificado = _context.Certificados.Find(id);
            if (certificado != null)
            {
                certificado.Excluido = true;
                _context.Certificados.Update(certificado);
                _context.SaveChanges();
            }
            return RedirectToAction(nameof(Index));
        }
    }
}
