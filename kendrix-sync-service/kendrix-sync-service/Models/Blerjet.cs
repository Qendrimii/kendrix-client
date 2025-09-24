using System;

namespace kendrix_sync_service.Models
{
    public class Blerjet : BaseEntity
    {
        public DateTime? DataEFatures { get; set; }
        public string NrFatures { get; set; }
        public DateTime? AfatiPageses { get; set; }
        public int? BlerjeKategoriaId { get; set; }
        public string NumriFaturesSeFurnitorit { get; set; }
        public byte[] Fatura { get; set; }
        public bool? Staff { get; set; }
        public int? SubjektiId { get; set; }
        public int? PagesaId { get; set; }
        public int? StatusFatureId { get; set; }
        public int? OptimisticLockField { get; set; }
        public decimal? fTotalPorosias { get; set; }
        public decimal? fTotalVAT { get; set; }
        public decimal? TotalPorosias { get; set; }
        public decimal? TotalVAT { get; set; }
        public int? ArkaId { get; set; }
        public int? MenyraPagesesId { get; set; }
    }
}

