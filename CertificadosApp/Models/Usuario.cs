using System;
using System.ComponentModel.DataAnnotations;

namespace CertificadosApp.Models
{
    public class Usuario
    {
        public int UsuarioID { get; set; }

        [Required]
        public string Nome { get; set; } = string.Empty;

        [Required]
        public string NomeUsuario { get; set; } = string.Empty;

        [Required, EmailAddress]
        public string Email { get; set; } = string.Empty;

        [Required, DataType(DataType.Password)]
        public string Senha { get; set; } = string.Empty;

        public DateTime DataCadastro { get; set; } = DateTime.Now;
    }
}
