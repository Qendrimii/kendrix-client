import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../auth/auth_repository.dart';

enum AppRoute {
  login('/login'),
  dashboard('/dashboard'),
  tenantSelector('/tenant-selector'),
  
  // Admin routes
  adminTenants('/admin/tenants'),
  adminTenantCreate('/admin/tenants/create'),
  adminTenantEdit('/admin/tenants/:id/edit'),
  adminUsers('/admin/users'),
  adminUserCreate('/admin/users/create'),
  adminUserEdit('/admin/users/:id/edit'),
  adminRoles('/admin/roles'),
  adminUserTenants('/admin/user-tenants'),
  
  // Business data routes
  artikulliBaze('/artikulli-baze'),
  artikulliBazeDetail('/artikulli-baze/:id'),
  blerjeKategoria('/blerje-kategoria'),
  blerjet('/blerjet'),
  blerjetDetail('/blerjet/:id'),
  fatura('/fatura'),
  faturaDetail('/fatura/:id'),
  faturaKategoria('/fatura-kategoria'),
  kategoria('/kategoria'),
  materializedDaily('/materialized-daily'),
  menyraPageses('/menyra-pageses'),
  normativa('/normativa'),
  pagesat('/pagesat'),
  porosia('/porosia'),
  porositeEBlerjes('/porosite-e-blerjes'),
  shfrytezuesi('/shfrytezuesi'),
  stoku('/stoku'),
  subjektet('/subjektet'),
  subjektetDetail('/subjektet/:id'),
  tavolina('/tavolina'),
  tvsh('/tvsh'),
  zRaportet('/zraportet'),
  
  // Settings
  settings('/settings'),
  profile('/profile');

  const AppRoute(this.path);

  final String path;

  String get name => path.replaceAll('/', '_').replaceAll(':', '');
}

class RouteGuard {
  final Ref _ref;

  RouteGuard(this._ref);

  Future<String?> authGuard(GoRouterState state) async {
    print('🔐 Auth guard checking route: ${state.matchedLocation}');
    
    // Check auth state from provider instead of repository to avoid race conditions
    final authState = _ref.read(authStateProvider);
    final isAuth = authState.isAuthenticated;
    
    print('🔐 Authentication status: $isAuth for route: ${state.matchedLocation}');
    
    if (!isAuth) {
      // If not authenticated and not already on login page, redirect to login
      if (state.matchedLocation != AppRoute.login.path) {
        print('🔐 Not authenticated, redirecting to login from: ${state.matchedLocation}');
        return AppRoute.login.path;
      }
    } else {
      // If authenticated but on login page, redirect to dashboard
      if (state.matchedLocation == AppRoute.login.path) {
        print('🔐 Already authenticated on login page, redirecting to dashboard');
        return AppRoute.dashboard.path;
      }
    }

    print('🔐 Auth guard passed for route: ${state.matchedLocation}');
    return null;
  }

  Future<String?> adminGuard(GoRouterState state) async {
    final authRepository = _ref.read(authRepositoryProvider);
    final isAdmin = await authRepository.isAdmin();
    
    if (!isAdmin) {
      return AppRoute.dashboard.path;
    }

    return null;
  }

  Future<String?> tenantGuard(GoRouterState state) async {
    final authState = _ref.read(authStateProvider);
    
    // Skip tenant check for admin-only routes
    if (state.matchedLocation.startsWith('/admin/')) {
      return null;
    }

    // Skip tenant check for auth and tenant selector routes
    if (state.matchedLocation == AppRoute.login.path ||
        state.matchedLocation == AppRoute.tenantSelector.path) {
      return null;
    }

    // If user has multiple tenants but hasn't selected one, redirect to selector
    if (authState.tenants.length > 1 && authState.selectedTenantId == null) {
      return AppRoute.tenantSelector.path;
    }

    return null;
  }
}

final routeGuardProvider = Provider<RouteGuard>((ref) {
  return RouteGuard(ref);
});