import 'app_localizations.dart';

/// The translations for Albanian (`sq`).
class AppLocalizationsSq extends AppLocalizations {
  AppLocalizationsSq([String locale = 'sq']) : super(locale);

  @override
  String get appTitle => 'Kendrix';

  @override
  String get login => 'Identifikohu';

  @override
  String get logout => 'Dil';

  @override
  String get email => 'Email';

  @override
  String get password => 'Fjalëkalimi';

  @override
  String get forgotPassword => 'Harrove fjalëkalimin?';

  @override
  String get loginFailed => 'Identifikimi dështoi';

  @override
  String get invalidCredentials => 'Të dhëna të pavlefshme';

  @override
  String get dashboard => 'Paneli';

  @override
  String get admin => 'Admin';

  @override
  String get settings => 'Cilësimet';

  @override
  String get profile => 'Profili';

  @override
  String get users => 'Përdoruesit';

  @override
  String get tenants => 'Bizneset';

  @override
  String get roles => 'Rolet';

  @override
  String get sales => 'Shitjet';

  @override
  String get purchases => 'Blerjet';

  @override
  String get stock => 'Stoku';

  @override
  String get reports => 'Raportet';

  @override
  String get search => 'Kërko';

  @override
  String get filter => 'Filtro';

  @override
  String get export => 'Eksporto';

  @override
  String get refresh => 'Rifresko';

  @override
  String get loading => 'Duke ngarkuar...';

  @override
  String get error => 'Gabim';

  @override
  String get retry => 'Provo përsëri';

  @override
  String get cancel => 'Anulo';

  @override
  String get save => 'Ruaj';

  @override
  String get delete => 'Fshi';

  @override
  String get edit => 'Ndrysho';

  @override
  String get create => 'Krijo';

  @override
  String get update => 'Përditëso';

  @override
  String get add => 'Shto';

  @override
  String get remove => 'Hiq';

  @override
  String get confirm => 'Konfirmo';

  @override
  String get yes => 'Po';

  @override
  String get no => 'Jo';

  @override
  String get ok => 'OK';

  @override
  String get close => 'Mbyll';

  @override
  String get selectTenant => 'Zgjidh Biznesin';

  @override
  String get noTenantSelected => 'Asnjë biznes i zgjedhur';

  @override
  String get multipleTenants => 'Keni qasje në disa biznese. Ju lutemi zgjidhni një:';

  @override
  String get overview => 'Përmbledhje';

  @override
  String get salesNet => 'Shitjet Neto';

  @override
  String get salesVat => 'TVSH Shitjesh';

  @override
  String get purchasesNet => 'Blerjet Neto';

  @override
  String get averageTicket => 'Fatura Mesatare';

  @override
  String get dailySales => 'Shitjet Ditore';

  @override
  String get paymentMix => 'Përzierja e Pagesave';

  @override
  String get topItems => 'Artikujt Kryesorë';

  @override
  String get dataAsOf => 'Të dhënat deri më';

  @override
  String get noDataAvailable => 'Nuk ka të dhëna';

  @override
  String get emptyList => 'Nuk u gjetën artikuj';

  @override
  String get pullToRefresh => 'Tërheq për të rifreskuar';

  @override
  String pageOf(int current, int total) {
    return 'Faqja $current nga $total';
  }

  @override
  String get itemsPerPage => 'Artikuj për faqe';

  @override
  String get showColumns => 'Shfaq Kolonat';

  @override
  String get sortBy => 'Rendit sipas';

  @override
  String get ascending => 'Rritës';

  @override
  String get descending => 'Zbritës';

  @override
  String get dateRange => 'Intervali i Datave';

  @override
  String get fromDate => 'Nga Data';

  @override
  String get toDate => 'Deri Data';

  @override
  String get apply => 'Apliko';

  @override
  String get clear => 'Pastro';

  @override
  String get name => 'Emri';

  @override
  String get description => 'Përshkrimi';

  @override
  String get status => 'Statusi';

  @override
  String get active => 'Aktiv';

  @override
  String get inactive => 'Jo Aktiv';

  @override
  String get createdAt => 'Krijuar më';

  @override
  String get updatedAt => 'Përditësuar më';

  @override
  String get id => 'ID';

  @override
  String get details => 'Detajet';

  @override
  String get notFound => 'Nuk u Gjet';

  @override
  String get unauthorized => 'Jo i Autorizuar';

  @override
  String get forbidden => 'E Ndaluar';

  @override
  String get serverError => 'Gabim Serveri';

  @override
  String get networkError => 'Gabim Rrjeti';

  @override
  String get sessionExpired => 'Sesioni Skadoi';

  @override
  String get pleaseLoginAgain => 'Ju lutemi identifikohuni përsëri';

  @override
  String get createTenant => 'Krijo Biznes';

  @override
  String get editTenant => 'Ndrysho Biznes';

  @override
  String get tenantName => 'Emri i Biznesit';

  @override
  String get externalKey => 'Çelësi i Jashtëm';

  @override
  String get createUser => 'Krijo Përdorues';

  @override
  String get editUser => 'Ndrysho Përdorues';

  @override
  String get username => 'Emri i Përdoruesit';

  @override
  String get displayName => 'Emri i Shfaqur';

  @override
  String get assignRole => 'Cakto Rol';

  @override
  String get removeRole => 'Hiq Rol';

  @override
  String get linkTenant => 'Lidh Biznes';

  @override
  String get unlinkTenant => 'Shkëput Biznes';

  @override
  String get assignTenant => 'Cakto Biznes';

  @override
  String get articleBase => 'Artikulli Bazë';

  @override
  String get purchaseCategory => 'Kategoria e Blerjes';

  @override
  String get purchases_ => 'Blerjet';

  @override
  String get invoice => 'Fatura';

  @override
  String get invoiceCategory => 'Kategoria e Faturës';

  @override
  String get category => 'Kategoria';

  @override
  String get dailyMaterialized => 'Ditore të Materializuara';

  @override
  String get paymentMethod => 'Mënyra e Pagesës';

  @override
  String get regulation => 'Normativa';

  @override
  String get payments => 'Pagesat';

  @override
  String get order => 'Porosia';

  @override
  String get purchaseOrders => 'Porositë e Blerjes';

  @override
  String get user => 'Përdoruesi';

  @override
  String get stock_ => 'Stoku';

  @override
  String get subjects => 'Subjektet';

  @override
  String get table => 'Tavolina';

  @override
  String get vat => 'TVSH';

  @override
  String get reports_ => 'Raportet';

  @override
  String get invoiceNumber => 'Numri i Faturës';

  @override
  String get date => 'Data';

  @override
  String get subject => 'Subjekti';

  @override
  String get total => 'Totali';

  @override
  String get lines => 'Rreshtat';

  @override
  String get creator => 'Krijuesi';

  @override
  String get quantity => 'Sasia';

  @override
  String get price => 'Çmimi';

  @override
  String get amount => 'Shuma';

  @override
  String get article => 'Artikulli';

  @override
  String get unit => 'Njësia';

  @override
  String get discount => 'Zbritja';

  @override
  String get vatRate => 'Shkalla e TVSH';

  @override
  String get vatAmount => 'Shuma e TVSH';

  @override
  String get netAmount => 'Shuma Neto';

  @override
  String get grossAmount => 'Shuma Bruto';

  @override
  String get paymentDate => 'Data e Pagesës';

  @override
  String get paymentAmount => 'Shuma e Pagesës';

  @override
  String get change => 'Ndryshimi';

  @override
  String get theme => 'Tema';

  @override
  String get light => 'E Çelët';

  @override
  String get dark => 'E Errët';

  @override
  String get system => 'Sistemi';

  @override
  String get language => 'Gjuha';

  @override
  String get english => 'Anglisht';

  @override
  String get albanian => 'Shqip';

  @override
  String get notifications => 'Njoftimet';

  @override
  String get about => 'Rreth';

  @override
  String get version => 'Versioni';

  @override
  String get products => 'Produktet';

  @override
  String get noProducts => 'Nuk ka Produkte';

  @override
  String get noProductsSubtitle => 'Nuk u gjetën produkte. Shtoni disa produkte për të filluar.';

  @override
  String get addProduct => 'Shto Produkt';

  @override
  String get noInvoices => 'Nuk ka Fatura';

  @override
  String get noInvoicesSubtitle => 'Nuk u gjetën fatura. Krijoni disa fatura për të filluar.';

  @override
  String get addInvoice => 'Shto Faturë';

  @override
  String get createInvoice => 'Krijo Faturë';

  @override
  String get noPurchases => 'Nuk ka Blerje';

  @override
  String get noPurchasesSubtitle => 'Nuk u gjetën blerje. Krijoni disa blerje për të filluar.';

  @override
  String get addPurchase => 'Shto Blerje';

  @override
  String get createPurchase => 'Krijo Blerje';

  @override
  String get noStock => 'Nuk ka Stok';

  @override
  String get noStockSubtitle => 'Nuk u gjetën artikuj stoku. Shtoni disa artikuj stoku për të filluar.';

  @override
  String get addStock => 'Shto Stok';
}
