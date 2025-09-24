import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../core/auth/auth_repository.dart';
import '../core/i18n/l10n.dart';
import '../core/routing/route_guards.dart';

class AppDrawer extends ConsumerWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final authState = ref.watch(authStateProvider);
    
    return Drawer(
      child: Column(
        children: [
          // Header
          UserAccountsDrawerHeader(
            accountName: Text(authState.user?.displayName ?? authState.user?.email ?? 'User'),
            accountEmail: Text(authState.user?.email ?? ''),
            currentAccountPicture: CircleAvatar(
              child: Text(
                authState.user?.displayName?.substring(0, 1).toUpperCase() ?? 
                authState.user?.email.substring(0, 1).toUpperCase() ?? 
                'U',
              ),
            ),
          ),
          
          // Navigation items
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  leading: const Icon(Icons.dashboard),
                  title: Text(l10n.dashboard),
                  onTap: () {
                    Navigator.pop(context);
                    context.go(AppRoute.dashboard.path);
                  },
                ),
                
                // Admin section
                FutureBuilder<bool>(
                  future: ref.read(authRepositoryProvider).isAdmin(),
                  builder: (context, snapshot) {
                    if (snapshot.data != true) return const SizedBox.shrink();
                    
                    return ExpansionTile(
                      leading: const Icon(Icons.admin_panel_settings),
                      title: Text(l10n.admin),
                      children: [
                        ListTile(
                          leading: const Icon(Icons.business),
                          title: Text(l10n.tenants),
                          onTap: () {
                            Navigator.pop(context);
                            context.go(AppRoute.adminTenants.path);
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.people),
                          title: Text(l10n.users),
                          onTap: () {
                            Navigator.pop(context);
                            context.go(AppRoute.adminUsers.path);
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.security),
                          title: Text(l10n.roles),
                          onTap: () {
                            Navigator.pop(context);
                            context.go(AppRoute.adminRoles.path);
                          },
                        ),
                      ],
                    );
                  },
                ),
                
                // Business data section
                ExpansionTile(
                  leading: const Icon(Icons.receipt_long),
                  title: Text(l10n.sales),
                  children: [
                    ListTile(
                      leading: const Icon(Icons.receipt),
                      title: Text(l10n.invoice),
                      onTap: () {
                        Navigator.pop(context);
                        context.go(AppRoute.fatura.path);
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.category),
                      title: Text(l10n.invoiceCategory),
                      onTap: () {
                        Navigator.pop(context);
                        context.go(AppRoute.faturaKategoria.path);
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.payments),
                      title: Text(l10n.payments),
                      onTap: () {
                        Navigator.pop(context);
                        context.go(AppRoute.pagesat.path);
                      },
                    ),
                  ],
                ),
                
                ExpansionTile(
                  leading: const Icon(Icons.shopping_cart),
                  title: Text(l10n.purchases),
                  children: [
                    ListTile(
                      leading: const Icon(Icons.shopping_bag),
                      title: Text(l10n.purchases_),
                      onTap: () {
                        Navigator.pop(context);
                        context.go(AppRoute.blerjet.path);
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.category),
                      title: Text(l10n.purchaseCategory),
                      onTap: () {
                        Navigator.pop(context);
                        context.go(AppRoute.blerjeKategoria.path);
                      },
                    ),
                  ],
                ),
                
                ExpansionTile(
                  leading: const Icon(Icons.inventory),
                  title: Text(l10n.stock),
                  children: [
                    ListTile(
                      leading: const Icon(Icons.inventory_2),
                      title: Text(l10n.stock_),
                      onTap: () {
                        Navigator.pop(context);
                        context.go(AppRoute.stoku.path);
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.article),
                      title: Text(l10n.articleBase),
                      onTap: () {
                        Navigator.pop(context);
                        context.go(AppRoute.artikulliBaze.path);
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.category),
                      title: Text(l10n.category),
                      onTap: () {
                        Navigator.pop(context);
                        context.go(AppRoute.kategoria.path);
                      },
                    ),
                  ],
                ),
                
                const Divider(),
                
                ListTile(
                  leading: const Icon(Icons.business),
                  title: Text(l10n.subjects),
                  onTap: () {
                    Navigator.pop(context);
                    context.go(AppRoute.subjektet.path);
                  },
                ),
                
                ListTile(
                  leading: const Icon(Icons.table_restaurant),
                  title: Text(l10n.table),
                  onTap: () {
                    Navigator.pop(context);
                    context.go(AppRoute.tavolina.path);
                  },
                ),
                
                ListTile(
                  leading: const Icon(Icons.assessment),
                  title: Text(l10n.reports_),
                  onTap: () {
                    Navigator.pop(context);
                    context.go(AppRoute.zRaportet.path);
                  },
                ),
              ],
            ),
          ),
          
          // Footer
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings),
            title: Text(l10n.settings),
            onTap: () {
              Navigator.pop(context);
              context.go(AppRoute.settings.path);
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: Text(l10n.logout),
            onTap: () async {
              Navigator.pop(context);
              await ref.read(authStateProvider.notifier).logout();
            },
          ),
        ],
      ),
    );
  }
}