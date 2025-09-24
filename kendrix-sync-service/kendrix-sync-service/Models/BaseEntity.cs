using System;

namespace kendrix_sync_service.Models
{
    public abstract class BaseEntity
    {
        public int Id { get; set; }
        public DateTime? DataEKrijimit { get; set; }
        public DateTime? DataEModifikimit { get; set; }
    }
}

