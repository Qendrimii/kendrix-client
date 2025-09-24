using System;

namespace kendrix_sync_service.Models
{
    public class ArtikulliBaze : BaseEntity
    {
        public bool? Artikull { get; set; }
        public bool? Sherbim { get; set; }
        public string Shifra { get; set; }
        public string Emri { get; set; }
        public string Njesia { get; set; }
        public string Barkodi { get; set; }
        public decimal? Cmimi_I_Shitjes_Cope { get; set; }
        public decimal? Cmimi_I_Shitjes_Pako { get; set; }
        public int? SasiaPako { get; set; }
        public int? KategoriaId { get; set; }
        public bool? Aktiv { get; set; }
        public bool? ArtikullIPerbere { get; set; }
        public string EmriGjenerik { get; set; }
        public string Prodhuesi { get; set; }
        public bool? ArtNgaPeshorja { get; set; }
        public int? TvshId { get; set; }
        public string EmertimiiDyte { get; set; }
        public decimal? PeshaNeto { get; set; }
        public decimal? PeshaBruto { get; set; }
        public decimal? Gjatesia { get; set; }
        public decimal? Gjersia { get; set; }
        public decimal? Lartesia { get; set; }
        public decimal? SasiaMinimale { get; set; }
        public decimal? SasiaMaksimale { get; set; }
        public bool? Afatshkurte { get; set; }
        public bool? Afatgjate { get; set; }
        public decimal? NormaZhvleresimit { get; set; }
        public DateTime? DataEFillimitTeZhvlersimit { get; set; }
        public int? TempId { get; set; }
        public DateTime? Skadimi { get; set; }
        public string Ambalazhi { get; set; }
        public bool? IRimbursueshem { get; set; }
        public string OrigjinaEMallit { get; set; }
        public short KostoEProdhimit { get; set; }
        public string Rafti { get; set; }
        public string KodiDoganor { get; set; }
        public int? SubjektiId { get; set; }
        public int? IncomeAccountId { get; set; }
        public int? ExpenseAccountId { get; set; }
        public bool IsGroup { get; set; }
        public int? GroupId { get; set; }
    }
}

