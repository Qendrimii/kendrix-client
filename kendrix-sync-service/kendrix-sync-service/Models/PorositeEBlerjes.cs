using System;

namespace kendrix_sync_service.Models
{
    public class PorositeEBlerjes : BaseEntity
    {
        public int ProduktiId { get; set; }
        public decimal Sasia { get; set; }
        public decimal CmimiNjesi { get; set; }
        public int? BlerjaId { get; set; }
        public DateTime? PorosiaDate { get; set; }
        public decimal? Tvsh { get; set; }
        public decimal? Rabati { get; set; }
        public int? OptimisticLockField { get; set; }
        public decimal? Total { get; set; }
    }
}

