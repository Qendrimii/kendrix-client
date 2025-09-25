import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../features/auth/screens/login_screen.dart';
import '../../features/dashboard/screens/dashboard_screen.dart';
import '../../features/tenant_switcher/screens/tenant_selector_screen.dart';
import '../../features/common_lists/screens/artikulli_baze_list_screen.dart';
import '../../features/common_lists/screens/fatura_list_screen.dart';
import '../../features/common_lists/screens/blerjet_list_screen.dart';
import '../../features/common_lists/screens/stoku_list_screen.dart';
import '../../features/common_lists/screens/generic_entity_list_screen.dart';
import '../../features/common_lists/screens/paginated_entity_list_screen.dart';
import '../../widgets/app_scaffold.dart';
import 'route_guards.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  final routeGuard = ref.watch(routeGuardProvider);

  return GoRouter(
    initialLocation: AppRoute.dashboard.path,
    debugLogDiagnostics: true,
    redirect: (context, state) async {
      print('🌐 Router redirect called for: ${state.matchedLocation}');
      
      // Only apply auth guard to avoid redirect loops
      var redirect = await routeGuard.authGuard(state);
      if (redirect != null) {
        print('🌐 Auth guard redirecting from ${state.matchedLocation} to $redirect');
        return redirect;
      }

      // TODO: Re-enable tenant and admin guards after fixing auth
      // redirect = await routeGuard.tenantGuard(state);
      // if (redirect != null) return redirect;

      // redirect = await routeGuard.adminGuard(state);
      // if (redirect != null) return redirect;

      print('🌐 No redirect needed for: ${state.matchedLocation}');
      return null;
    },
    routes: [
      // Auth routes
      GoRoute(
        path: AppRoute.login.path,
        name: AppRoute.login.name,
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const LoginScreen(),
        ),
      ),

      // Tenant selector
      GoRoute(
        path: AppRoute.tenantSelector.path,
        name: AppRoute.tenantSelector.name,
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const TenantSelectorScreen(),
        ),
      ),

      // Main app with shell
      ShellRoute(
        builder: (context, state, child) {
          return AppScaffold(child: child);
        },
        routes: [
          // Dashboard
          GoRoute(
            path: AppRoute.dashboard.path,
            name: AppRoute.dashboard.name,
            pageBuilder: (context, state) => NoTransitionPage(
              key: state.pageKey,
              child: const DashboardScreen(),
            ),
          ),

          // Admin routes
          GoRoute(
            path: AppRoute.adminTenants.path,
            name: AppRoute.adminTenants.name,
            pageBuilder: (context, state) => NoTransitionPage(
              key: state.pageKey,
              child: const AdminTenantsScreen(),
            ),
            routes: [
              GoRoute(
                path: 'create',
                name: AppRoute.adminTenantCreate.name,
                pageBuilder: (context, state) => MaterialPage(
                  key: state.pageKey,
                  child: const CreateEditTenantScreen(),
                ),
              ),
              GoRoute(
                path: ':id/edit',
                name: AppRoute.adminTenantEdit.name,
                pageBuilder: (context, state) => MaterialPage(
                  key: state.pageKey,
                  child: CreateEditTenantScreen(
                    tenantId: int.tryParse(state.pathParameters['id']!),
                  ),
                ),
              ),
            ],
          ),

          GoRoute(
            path: AppRoute.adminUsers.path,
            name: AppRoute.adminUsers.name,
            pageBuilder: (context, state) => NoTransitionPage(
              key: state.pageKey,
              child: const AdminUsersScreen(),
            ),
            routes: [
              GoRoute(
                path: 'create',
                name: AppRoute.adminUserCreate.name,
                pageBuilder: (context, state) => MaterialPage(
                  key: state.pageKey,
                  child: const CreateEditUserScreen(),
                ),
              ),
              GoRoute(
                path: ':id/edit',
                name: AppRoute.adminUserEdit.name,
                pageBuilder: (context, state) => MaterialPage(
                  key: state.pageKey,
                  child: CreateEditUserScreen(
                    userId: int.tryParse(state.pathParameters['id']!),
                  ),
                ),
              ),
            ],
          ),

          GoRoute(
            path: AppRoute.adminRoles.path,
            name: AppRoute.adminRoles.name,
            pageBuilder: (context, state) => NoTransitionPage(
              key: state.pageKey,
              child: const AdminRolesScreen(),
            ),
          ),

          GoRoute(
            path: AppRoute.adminUserTenants.path,
            name: AppRoute.adminUserTenants.name,
            pageBuilder: (context, state) => NoTransitionPage(
              key: state.pageKey,
              child: const AdminUserTenantsScreen(),
            ),
          ),

          // Business data routes
          GoRoute(
            path: AppRoute.artikulliBaze.path,
            name: AppRoute.artikulliBaze.name,
            pageBuilder: (context, state) => NoTransitionPage(
              key: state.pageKey,
              child: const PaginatedEntityListScreen(
                title: 'Artikulli Baze',
                tableName: 'ArtikulliBaze',
              ),
            ),
            routes: [
              GoRoute(
                path: ':id',
                name: AppRoute.artikulliBazeDetail.name,
                pageBuilder: (context, state) => MaterialPage(
                  key: state.pageKey,
                  child: Placeholder(), // TODO: Implement detail screen
                ),
              ),
            ],
          ),

          GoRoute(
            path: AppRoute.blerjeKategoria.path,
            name: AppRoute.blerjeKategoria.name,
            pageBuilder: (context, state) => NoTransitionPage(
              key: state.pageKey,
              child: const PaginatedEntityListScreen(
                title: 'Blerje Kategoria',
                tableName: 'BlerjeKategoria',
              ),
            ),
          ),

          GoRoute(
            path: AppRoute.blerjet.path,
            name: AppRoute.blerjet.name,
            pageBuilder: (context, state) => NoTransitionPage(
              key: state.pageKey,
              child: const BlerjetListScreen(),
            ),
            routes: [
              GoRoute(
                path: ':id',
                name: AppRoute.blerjetDetail.name,
                pageBuilder: (context, state) => MaterialPage(
                  key: state.pageKey,
                  child: Placeholder(), // TODO: Implement detail screen
                ),
              ),
            ],
          ),

          GoRoute(
            path: AppRoute.fatura.path,
            name: AppRoute.fatura.name,
            pageBuilder: (context, state) => NoTransitionPage(
              key: state.pageKey,
              child: const FaturaListScreen(),
            ),
            routes: [
              GoRoute(
                path: ':id',
                name: AppRoute.faturaDetail.name,
                pageBuilder: (context, state) => MaterialPage(
                  key: state.pageKey,
                  child: Placeholder(), // TODO: Implement detail screen
                ),
              ),
            ],
          ),

          GoRoute(
            path: AppRoute.subjektet.path,
            name: AppRoute.subjektet.name,
            pageBuilder: (context, state) => NoTransitionPage(
              key: state.pageKey,
              child: const PaginatedEntityListScreen(
                title: 'Subjektet',
                tableName: 'Subjektet',
              ),
            ),
            routes: [
              GoRoute(
                path: ':id',
                name: AppRoute.subjektetDetail.name,
                pageBuilder: (context, state) => MaterialPage(
                  key: state.pageKey,
                  child: Placeholder(), // TODO: Implement detail screen
                ),
              ),
            ],
          ),

          // Add all other business entity routes
          ...businessEntityRoutes(),

          // Settings
          GoRoute(
            path: AppRoute.settings.path,
            name: AppRoute.settings.name,
            pageBuilder: (context, state) => NoTransitionPage(
              key: state.pageKey,
              child: const SettingsScreen(),
            ),
          ),

          GoRoute(
            path: AppRoute.profile.path,
            name: AppRoute.profile.name,
            pageBuilder: (context, state) => NoTransitionPage(
              key: state.pageKey,
              child: const ProfileScreen(),
            ),
          ),
        ],
      ),
    ],
    errorPageBuilder: (context, state) => MaterialPage(
      key: state.pageKey,
      child: ErrorScreen(error: state.error),
    ),
  );
});

List<RouteBase> businessEntityRoutes() {
  return [
    GoRoute(
      path: AppRoute.faturaKategoria.path,
      name: AppRoute.faturaKategoria.name,
      pageBuilder: (context, state) => NoTransitionPage(
        key: state.pageKey,
        child: const PaginatedEntityListScreen(
          title: 'Fatura Kategoria',
          tableName: 'FaturaKategoria',
        ),
      ),
    ),
    GoRoute(
      path: AppRoute.kategoria.path,
      name: AppRoute.kategoria.name,
      pageBuilder: (context, state) => NoTransitionPage(
        key: state.pageKey,
        child: const GenericEntityListScreen.category(
          title: 'Kategoria',
          tableName: 'Kategoria',
        ),
      ),
    ),
    GoRoute(
      path: AppRoute.materializedDaily.path,
      name: AppRoute.materializedDaily.name,
      pageBuilder: (context, state) => NoTransitionPage(
        key: state.pageKey,
        child: const GenericEntityListScreen.basic(
          title: 'Materialized Daily',
          tableName: 'MaterializedDaily',
        ),
      ),
    ),
    GoRoute(
      path: AppRoute.menyraPageses.path,
      name: AppRoute.menyraPageses.name,
      pageBuilder: (context, state) => NoTransitionPage(
        key: state.pageKey,
        child: const PaginatedEntityListScreen(
          title: 'Menyra Pageses',
          tableName: 'MenyraPageses',
        ),
      ),
    ),
    GoRoute(
      path: AppRoute.normativa.path,
      name: AppRoute.normativa.name,
      pageBuilder: (context, state) => NoTransitionPage(
        key: state.pageKey,
        child: const GenericEntityListScreen.basic(
          title: 'Normativa',
          tableName: 'Normativa',
        ),
      ),
    ),
    GoRoute(
      path: AppRoute.pagesat.path,
      name: AppRoute.pagesat.name,
      pageBuilder: (context, state) => NoTransitionPage(
        key: state.pageKey,
        child: const GenericEntityListScreen.basic(
          title: 'Pagesat',
          tableName: 'Pagesat',
        ),
      ),
    ),
    GoRoute(
      path: AppRoute.porosia.path,
      name: AppRoute.porosia.name,
      pageBuilder: (context, state) => NoTransitionPage(
        key: state.pageKey,
        child: const PaginatedEntityListScreen(
          title: 'Porosia',
          tableName: 'Porosia',
        ),
      ),
    ),
    GoRoute(
      path: AppRoute.porositeEBlerjes.path,
      name: AppRoute.porositeEBlerjes.name,
      pageBuilder: (context, state) => NoTransitionPage(
        key: state.pageKey,
        child: const GenericEntityListScreen.basic(
          title: 'Porosite e Blerjes',
          tableName: 'PorositeEBlerjes',
        ),
      ),
    ),
    GoRoute(
      path: AppRoute.shfrytezuesi.path,
      name: AppRoute.shfrytezuesi.name,
      pageBuilder: (context, state) => NoTransitionPage(
        key: state.pageKey,
        child: const PaginatedEntityListScreen(
          title: 'Shfrytezuesi',
          tableName: 'Shfrytezuesi',
        ),
      ),
    ),
    GoRoute(
      path: AppRoute.tavolina.path,
      name: AppRoute.tavolina.name,
      pageBuilder: (context, state) => NoTransitionPage(
        key: state.pageKey,
        child: const GenericEntityListScreen.basic(
          title: 'Tavolina',
          tableName: 'Tavolina',
        ),
      ),
    ),
    GoRoute(
      path: AppRoute.tvsh.path,
      name: AppRoute.tvsh.name,
      pageBuilder: (context, state) => NoTransitionPage(
        key: state.pageKey,
        child: const GenericEntityListScreen.basic(
          title: 'TVSH',
          tableName: 'TVSH',
        ),
      ),
    ),
    GoRoute(
      path: AppRoute.zRaportet.path,
      name: AppRoute.zRaportet.name,
      pageBuilder: (context, state) => NoTransitionPage(
        key: state.pageKey,
        child: const GenericEntityListScreen.basic(
          title: 'Z-Raportet',
          tableName: 'ZRaportet',
        ),
      ),
    ),
  ];
}

// Placeholder admin screens - these will be implemented in the next phases
class AdminTenantsScreen extends StatelessWidget {
  const AdminTenantsScreen({super.key});
  @override Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Admin - Tenants')),
    body: const Center(child: Text('Admin Tenants Screen - Coming Soon')),
  );
}

class CreateEditTenantScreen extends StatelessWidget {
  final int? tenantId;
  const CreateEditTenantScreen({super.key, this.tenantId});
  @override Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Create/Edit Tenant')),
    body: const Center(child: Text('Create/Edit Tenant Screen - Coming Soon')),
  );
}

class AdminUsersScreen extends StatelessWidget {
  const AdminUsersScreen({super.key});
  @override Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Admin - Users')),
    body: const Center(child: Text('Admin Users Screen - Coming Soon')),
  );
}

class CreateEditUserScreen extends StatelessWidget {
  final int? userId;
  const CreateEditUserScreen({super.key, this.userId});
  @override Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Create/Edit User')),
    body: const Center(child: Text('Create/Edit User Screen - Coming Soon')),
  );
}

class AdminRolesScreen extends StatelessWidget {
  const AdminRolesScreen({super.key});
  @override Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Admin - Roles')),
    body: const Center(child: Text('Admin Roles Screen - Coming Soon')),
  );
}

class AdminUserTenantsScreen extends StatelessWidget {
  const AdminUserTenantsScreen({super.key});
  @override Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Admin - User Tenants')),
    body: const Center(child: Text('Admin User Tenants Screen - Coming Soon')),
  );
}

// Basic placeholder screens for settings and profile
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  @override Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Settings')),
    body: const Center(child: Text('Settings Screen - Coming Soon')),
  );
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Profile')),
    body: const Center(child: Text('Profile Screen - Coming Soon')),
  );
}

class ErrorScreen extends StatelessWidget {
  final Exception? error;
  const ErrorScreen({super.key, this.error});
  @override Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Error')),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error, size: 64, color: Colors.red),
          const SizedBox(height: 16),
          Text('An error occurred:'),
          const SizedBox(height: 8),
          Text(error?.toString() ?? 'Unknown error'),
        ],
      ),
    ),
  );
}