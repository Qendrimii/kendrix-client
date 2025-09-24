import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../models/blerjet.dart';
import '../providers/entity_providers.dart';
import '../../../core/i18n/l10n.dart';
import '../../../core/theme/theme.dart';
import '../../../widgets/empty_state.dart';
import '../../../widgets/error_view.dart';
import '../../../widgets/shimmer_box.dart';

class BlerjetListScreen extends ConsumerStatefulWidget {
  const BlerjetListScreen({super.key});

  @override
  ConsumerState<BlerjetListScreen> createState() => _BlerjetListScreenState();
}

class _BlerjetListScreenState extends ConsumerState<BlerjetListScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final isMobile = Breakpoints.isMobile(context);
    
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.purchases_),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.read(blerjetListProvider.notifier).refresh();
            },
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // TODO: Navigate to create blerjet screen
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: EdgeInsets.all(isMobile ? 16 : 24),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: l10n.search,
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _searchQuery.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                          setState(() {
                            _searchQuery = '';
                          });
                          ref.read(blerjetListProvider.notifier).search('');
                        },
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
                ref.read(blerjetListProvider.notifier).search(value);
              },
            ),
          ),
          
          // List content
          Expanded(
            child: Consumer(
              builder: (context, ref, child) {
                final blerjetListAsync = ref.watch(blerjetListProvider);
                
                return blerjetListAsync.when(
                  data: (blerjet) {
                    if (blerjet.isEmpty) {
                      return EmptyState(
                        icon: Icons.shopping_cart,
                        title: l10n.noPurchases,
                        subtitle: l10n.noPurchasesSubtitle,
                        action: ElevatedButton.icon(
                          onPressed: () {
                            // TODO: Navigate to create blerjet screen
                          },
                          icon: const Icon(Icons.add),
                          label: Text(l10n.createPurchase),
                        ),
                      );
                    }
                    
                    return RefreshIndicator(
                      onRefresh: () async {
                        await ref.read(blerjetListProvider.notifier).refresh();
                      },
                      child: ListView.builder(
                        padding: EdgeInsets.symmetric(
                          horizontal: isMobile ? 16 : 24,
                          vertical: 8,
                        ),
                        itemCount: blerjet.length,
                        itemBuilder: (context, index) {
                          final blerja = blerjet[index];
                          return _BlerjetCard(
                            blerja: blerja,
                            onTap: () {
                              // TODO: Navigate to blerjet details
                            },
                          );
                        },
                      ),
                    );
                  },
                  loading: () => _buildLoadingState(isMobile),
                  error: (error, stackTrace) => ErrorView(
                    message: 'Failed to load purchases',
                    error: error.toString(),
                    onRetry: () {
                      ref.read(blerjetListProvider.notifier).refresh();
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingState(bool isMobile) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 24,
        vertical: 8,
      ),
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: ShimmerBox(
            height: 120,
            borderRadiusObject: BorderRadius.circular(12),
          ),
        );
      },
    );
  }
}

class _BlerjetCard extends StatelessWidget {
  final Blerjet blerja;
  final VoidCallback onTap;

  const _BlerjetCard({
    required this.blerja,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isMobile = Breakpoints.isMobile(context);
    
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: EdgeInsets.all(isMobile ? 16 : 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      blerja.purchaseNumber ?? 'N/A',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: _getStatusColor(blerja.statusId).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      _getStatusText(blerja.statusId),
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: _getStatusColor(blerja.statusId),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 8),
              
              // Date and amount row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    blerja.date != null
                        ? '${blerja.date!.day}/${blerja.date!.month}/${blerja.date!.year}'
                        : 'N/A',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  Text(
                    blerja.totalOrdersFinal != null
                        ? '€${blerja.totalOrdersFinal!.toStringAsFixed(2)}'
                        : 'N/A',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                ],
              ),
              
              if (blerja.supplier?.name != null) ...[
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(
                      Icons.business,
                      size: 16,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        blerja.supplier!.name!,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
              
              if (blerja.supplierInvoiceNumber != null) ...[
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(
                      Icons.receipt_long,
                      size: 16,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Supplier: ${blerja.supplierInvoiceNumber}',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Color _getStatusColor(int? statusId) {
    switch (statusId) {
      case 1:
        return Colors.green; // Completed
      case 2:
        return Colors.orange; // Pending
      case 3:
        return Colors.red; // Cancelled
      default:
        return Colors.grey;
    }
  }

  String _getStatusText(int? statusId) {
    switch (statusId) {
      case 1:
        return 'Completed';
      case 2:
        return 'Pending';
      case 3:
        return 'Cancelled';
      default:
        return 'Unknown';
    }
  }
}
