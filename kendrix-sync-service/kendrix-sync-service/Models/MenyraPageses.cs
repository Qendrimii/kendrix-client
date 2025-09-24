using System;

namespace kendrix_sync_service.Models
{
    public class MenyraPageses : BaseEntity
    {
        public string Kodi { get; set; }
        public string Emertimi { get; set; }
        public int? Kontoja { get; set; }
        public int? FiskalType { get; set; }
        public bool? PosEnabled { get; set; }
        public bool? POSBorgji { get; set; }
        public string KontojaKalimtare { get; set; }
        public bool? KontimneKontoKalimtare { get; set; }
        public string KontojaeProvizioneve { get; set; }
        public int? BankaId { get; set; }
        public bool? JoFiskal { get; set; }
    }
}

