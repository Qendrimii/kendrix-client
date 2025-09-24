import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Kendrix';

  @override
  String get login => 'Login';

  @override
  String get logout => 'Logout';

  @override
  String get email => 'Email';

  @override
  String get password => 'Password';

  @override
  String get forgotPassword => 'Forgot Password?';

  @override
  String get loginFailed => 'Login failed';

  @override
  String get invalidCredentials => 'Invalid credentials';

  @override
  String get dashboard => 'Dashboard';

  @override
  String get admin => 'Admin';

  @override
  String get settings => 'Settings';

  @override
  String get profile => 'Profile';

  @override
  String get users => 'Users';

  @override
  String get tenants => 'Tenants';

  @override
  String get roles => 'Roles';

  @override
  String get sales => 'Sales';

  @override
  String get purchases => 'Purchases';

  @override
  String get stock => 'Stock';

  @override
  String get reports => 'Reports';

  @override
  String get search => 'Search';

  @override
  String get filter => 'Filter';

  @override
  String get export => 'Export';

  @override
  String get refresh => 'Refresh';

  @override
  String get loading => 'Loading...';

  @override
  String get error => 'Error';

  @override
  String get retry => 'Retry';

  @override
  String get cancel => 'Cancel';

  @override
  String get save => 'Save';

  @override
  String get delete => 'Delete';

  @override
  String get edit => 'Edit';

  @override
  String get create => 'Create';

  @override
  String get update => 'Update';

  @override
  String get add => 'Add';

  @override
  String get remove => 'Remove';

  @override
  String get confirm => 'Confirm';

  @override
  String get yes => 'Yes';

  @override
  String get no => 'No';

  @override
  String get ok => 'OK';

  @override
  String get close => 'Close';

  @override
  String get selectTenant => 'Select Tenant';

  @override
  String get noTenantSelected => 'No tenant selected';

  @override
  String get multipleTenants => 'You have access to multiple tenants. Please select one:';

  @override
  String get overview => 'Overview';

  @override
  String get salesNet => 'Sales Net';

  @override
  String get salesVat => 'Sales VAT';

  @override
  String get purchasesNet => 'Purchases Net';

  @override
  String get averageTicket => 'Average Ticket';

  @override
  String get dailySales => 'Daily Sales';

  @override
  String get paymentMix => 'Payment Mix';

  @override
  String get topItems => 'Top Items';

  @override
  String get dataAsOf => 'Data as of';

  @override
  String get noDataAvailable => 'No data available';

  @override
  String get emptyList => 'No items found';

  @override
  String get pullToRefresh => 'Pull to refresh';

  @override
  String pageOf(int current, int total) {
    return 'Page $current of $total';
  }

  @override
  String get itemsPerPage => 'Items per page';

  @override
  String get showColumns => 'Show Columns';

  @override
  String get sortBy => 'Sort by';

  @override
  String get ascending => 'Ascending';

  @override
  String get descending => 'Descending';

  @override
  String get dateRange => 'Date Range';

  @override
  String get fromDate => 'From Date';

  @override
  String get toDate => 'To Date';

  @override
  String get apply => 'Apply';

  @override
  String get clear => 'Clear';

  @override
  String get name => 'Name';

  @override
  String get description => 'Description';

  @override
  String get status => 'Status';

  @override
  String get active => 'Active';

  @override
  String get inactive => 'Inactive';

  @override
  String get createdAt => 'Created At';

  @override
  String get updatedAt => 'Updated At';

  @override
  String get id => 'ID';

  @override
  String get details => 'Details';

  @override
  String get notFound => 'Not Found';

  @override
  String get unauthorized => 'Unauthorized';

  @override
  String get forbidden => 'Forbidden';

  @override
  String get serverError => 'Server Error';

  @override
  String get networkError => 'Network Error';

  @override
  String get sessionExpired => 'Session Expired';

  @override
  String get pleaseLoginAgain => 'Please login again';

  @override
  String get createTenant => 'Create Tenant';

  @override
  String get editTenant => 'Edit Tenant';

  @override
  String get tenantName => 'Tenant Name';

  @override
  String get externalKey => 'External Key';

  @override
  String get createUser => 'Create User';

  @override
  String get editUser => 'Edit User';

  @override
  String get username => 'Username';

  @override
  String get displayName => 'Display Name';

  @override
  String get assignRole => 'Assign Role';

  @override
  String get removeRole => 'Remove Role';

  @override
  String get linkTenant => 'Link Tenant';

  @override
  String get unlinkTenant => 'Unlink Tenant';

  @override
  String get assignTenant => 'Assign Tenant';

  @override
  String get articleBase => 'Article Base';

  @override
  String get purchaseCategory => 'Purchase Category';

  @override
  String get purchases_ => 'Purchases';

  @override
  String get invoice => 'Invoice';

  @override
  String get invoiceCategory => 'Invoice Category';

  @override
  String get category => 'Category';

  @override
  String get dailyMaterialized => 'Daily Materialized';

  @override
  String get paymentMethod => 'Payment Method';

  @override
  String get regulation => 'Regulation';

  @override
  String get payments => 'Payments';

  @override
  String get order => 'Order';

  @override
  String get purchaseOrders => 'Purchase Orders';

  @override
  String get user => 'User';

  @override
  String get stock_ => 'Stock';

  @override
  String get subjects => 'Subjects';

  @override
  String get table => 'Table';

  @override
  String get vat => 'VAT';

  @override
  String get reports_ => 'Reports';

  @override
  String get invoiceNumber => 'Invoice Number';

  @override
  String get date => 'Date';

  @override
  String get subject => 'Subject';

  @override
  String get total => 'Total';

  @override
  String get lines => 'Lines';

  @override
  String get creator => 'Creator';

  @override
  String get quantity => 'Quantity';

  @override
  String get price => 'Price';

  @override
  String get amount => 'Amount';

  @override
  String get article => 'Article';

  @override
  String get unit => 'Unit';

  @override
  String get discount => 'Discount';

  @override
  String get vatRate => 'VAT Rate';

  @override
  String get vatAmount => 'VAT Amount';

  @override
  String get netAmount => 'Net Amount';

  @override
  String get grossAmount => 'Gross Amount';

  @override
  String get paymentDate => 'Payment Date';

  @override
  String get paymentAmount => 'Payment Amount';

  @override
  String get change => 'Change';

  @override
  String get theme => 'Theme';

  @override
  String get light => 'Light';

  @override
  String get dark => 'Dark';

  @override
  String get system => 'System';

  @override
  String get language => 'Language';

  @override
  String get english => 'English';

  @override
  String get albanian => 'Albanian';

  @override
  String get notifications => 'Notifications';

  @override
  String get about => 'About';

  @override
  String get version => 'Version';

  @override
  String get products => 'Products';

  @override
  String get noProducts => 'No Products';

  @override
  String get noProductsSubtitle => 'No products found. Add some products to get started.';

  @override
  String get addProduct => 'Add Product';

  @override
  String get noInvoices => 'No Invoices';

  @override
  String get noInvoicesSubtitle => 'No invoices found. Create some invoices to get started.';

  @override
  String get addInvoice => 'Add Invoice';

  @override
  String get createInvoice => 'Create Invoice';

  @override
  String get noPurchases => 'No Purchases';

  @override
  String get noPurchasesSubtitle => 'No purchases found. Create some purchases to get started.';

  @override
  String get addPurchase => 'Add Purchase';

  @override
  String get createPurchase => 'Create Purchase';

  @override
  String get noStock => 'No Stock';

  @override
  String get noStockSubtitle => 'No stock items found. Add some stock to get started.';

  @override
  String get addStock => 'Add Stock';
}
