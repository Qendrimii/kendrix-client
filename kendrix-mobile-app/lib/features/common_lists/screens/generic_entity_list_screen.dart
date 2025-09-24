import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../providers/entity_providers.dart';
import '../../../core/i18n/l10n.dart';
import '../../../core/theme/theme.dart';
import '../../../widgets/empty_state.dart';
import '../../../widgets/error_view.dart';
import '../../../widgets/shimmer_box.dart';

class GenericEntityListScreen<T> extends ConsumerStatefulWidget {
  final String title;
  final String tableName;
  final StateNotifierProvider<EntityListNotifier<T>, AsyncValue<List<T>>> listProvider;
  final Widget Function(T entity, VoidCallback onTap) itemBuilder;
  final String emptyTitle;
  final String emptySubtitle;
  final String emptyActionText;
  final IconData emptyIcon;
  final VoidCallback? onCreatePressed;

  const GenericEntityListScreen({
    super.key,
    required this.title,
    required this.tableName,
    required this.listProvider,
    required this.itemBuilder,
    required this.emptyTitle,
    required this.emptySubtitle,
    required this.emptyActionText,
    required this.emptyIcon,
    this.onCreatePressed,
  });

  @override
  ConsumerState<GenericEntityListScreen<T>> createState() => _GenericEntityListScreenState<T>();
}

class _GenericEntityListScreenState<T> extends ConsumerState<GenericEntityListScreen<T>> {
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
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.read(widget.listProvider.notifier).refresh();
            },
          ),
          if (widget.onCreatePressed != null)
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: widget.onCreatePressed,
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
                          ref.read(widget.listProvider.notifier).search('');
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
                ref.read(widget.listProvider.notifier).search(value);
              },
            ),
          ),
          
          // List content
          Expanded(
            child: Consumer(
              builder: (context, ref, child) {
                final entityListAsync = ref.watch(widget.listProvider);
                
                return entityListAsync.when(
                  data: (entities) {
                    if (entities.isEmpty) {
                      return EmptyState(
                        icon: widget.emptyIcon,
                        title: widget.emptyTitle,
                        subtitle: widget.emptySubtitle,
                        action: widget.onCreatePressed != null
                            ? ElevatedButton.icon(
                                onPressed: widget.onCreatePressed,
                                icon: const Icon(Icons.add),
                                label: Text(widget.emptyActionText),
                              )
                            : null,
                      );
                    }
                    
                    return RefreshIndicator(
                      onRefresh: () async {
                        await ref.read(widget.listProvider.notifier).refresh();
                      },
                      child: ListView.builder(
                        padding: EdgeInsets.symmetric(
                          horizontal: isMobile ? 16 : 24,
                          vertical: 8,
                        ),
                        itemCount: entities.length,
                        itemBuilder: (context, index) {
                          final entity = entities[index];
                          return widget.itemBuilder(
                            entity,
                            () {
                              // TODO: Navigate to entity details
                            },
                          );
                        },
                      ),
                    );
                  },
                  loading: () => _buildLoadingState(isMobile),
                  error: (error, stackTrace) => ErrorView(
                    message: 'Failed to load data',
                    error: error.toString(),
                    onRetry: () {
                      ref.read(widget.listProvider.notifier).refresh();
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
