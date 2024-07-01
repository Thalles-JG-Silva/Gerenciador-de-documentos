using System.ComponentModel.DataAnnotations;

namespace CertificadosApp.Models
{
    public class UsuarioViewModel
    {
        [Required]
        public string Nome { get; set; } = string.Empty;

        [Required]
        public string NomeUsuario { get; set; } = string.Empty;

        [Required, EmailAddress]
        public string Email { get; set; } = string.Empty;

        [Required, DataType(DataType.Password)]
        public string Senha { get; set; } = string.Empty;

        [Required, DataType(DataType.Password), Compare("Senha")]
        public string ConfirmarSenha { get; set; } = string.Empty;
    }
}
