import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/i18n/l10n.dart';
import '../../../core/theme/theme.dart';
import '../../common_lists/providers/entity_providers.dart';
import '../../../widgets/shimmer_box.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final isMobile = Breakpoints.isMobile(context);

    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(isMobile ? 16 : 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome section
            Text(
              l10n.overview,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              l10n.dataAsOf,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 24),

            // KPI Cards
            _buildKPISection(context, l10n, isMobile),
            const SizedBox(height: 32),

            // Charts section
            _buildChartsSection(context, l10n, isMobile),
            const SizedBox(height: 32),

            // Quick actions
            _buildQuickActionsSection(context, l10n, isMobile),
          ],
        ),
      ),
    );
  }

  Widget _buildKPISection(BuildContext context, AppLocalizations l10n, bool isMobile) {
    return Consumer(
      builder: (context, ref, child) {
        final dashboardStatsAsync = ref.watch(dashboardStatsProvider);
        
        return dashboardStatsAsync.when(
          data: (stats) {
            final kpis = [
              _KPIData(
                title: l10n.salesNet,
                value: '€${stats.today['SalesNet']?.toStringAsFixed(2) ?? '0.00'}',
                change: '+15.2%', // TODO: Calculate actual change
                isPositive: true,
                icon: Icons.trending_up,
              ),
              _KPIData(
                title: l10n.salesVat,
                value: '€${stats.today['SalesVat']?.toStringAsFixed(2) ?? '0.00'}',
                change: '+12.8%', // TODO: Calculate actual change
                isPositive: true,
                icon: Icons.receipt_long,
              ),
              _KPIData(
                title: l10n.purchasesNet,
                value: '€${stats.monthly['monthlyRevenue']?.toStringAsFixed(2) ?? '0.00'}',
                change: '-5.4%', // TODO: Calculate actual change
                isPositive: false,
                icon: Icons.shopping_cart,
              ),
              _KPIData(
                title: l10n.averageTicket,
                value: '€${stats.monthly['avgTicket']?.toStringAsFixed(2) ?? '0.00'}',
                change: '+8.9%', // TODO: Calculate actual change
                isPositive: true,
                icon: Icons.receipt,
              ),
            ];

            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: isMobile ? 2 : 4,
                childAspectRatio: isMobile ? 1.2 : 1.5,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: kpis.length,
              itemBuilder: (context, index) => _buildKPICard(context, kpis[index]),
            );
          },
          loading: () => _buildKPILoadingState(isMobile),
          error: (error, stackTrace) => _buildKPIErrorState(context, error),
        );
      },
    );
  }

  Widget _buildKPILoadingState(bool isMobile) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: isMobile ? 2 : 4,
        childAspectRatio: isMobile ? 1.2 : 1.5,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: 4,
      itemBuilder: (context, index) => ShimmerBox(
        height: 120,
        borderRadiusObject: BorderRadius.circular(12),
      ),
    );
  }

  Widget _buildKPIErrorState(BuildContext context, Object error) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.error_outline,
              size: 48,
              color: Theme.of(context).colorScheme.error,
            ),
            const SizedBox(height: 8),
            Text(
              'Failed to load dashboard data',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 4),
            Text(
              error.toString(),
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildKPICard(BuildContext context, _KPIData kpi) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  kpi.icon,
                  size: 24,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: kpi.isPositive
                        ? Theme.of(context).colorScheme.success.withOpacity(0.1)
                        : Theme.of(context).colorScheme.error.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    kpi.change,
                    style: TextStyle(
                      color: kpi.isPositive
                          ? Theme.of(context).colorScheme.success
                          : Theme.of(context).colorScheme.error,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              kpi.value,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              kpi.title,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChartsSection(BuildContext context, AppLocalizations l10n, bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Analytics',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        
        if (isMobile) ...[
          // Mobile: stack charts vertically
          _buildChartCard(context, l10n.dailySales, 'Sales trend over time'),
          const SizedBox(height: 16),
          _buildChartCard(context, l10n.paymentMix, 'Payment methods distribution'),
          const SizedBox(height: 16),
          _buildChartCard(context, l10n.topItems, 'Best selling products'),
        ] else ...[
          // Desktop/Tablet: grid layout
          Row(
            children: [
              Expanded(
                flex: 2,
                child: _buildChartCard(context, l10n.dailySales, 'Sales trend over time'),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildChartCard(context, l10n.paymentMix, 'Payment methods distribution'),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildChartCard(context, l10n.topItems, 'Best selling products'),
        ],
      ],
    );
  }

  Widget _buildChartCard(BuildContext context, String title, String description) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.3),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.bar_chart,
                      size: 48,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Chart coming soon',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActionsSection(BuildContext context, AppLocalizations l10n, bool isMobile) {
    final actions = [
      _QuickAction(
        title: l10n.invoice,
        description: 'View and manage invoices',
        icon: Icons.receipt,
        onTap: () {
          context.go('/fatura');
        },
      ),
      _QuickAction(
        title: l10n.purchases_,
        description: 'Track purchase orders',
        icon: Icons.shopping_cart,
        onTap: () {
          context.go('/blerjet');
        },
      ),
      _QuickAction(
        title: l10n.stock_,
        description: 'Monitor inventory levels',
        icon: Icons.inventory,
        onTap: () {
          context.go('/stoku');
        },
      ),
      _QuickAction(
        title: l10n.reports_,
        description: 'Generate business reports',
        icon: Icons.assessment,
        onTap: () {
          context.go('/zraportet');
        },
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quick Actions',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: isMobile ? 2 : 4,
            childAspectRatio: isMobile ? 1.0 : 1.2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: actions.length,
          itemBuilder: (context, index) => _buildQuickActionCard(context, actions[index]),
        ),
      ],
    );
  }

  Widget _buildQuickActionCard(BuildContext context, _QuickAction action) {
    return Card(
      child: InkWell(
        onTap: action.onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  action.icon,
                  size: 32,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                action.title,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              Text(
                action.description,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _KPIData {
  final String title;
  final String value;
  final String change;
  final bool isPositive;
  final IconData icon;

  const _KPIData({
    required this.title,
    required this.value,
    required this.change,
    required this.isPositive,
    required this.icon,
  });
}

class _QuickAction {
  final String title;
  final String description;
  final IconData icon;
  final VoidCallback onTap;

  const _QuickAction({
    required this.title,
    required this.description,
    required this.icon,
    required this.onTap,
  });
}