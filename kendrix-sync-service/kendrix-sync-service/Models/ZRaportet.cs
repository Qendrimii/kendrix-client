using System;

namespace kendrix_sync_service.Models
{
    public class ZRaportet : BaseEntity
    {
        public decimal ShumaShitjeProgram { get; set; }
        public decimal ShumaNeZRaport { get; set; }
        public decimal? Diferenca { get; set; }
    }
}

