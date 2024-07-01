using Microsoft.EntityFrameworkCore;
using CertificadosApp.Models;

namespace CertificadosApp.Data
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
            : base(options)
        {
        }

        public DbSet<Usuario> Usuarios { get; set; }
        public DbSet<Certificado> Certificados { get; set; }
    }
}
