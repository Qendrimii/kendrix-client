using System;

namespace kendrix_sync_service.Models
{
    public class Porosia : BaseEntity
    {
        public int FaturaId { get; set; }
        public int ProduktiId { get; set; }
        public decimal Cmimi { get; set; }
        public decimal? Sasia { get; set; }
        public decimal? Rabati { get; set; }
        public string IdTavolina { get; set; }
        public bool? Aktive { get; set; }
        public int? ShfrytezuesiId { get; set; }
        public decimal? Tvsh { get; set; }
    }
}

