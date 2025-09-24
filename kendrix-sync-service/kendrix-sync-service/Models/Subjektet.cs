using System;

namespace kendrix_sync_service.Models
{
    public class Subjektet : BaseEntity
    {
        public string Kodi { get; set; }
        public string Emertimi { get; set; }
        public bool? Furnitor { get; set; }
        public bool? Bleres { get; set; }
        public string NrUnik { get; set; }
        public string NoFiskal { get; set; }
        public string NoTVSH { get; set; }
        public string NIB { get; set; }
        public string Adresa { get; set; }
        public string Telefoni { get; set; }
        public string Email { get; set; }
        public decimal? Rabati { get; set; }
        public string Pershkrimi { get; set; }
        public int? KontojaArketueshme { get; set; }
        public int? KontojaPagueshme { get; set; }
        public decimal? Limiti { get; set; }
    }
}

