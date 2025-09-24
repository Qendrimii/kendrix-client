import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/auth/auth_repository.dart';
import '../../../core/i18n/l10n.dart';
import '../../../core/routing/route_guards.dart';

class TenantSelectorScreen extends ConsumerWidget {
  const TenantSelectorScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final authState = ref.watch(authStateProvider);

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Header
                Icon(
                  Icons.business,
                  size: 64,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(height: 24),
                Text(
                  l10n.selectTenant,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  l10n.multipleTenants,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),

                // Tenant list
                ...authState.tenants.map((tenant) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Text(
                            (tenant['name'] as String?)?.substring(0, 1).toUpperCase() ?? 'T',
                          ),
                        ),
                        title: Text(tenant['name'] ?? 'Unknown Tenant'),
                        subtitle: tenant['external_key'] != null
                            ? Text('Key: ${tenant['external_key']}')
                            : null,
                        trailing: const Icon(Icons.arrow_forward_ios),
                        onTap: () async {
                          await ref.read(authStateProvider.notifier).selectTenant(
                                tenant['id'] as int,
                              );
                          
                          if (context.mounted) {
                            context.go(AppRoute.dashboard.path);
                          }
                        },
                      ),
                    ),
                  );
                }).toList(),

                const SizedBox(height: 32),

                // Logout option
                OutlinedButton(
                  onPressed: () async {
                    await ref.read(authStateProvider.notifier).logout();
                  },
                  child: Text(l10n.logout),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}