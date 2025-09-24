using System;

namespace kendrix_sync_service.Models
{
    public class Pagesat : BaseEntity
    {
        public DateTime? DataPageses { get; set; }
        public int? MenyraPagesesId { get; set; }
        public decimal? Totali { get; set; }
        public decimal? ShumaPaguar { get; set; }
        public int? ArkaId { get; set; }
        public int? BankaId { get; set; }
        public string Referenca { get; set; }
        public string Komenti { get; set; }
        public string Memo { get; set; }
        public string KrijuarNga { get; set; }
        public string Valuta { get; set; }
        public decimal? KursiKembimit { get; set; }
    }
}

