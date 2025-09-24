using System;

namespace kendrix_sync_service.Models
{
    public class Stoku : BaseEntity
    {
        public int ProduktiId { get; set; }
        public decimal? Sasia { get; set; }
        public int LevelIRenditjes { get; set; }
        public bool? Fshire { get; set; }
        public string Lokacioni { get; set; }
    }
}

