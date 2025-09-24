using System;

namespace kendrix_sync_service.Models
{
    public class Normativa : BaseEntity
    {
        public int ArtikulliBazeId { get; set; }
        public decimal Norma { get; set; }
    }
}

