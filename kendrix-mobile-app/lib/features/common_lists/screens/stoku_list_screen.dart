import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../models/business_entities.dart';
import '../providers/entity_providers.dart';
import '../../../core/i18n/l10n.dart';
import '../../../core/theme/theme.dart';
import '../../../widgets/empty_state.dart';
import '../../../widgets/error_view.dart';
import '../../../widgets/shimmer_box.dart';

class StokuListScreen extends ConsumerStatefulWidget {
  const StokuListScreen({super.key});

  @override
  ConsumerState<StokuListScreen> createState() => _StokuListScreenState();
}

class _StokuListScreenState extends ConsumerState<StokuListScreen> {
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
        title: Text(l10n.stock_),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.read(stokuListProvider.notifier).refresh();
            },
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // TODO: Navigate to create stoku screen
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
                          ref.read(stokuListProvider.notifier).search('');
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
                ref.read(stokuListProvider.notifier).search(value);
              },
            ),
          ),
          
          // List content
          Expanded(
            child: Consumer(
              builder: (context, ref, child) {
                final stokuListAsync = ref.watch(stokuListProvider);
                
                return stokuListAsync.when(
                  data: (stoku) {
                    if (stoku.isEmpty) {
                      return EmptyState(
                        icon: Icons.inventory,
                        title: l10n.noStock,
                        subtitle: l10n.noStockSubtitle,
                        action: ElevatedButton.icon(
                          onPressed: () {
                            // TODO: Navigate to create stoku screen
                          },
                          icon: const Icon(Icons.add),
                          label: Text(l10n.addStock),
                        ),
                      );
                    }
                    
                    return RefreshIndicator(
                      onRefresh: () async {
                        await ref.read(stokuListProvider.notifier).refresh();
                      },
                      child: ListView.builder(
                        padding: EdgeInsets.symmetric(
                          horizontal: isMobile ? 16 : 24,
                          vertical: 8,
                        ),
                        itemCount: stoku.length,
                        itemBuilder: (context, index) {
                          final stockItem = stoku[index];
                          return _StokuCard(
                            stockItem: stockItem,
                            onTap: () {
                              // TODO: Navigate to stoku details
                            },
                          );
                        },
                      ),
                    );
                  },
                  loading: () => _buildLoadingState(isMobile),
                  error: (error, stackTrace) => ErrorView(
                    message: 'Failed to load stock',
                    error: error.toString(),
                    onRetry: () {
                      ref.read(stokuListProvider.notifier).refresh();
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

class _StokuCard extends StatelessWidget {
  final Stoku stockItem;
  final VoidCallback onTap;

  const _StokuCard({
    required this.stockItem,
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
                      stockItem.article?.name ?? 'Unknown Product',
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
                      color: _getStockStatusColor(stockItem.quantityInStock, stockItem.article?.minimumQuantity).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      _getStockStatusText(stockItem.quantityInStock, stockItem.article?.minimumQuantity),
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: _getStockStatusColor(stockItem.quantityInStock, stockItem.article?.minimumQuantity),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 8),
              
              // Quantity and location row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Quantity: ${stockItem.quantityInStock?.toStringAsFixed(2) ?? 'N/A'}',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                      if (stockItem.location != null && stockItem.location != '-')
                        Text(
                          'Location: ${stockItem.location}',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                    ],
                  ),
                  if (stockItem.article?.sellingPricePerPiece != null)
                    Text(
                      '€${stockItem.article!.sellingPricePerPiece!.toStringAsFixed(2)}',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                ],
              ),
              
              if (stockItem.article?.code != null) ...[
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(
                      Icons.qr_code,
                      size: 16,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Code: ${stockItem.article!.code}',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ],
              
              if (stockItem.article?.barcode != null) ...[
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(
                      Icons.barcode_reader,
                      size: 16,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Barcode: ${stockItem.article!.barcode}',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
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

  Color _getStockStatusColor(double? quantity, double? minimumQuantity) {
    if (quantity == null) return Colors.grey;
    if (minimumQuantity == null) return Colors.blue;
    
    if (quantity <= 0) {
      return Colors.red; // Out of stock
    } else if (quantity <= minimumQuantity) {
      return Colors.orange; // Low stock
    } else {
      return Colors.green; // In stock
    }
  }

  String _getStockStatusText(double? quantity, double? minimumQuantity) {
    if (quantity == null) return 'Unknown';
    if (minimumQuantity == null) return 'In Stock';
    
    if (quantity <= 0) {
      return 'Out of Stock';
    } else if (quantity <= minimumQuantity) {
      return 'Low Stock';
    } else {
      return 'In Stock';
    }
  }
}
