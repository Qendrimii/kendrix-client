using System;

namespace kendrix_sync_service.Models
{
    public class Tavolina : BaseEntity
    {
        public bool? Fshire { get; set; }
        public string Emri { get; set; }
        public int SallaId { get; set; }
        public int? ShfrytezuesiId { get; set; }
        public int? Statusi { get; set; }
        public int? RestTableX { get; set; }
        public int? RestTableY { get; set; }
        public int? SizeX { get; set; }
        public int? SizeY { get; set; }
        public DateTime? RegDate { get; set; }
        public int? TableColorR { get; set; }
        public int? TableColorG { get; set; }
        public int? TableColorB { get; set; }
    }
}

