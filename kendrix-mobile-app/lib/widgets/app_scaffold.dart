import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../core/i18n/l10n.dart';
import '../core/routing/route_guards.dart';
import '../core/theme/theme.dart';
import 'app_drawer.dart';

class AppScaffold extends ConsumerWidget {
  final Widget child;

  const AppScaffold({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMobile = Breakpoints.isMobile(context);
    final isTablet = Breakpoints.isTablet(context);

    return Scaffold(
      body: Row(
        children: [
          // Navigation rail for tablet and desktop
          if (!isMobile) _buildNavigationRail(context, ref),
          
          // Main content
          Expanded(
            child: Column(
              children: [
                _buildAppBar(context, ref),
                Expanded(child: child),
              ],
            ),
          ),
        ],
      ),
      
      // Bottom navigation for mobile
      bottomNavigationBar: isMobile ? _buildBottomNavigation(context, ref) : null,
      
      // Drawer for mobile
      drawer: isMobile ? const AppDrawer() : null,
    );
  }

  Widget _buildAppBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: _buildTitle(context),
      actions: [
        _buildTenantSelector(context, ref),
        const SizedBox(width: 8),
        _buildDateRangePicker(context, ref),
        const SizedBox(width: 8),
        _buildProfileButton(context, ref),
        const SizedBox(width: 16),
      ],
    );
  }

  Widget _buildTitle(BuildContext context) {
    // Extract title from current route
    final location = GoRouter.of(context).routerDelegate.currentConfiguration.fullPath;
    final l10n = context.l10n;
    
    String title = l10n.appTitle;
    if (location.contains('/dashboard')) title = l10n.dashboard;
    else if (location.contains('/admin/tenants')) title = l10n.tenants;
    else if (location.contains('/admin/users')) title = l10n.users;
    else if (location.contains('/admin/roles')) title = l10n.roles;
    else if (location.contains('/fatura')) title = l10n.invoice;
    else if (location.contains('/blerjet')) title = l10n.purchases_;
    else if (location.contains('/stoku')) title = l10n.stock_;
    else if (location.contains('/subjektet')) title = l10n.subjects;
    
    return Text(title);
  }

  Widget _buildTenantSelector(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);
    
    if (authState.tenants.length <= 1) {
      return const SizedBox.shrink();
    }

    final selectedTenant = authState.tenants.firstWhere(
      (tenant) => tenant['id'] == authState.selectedTenantId,
      orElse: () => authState.tenants.first,
    );

    return PopupMenuButton<int>(
      child: Chip(
        avatar: const Icon(Icons.business),
        label: Text(selectedTenant['name'] ?? 'Unknown'),
      ),
      itemBuilder: (context) => authState.tenants.map((tenant) {
        return PopupMenuItem<int>(
          value: tenant['id'] as int,
          child: Text(tenant['name'] ?? 'Unknown'),
        );
      }).toList(),
      onSelected: (tenantId) {
        ref.read(authStateProvider.notifier).selectTenant(tenantId);
      },
    );
  }

  Widget _buildDateRangePicker(BuildContext context, WidgetRef ref) {
    return IconButton(
      icon: const Icon(Icons.date_range),
      onPressed: () {
        // TODO: Implement date range picker
      },
      tooltip: context.l10n.dateRange,
    );
  }

  Widget _buildProfileButton(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);
    
    return PopupMenuButton(
      child: CircleAvatar(
        child: Text(
          authState.user?.displayName?.substring(0, 1).toUpperCase() ?? 
          authState.user?.email.substring(0, 1).toUpperCase() ?? 
          'U',
        ),
      ),
      itemBuilder: (context) => [
        PopupMenuItem(
          child: Text(context.l10n.profile),
          onTap: () => context.go(AppRoute.profile.path),
        ),
        PopupMenuItem(
          child: Text(context.l10n.settings),
          onTap: () => context.go(AppRoute.settings.path),
        ),
        const PopupMenuDivider(),
        PopupMenuItem(
          child: Text(context.l10n.logout),
          onTap: () => ref.read(authStateProvider.notifier).logout(),
        ),
      ],
    );
  }

  Widget _buildNavigationRail(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final authRepository = ref.watch(authRepositoryProvider);
    
    return FutureBuilder<bool>(
      future: authRepository.isAdmin(),
      builder: (context, snapshot) {
        final isAdmin = snapshot.data ?? false;
        
        return NavigationRail(
          extended: Breakpoints.isDesktop(context),
          destinations: [
            NavigationRailDestination(
              icon: const Icon(Icons.dashboard_outlined),
              selectedIcon: const Icon(Icons.dashboard),
              label: Text(l10n.dashboard),
            ),
            if (isAdmin) ...[
              NavigationRailDestination(
                icon: const Icon(Icons.business_outlined),
                selectedIcon: const Icon(Icons.business),
                label: Text(l10n.tenants),
              ),
              NavigationRailDestination(
                icon: const Icon(Icons.people_outlined),
                selectedIcon: const Icon(Icons.people),
                label: Text(l10n.users),
              ),
            ],
            NavigationRailDestination(
              icon: const Icon(Icons.receipt_outlined),
              selectedIcon: const Icon(Icons.receipt),
              label: Text(l10n.invoice),
            ),
            NavigationRailDestination(
              icon: const Icon(Icons.shopping_cart_outlined),
              selectedIcon: const Icon(Icons.shopping_cart),
              label: Text(l10n.purchases_),
            ),
            NavigationRailDestination(
              icon: const Icon(Icons.inventory_outlined),
              selectedIcon: const Icon(Icons.inventory),
              label: Text(l10n.stock_),
            ),
            NavigationRailDestination(
              icon: const Icon(Icons.assessment_outlined),
              selectedIcon: const Icon(Icons.assessment),
              label: Text(l10n.reports_),
            ),
          ],
          selectedIndex: _getSelectedIndex(context),
          onDestinationSelected: (index) => _onDestinationSelected(context, index, isAdmin),
        );
      },
    );
  }

  Widget _buildBottomNavigation(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    
    return NavigationBar(
      destinations: [
        NavigationDestination(
          icon: const Icon(Icons.dashboard_outlined),
          selectedIcon: const Icon(Icons.dashboard),
          label: l10n.dashboard,
        ),
        NavigationDestination(
          icon: const Icon(Icons.receipt_outlined),
          selectedIcon: const Icon(Icons.receipt),
          label: l10n.sales,
        ),
        NavigationDestination(
          icon: const Icon(Icons.shopping_cart_outlined),
          selectedIcon: const Icon(Icons.shopping_cart),
          label: l10n.purchases,
        ),
        NavigationDestination(
          icon: const Icon(Icons.inventory_outlined),
          selectedIcon: const Icon(Icons.inventory),
          label: l10n.stock,
        ),
      ],
      selectedIndex: _getSelectedMobileIndex(context),
      onDestinationSelected: (index) => _onMobileDestinationSelected(context, index),
    );
  }

  int _getSelectedIndex(BuildContext context) {
    final location = GoRouter.of(context).routerDelegate.currentConfiguration.fullPath;
    
    if (location.startsWith('/dashboard')) return 0;
    if (location.startsWith('/admin/tenants')) return 1;
    if (location.startsWith('/admin/users')) return 2;
    if (location.startsWith('/fatura')) return 3;
    if (location.startsWith('/blerjet')) return 4;
    if (location.startsWith('/stoku')) return 5;
    if (location.contains('report')) return 6;
    
    return 0;
  }

  int _getSelectedMobileIndex(BuildContext context) {
    final location = GoRouter.of(context).routerDelegate.currentConfiguration.fullPath;
    
    if (location.startsWith('/dashboard')) return 0;
    if (location.startsWith('/fatura')) return 1;
    if (location.startsWith('/blerjet')) return 2;
    if (location.startsWith('/stoku')) return 3;
    
    return 0;
  }

  void _onDestinationSelected(BuildContext context, int index, bool isAdmin) {
    switch (index) {
      case 0:
        context.go(AppRoute.dashboard.path);
        break;
      case 1:
        if (isAdmin) {
          context.go(AppRoute.adminTenants.path);
        } else {
          context.go(AppRoute.fatura.path);
        }
        break;
      case 2:
        if (isAdmin) {
          context.go(AppRoute.adminUsers.path);
        } else {
          context.go(AppRoute.blerjet.path);
        }
        break;
      case 3:
        context.go(isAdmin ? AppRoute.fatura.path : AppRoute.stoku.path);
        break;
      case 4:
        context.go(AppRoute.blerjet.path);
        break;
      case 5:
        context.go(AppRoute.stoku.path);
        break;
      case 6:
        context.go(AppRoute.zRaportet.path);
        break;
    }
  }

  void _onMobileDestinationSelected(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go(AppRoute.dashboard.path);
        break;
      case 1:
        context.go(AppRoute.fatura.path);
        break;
      case 2:
        context.go(AppRoute.blerjet.path);
        break;
      case 3:
        context.go(AppRoute.stoku.path);
        break;
    }
  }
}

import 'package:go_router/go_router.dart';
import '../core/auth/auth_repository.dart';