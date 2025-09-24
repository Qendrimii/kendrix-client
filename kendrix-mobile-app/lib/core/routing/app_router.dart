import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../features/auth/screens/login_screen.dart';
import '../../features/dashboard/screens/dashboard_screen.dart';
import '../../features/tenant_switcher/screens/tenant_selector_screen.dart';
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
              child: const ArtikulliBazeListScreen(),
            ),
            routes: [
              GoRoute(
                path: ':id',
                name: AppRoute.artikulliBazeDetail.name,
                pageBuilder: (context, state) => MaterialPage(
                  key: state.pageKey,
                  child: ArtikulliBazeDetailScreen(
                    id: int.parse(state.pathParameters['id']!),
                  ),
                ),
              ),
            ],
          ),

          GoRoute(
            path: AppRoute.blerjeKategoria.path,
            name: AppRoute.blerjeKategoria.name,
            pageBuilder: (context, state) => NoTransitionPage(
              key: state.pageKey,
              child: const BlerjeKategoriaListScreen(),
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
                  child: BlerjetDetailScreen(
                    id: int.parse(state.pathParameters['id']!),
                  ),
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
                  child: FaturaDetailScreen(
                    id: int.parse(state.pathParameters['id']!),
                  ),
                ),
              ),
            ],
          ),

          GoRoute(
            path: AppRoute.subjektet.path,
            name: AppRoute.subjektet.name,
            pageBuilder: (context, state) => NoTransitionPage(
              key: state.pageKey,
              child: const SubjektetListScreen(),
            ),
            routes: [
              GoRoute(
                path: ':id',
                name: AppRoute.subjektetDetail.name,
                pageBuilder: (context, state) => MaterialPage(
                  key: state.pageKey,
                  child: SubjektetDetailScreen(
                    id: int.parse(state.pathParameters['id']!),
                  ),
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
        child: const FaturaKategoriaListScreen(),
      ),
    ),
    GoRoute(
      path: AppRoute.kategoria.path,
      name: AppRoute.kategoria.name,
      pageBuilder: (context, state) => NoTransitionPage(
        key: state.pageKey,
        child: const KategoriaListScreen(),
      ),
    ),
    GoRoute(
      path: AppRoute.materializedDaily.path,
      name: AppRoute.materializedDaily.name,
      pageBuilder: (context, state) => NoTransitionPage(
        key: state.pageKey,
        child: const MaterializedDailyListScreen(),
      ),
    ),
    GoRoute(
      path: AppRoute.menyraPageses.path,
      name: AppRoute.menyraPageses.name,
      pageBuilder: (context, state) => NoTransitionPage(
        key: state.pageKey,
        child: const MenyraPagesestListScreen(),
      ),
    ),
    GoRoute(
      path: AppRoute.normativa.path,
      name: AppRoute.normativa.name,
      pageBuilder: (context, state) => NoTransitionPage(
        key: state.pageKey,
        child: const NormativaListScreen(),
      ),
    ),
    GoRoute(
      path: AppRoute.pagesat.path,
      name: AppRoute.pagesat.name,
      pageBuilder: (context, state) => NoTransitionPage(
        key: state.pageKey,
        child: const PagesatListScreen(),
      ),
    ),
    GoRoute(
      path: AppRoute.porosia.path,
      name: AppRoute.porosia.name,
      pageBuilder: (context, state) => NoTransitionPage(
        key: state.pageKey,
        child: const PorosiaListScreen(),
      ),
    ),
    GoRoute(
      path: AppRoute.porositeEBlerjes.path,
      name: AppRoute.porositeEBlerjes.name,
      pageBuilder: (context, state) => NoTransitionPage(
        key: state.pageKey,
        child: const PorositeEBlerjesListScreen(),
      ),
    ),
    GoRoute(
      path: AppRoute.shfrytezuesi.path,
      name: AppRoute.shfrytezuesi.name,
      pageBuilder: (context, state) => NoTransitionPage(
        key: state.pageKey,
        child: const ShfrytezuesiListScreen(),
      ),
    ),
    GoRoute(
      path: AppRoute.stoku.path,
      name: AppRoute.stoku.name,
      pageBuilder: (context, state) => NoTransitionPage(
        key: state.pageKey,
        child: const StokuListScreen(),
      ),
    ),
    GoRoute(
      path: AppRoute.tavolina.path,
      name: AppRoute.tavolina.name,
      pageBuilder: (context, state) => NoTransitionPage(
        key: state.pageKey,
        child: const TavolinaListScreen(),
      ),
    ),
    GoRoute(
      path: AppRoute.tvsh.path,
      name: AppRoute.tvsh.name,
      pageBuilder: (context, state) => NoTransitionPage(
        key: state.pageKey,
        child: const TVSHListScreen(),
      ),
    ),
    GoRoute(
      path: AppRoute.zRaportet.path,
      name: AppRoute.zRaportet.name,
      pageBuilder: (context, state) => NoTransitionPage(
        key: state.pageKey,
        child: const ZRaportetListScreen(),
      ),
    ),
  ];
}

// Placeholder screens - these will be implemented in the next phases
class AdminTenantsScreen extends StatelessWidget {
  const AdminTenantsScreen({super.key});
  @override Widget build(BuildContext context) => const Placeholder();
}

class CreateEditTenantScreen extends StatelessWidget {
  final int? tenantId;
  const CreateEditTenantScreen({super.key, this.tenantId});
  @override Widget build(BuildContext context) => const Placeholder();
}

class AdminUsersScreen extends StatelessWidget {
  const AdminUsersScreen({super.key});
  @override Widget build(BuildContext context) => const Placeholder();
}

class CreateEditUserScreen extends StatelessWidget {
  final int? userId;
  const CreateEditUserScreen({super.key, this.userId});
  @override Widget build(BuildContext context) => const Placeholder();
}

class AdminRolesScreen extends StatelessWidget {
  const AdminRolesScreen({super.key});
  @override Widget build(BuildContext context) => const Placeholder();
}

class AdminUserTenantsScreen extends StatelessWidget {
  const AdminUserTenantsScreen({super.key});
  @override Widget build(BuildContext context) => const Placeholder();
}

class ArtikulliBazeListScreen extends StatelessWidget {
  const ArtikulliBazeListScreen({super.key});
  @override Widget build(BuildContext context) => const Placeholder();
}

class ArtikulliBazeDetailScreen extends StatelessWidget {
  final int id;
  const ArtikulliBazeDetailScreen({super.key, required this.id});
  @override Widget build(BuildContext context) => const Placeholder();
}

class BlerjeKategoriaListScreen extends StatelessWidget {
  const BlerjeKategoriaListScreen({super.key});
  @override Widget build(BuildContext context) => const Placeholder();
}

class BlerjetListScreen extends StatelessWidget {
  const BlerjetListScreen({super.key});
  @override Widget build(BuildContext context) => const Placeholder();
}

class BlerjetDetailScreen extends StatelessWidget {
  final int id;
  const BlerjetDetailScreen({super.key, required this.id});
  @override Widget build(BuildContext context) => const Placeholder();
}

class FaturaListScreen extends StatelessWidget {
  const FaturaListScreen({super.key});
  @override Widget build(BuildContext context) => const Placeholder();
}

class FaturaDetailScreen extends StatelessWidget {
  final int id;
  const FaturaDetailScreen({super.key, required this.id});
  @override Widget build(BuildContext context) => const Placeholder();
}

class FaturaKategoriaListScreen extends StatelessWidget {
  const FaturaKategoriaListScreen({super.key});
  @override Widget build(BuildContext context) => const Placeholder();
}

class KategoriaListScreen extends StatelessWidget {
  const KategoriaListScreen({super.key});
  @override Widget build(BuildContext context) => const Placeholder();
}

class MaterializedDailyListScreen extends StatelessWidget {
  const MaterializedDailyListScreen({super.key});
  @override Widget build(BuildContext context) => const Placeholder();
}

class MenyraPagesestListScreen extends StatelessWidget {
  const MenyraPagesestListScreen({super.key});
  @override Widget build(BuildContext context) => const Placeholder();
}

class NormativaListScreen extends StatelessWidget {
  const NormativaListScreen({super.key});
  @override Widget build(BuildContext context) => const Placeholder();
}

class PagesatListScreen extends StatelessWidget {
  const PagesatListScreen({super.key});
  @override Widget build(BuildContext context) => const Placeholder();
}

class PorosiaListScreen extends StatelessWidget {
  const PorosiaListScreen({super.key});
  @override Widget build(BuildContext context) => const Placeholder();
}

class PorositeEBlerjesListScreen extends StatelessWidget {
  const PorositeEBlerjesListScreen({super.key});
  @override Widget build(BuildContext context) => const Placeholder();
}

class ShfrytezuesiListScreen extends StatelessWidget {
  const ShfrytezuesiListScreen({super.key});
  @override Widget build(BuildContext context) => const Placeholder();
}

class StokuListScreen extends StatelessWidget {
  const StokuListScreen({super.key});
  @override Widget build(BuildContext context) => const Placeholder();
}

class SubjektetListScreen extends StatelessWidget {
  const SubjektetListScreen({super.key});
  @override Widget build(BuildContext context) => const Placeholder();
}

class SubjektetDetailScreen extends StatelessWidget {
  final int id;
  const SubjektetDetailScreen({super.key, required this.id});
  @override Widget build(BuildContext context) => const Placeholder();
}

class TavolinaListScreen extends StatelessWidget {
  const TavolinaListScreen({super.key});
  @override Widget build(BuildContext context) => const Placeholder();
}

class TVSHListScreen extends StatelessWidget {
  const TVSHListScreen({super.key});
  @override Widget build(BuildContext context) => const Placeholder();
}

class ZRaportetListScreen extends StatelessWidget {
  const ZRaportetListScreen({super.key});
  @override Widget build(BuildContext context) => const Placeholder();
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  @override Widget build(BuildContext context) => const Placeholder();
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override Widget build(BuildContext context) => const Placeholder();
}

class ErrorScreen extends StatelessWidget {
  final Exception? error;
  const ErrorScreen({super.key, this.error});
  @override Widget build(BuildContext context) => Scaffold(
    body: Center(
      child: Text('Error: ${error.toString()}'),
    ),
  );
}