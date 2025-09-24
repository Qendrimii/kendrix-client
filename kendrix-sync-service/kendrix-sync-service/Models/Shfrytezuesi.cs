using System;

namespace kendrix_sync_service.Models
{
    public class Shfrytezuesi : BaseEntity
    {
        public string Username { get; set; }
        public string Password { get; set; }
        public string Email { get; set; }
        public string Tel { get; set; }
        public bool Aktiv { get; set; }
        public string Color { get; set; }
        public int? RoleId { get; set; }
        public int? PunetoriId { get; set; }
    }
}

