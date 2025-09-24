import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../models/fatura.dart';
import '../providers/entity_providers.dart';
import '../../../core/i18n/l10n.dart';
import '../../../core/theme/theme.dart';
import '../../../widgets/empty_state.dart';
import '../../../widgets/error_view.dart';
import '../../../widgets/shimmer_box.dart';

class FaturaListScreen extends ConsumerStatefulWidget {
  const FaturaListScreen({super.key});

  @override
  ConsumerState<FaturaListScreen> createState() => _FaturaListScreenState();
}

class _FaturaListScreenState extends ConsumerState<FaturaListScreen> {
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
        title: Text(l10n.invoice),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.read(faturaListProvider.notifier).refresh();
            },
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // TODO: Navigate to create fatura screen
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
                          ref.read(faturaListProvider.notifier).search('');
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
                ref.read(faturaListProvider.notifier).search(value);
              },
            ),
          ),
          
          // List content
          Expanded(
            child: Consumer(
              builder: (context, ref, child) {
                final faturaListAsync = ref.watch(faturaListProvider);
                
                return faturaListAsync.when(
                  data: (faturat) {
                    if (faturat.isEmpty) {
                      return EmptyState(
                        icon: Icons.receipt,
                        title: l10n.noInvoices,
                        subtitle: l10n.noInvoicesSubtitle,
                        action: ElevatedButton.icon(
                          onPressed: () {
                            // TODO: Navigate to create fatura screen
                          },
                          icon: const Icon(Icons.add),
                          label: Text(l10n.createInvoice),
                        ),
                      );
                    }
                    
                    return RefreshIndicator(
                      onRefresh: () async {
                        await ref.read(faturaListProvider.notifier).refresh();
                      },
                      child: ListView.builder(
                        padding: EdgeInsets.symmetric(
                          horizontal: isMobile ? 16 : 24,
                          vertical: 8,
                        ),
                        itemCount: faturat.length,
                        itemBuilder: (context, index) {
                          final fatura = faturat[index];
                          return _FaturaCard(
                            fatura: fatura,
                            onTap: () {
                              // TODO: Navigate to fatura details
                            },
                          );
                        },
                      ),
                    );
                  },
                  loading: () => _buildLoadingState(isMobile),
                  error: (error, stackTrace) => ErrorView(
                    message: 'Failed to load invoices',
                    error: error.toString(),
                    onRetry: () {
                      ref.read(faturaListProvider.notifier).refresh();
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

class _FaturaCard extends StatelessWidget {
  final Fatura fatura;
  final VoidCallback onTap;

  const _FaturaCard({
    required this.fatura,
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
                      fatura.invoiceNumber ?? 'N/A',
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
                      color: _getStatusColor(fatura.status).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      fatura.status ?? 'Unknown',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: _getStatusColor(fatura.status),
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
                    fatura.date != null
                        ? '${fatura.date!.day}/${fatura.date!.month}/${fatura.date!.year}'
                        : 'N/A',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  Text(
                    fatura.total != null
                        ? '€${fatura.total!.toStringAsFixed(2)}'
                        : 'N/A',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                ],
              ),
              
              if (fatura.subject?.name != null) ...[
                const SizedBox(height: 8),
                Text(
                  fatura.subject!.name!,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Color _getStatusColor(String? status) {
    switch (status?.toLowerCase()) {
      case 'paid':
      case 'completed':
        return Colors.green;
      case 'pending':
      case 'draft':
        return Colors.orange;
      case 'cancelled':
      case 'void':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}
