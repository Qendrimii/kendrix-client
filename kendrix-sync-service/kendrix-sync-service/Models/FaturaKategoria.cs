using System;

namespace kendrix_sync_service.Models
{
    public class FaturaKategoria : BaseEntity
    {
        public string Emri { get; set; }
        public string Kodi { get; set; }
        public string Pershkrimi { get; set; }
        public int? TvshId { get; set; }
    }
}

