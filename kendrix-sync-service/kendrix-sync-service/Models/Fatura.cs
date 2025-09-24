using System;

namespace kendrix_sync_service.Models
{
    public class Fatura : BaseEntity
    {
        public DateTime? Data { get; set; }
        public bool? Fshire { get; set; }
        public int? ShfrytezuesiId { get; set; }
        public string NrFatures { get; set; }
        public DateTime? AfatiPageses { get; set; }
        public bool? Staff { get; set; }
        public int? FaturaKategoriaId { get; set; }
        public string KodiValues { get; set; }
        public decimal? KursiKembimit { get; set; }
        public int? SubjektiId { get; set; }
        public int? StatusFatureId { get; set; }
        public int? PagesaId { get; set; }
        public string Comment { get; set; }
    }
}

