namespace CertificadosApp.Models
{
    public class Certificado
    {
        public int CertificadoID { get; set; }
        public string Titulo { get; set; } = string.Empty;
        public string Tipo { get; set; } = string.Empty;
        public int Horas { get; set; }
        public DateTime Data { get; set; }
        public string Participante { get; set; } = string.Empty;
        public string Participacao { get; set; } = string.Empty;
        public bool Excluido { get; set; }
    }
}
