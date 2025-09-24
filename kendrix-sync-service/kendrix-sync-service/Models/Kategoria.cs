using System;

namespace kendrix_sync_service.Models
{
    public class Kategoria : BaseEntity
    {
        public string Emri { get; set; }
        public string Color { get; set; }
        public string Printer { get; set; }
        public int? Lloji { get; set; }
        public string EmriNePrinter { get; set; }
    }
}

