import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../models/artikulli_baze.dart';
import '../providers/entity_providers.dart';
import '../../../core/i18n/l10n.dart';
import '../../../core/theme/theme.dart';
import 'generic_entity_list_screen.dart';

class ArtikulliBazeListScreen extends ConsumerWidget {
  const ArtikulliBazeListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    
    return const GenericEntityListScreen.basic(
      title: 'Products',
      tableName: 'ArtikulliBaze',
    );
  }
}

class _ArtikulliBazeCard extends StatelessWidget {
  final ArtikulliBaze artikulli;
  final VoidCallback onTap;

  const _ArtikulliBazeCard({
    required this.artikulli,
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
                      artikulli.name ?? 'Unknown Product',
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
                      color: (artikulli.active == true ? Colors.green : Colors.red).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      artikulli.active == true ? 'Active' : 'Inactive',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: artikulli.active == true ? Colors.green : Colors.red,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 8),
              
              // Code and price row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (artikulli.code != null)
                    Text(
                      'Code: ${artikulli.code}',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  if (artikulli.sellingPricePerPiece != null)
                    Text(
                      '€${artikulli.sellingPricePerPiece!.toStringAsFixed(2)}',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                ],
              ),
              
              if (artikulli.unit != null) ...[
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(
                      Icons.straighten,
                      size: 16,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Unit: ${artikulli.unit}',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ],
              
              if (artikulli.barcode != null) ...[
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
                      'Barcode: ${artikulli.barcode}',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ],
              
              if (artikulli.category?.name != null) ...[
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(
                      Icons.category,
                      size: 16,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Category: ${artikulli.category!.name}',
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
}
