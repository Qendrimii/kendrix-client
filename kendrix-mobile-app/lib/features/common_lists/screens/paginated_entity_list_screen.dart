import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/networking/api_service.dart';
import '../providers/paginated_entity_providers.dart';

class PaginatedEntityListScreen extends ConsumerWidget {
  final String tableName;
  final String title;

  const PaginatedEntityListScreen({
    super.key,
    required this.tableName,
    required this.title,
  });

  StateNotifierProvider<PaginatedEntityNotifier<Map<String, dynamic>>, AsyncValue<PaginatedResponse<Map<String, dynamic>>>>? _getProviderForTable(String tableName) {
    switch (tableName) {
      case 'ArtikulliBaze':
        return paginatedArtikulliBazeProvider;
      case 'Fatura':
        return paginatedFaturaProvider;
      case 'Blerjet':
        return paginatedBlerjetProvider;
      case 'Stoku':
        return paginatedStokuProvider;
      case 'Subjektet':
        return paginatedSubjektetProvider;
      case 'BlerjeKategoria':
        return paginatedBlerjeKategoriaProvider;
      case 'FaturaKategoria':
        return paginatedFaturaKategoriaProvider;
      case 'Shfrytezuesi':
        return paginatedShfrytezuesiProvider;
      case 'MenyraPageses':
        return paginatedMenyraPageseProvider;
      case 'Porosia':
        return paginatedPorosiaProvider;
      case 'Kategoria':
        return paginatedKategoriaProvider;
      case 'TVSH':
        return paginatedTVSHProvider;
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = _getProviderForTable(tableName);
    
    if (provider == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: const Center(
          child: Text('Provider not found for this entity type.'),
        ),
      );
    }

    final dataState = ref.watch(provider);
    final notifier = ref.read(provider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => notifier.refresh(),
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => _showSearchDialog(context, notifier),
          ),
        ],
      ),
      body: dataState.when(
        data: (paginatedResponse) => _buildDataView(context, paginatedResponse, notifier),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => _buildErrorView(context, error, notifier),
      ),
    );
  }

  Widget _buildDataView(
    BuildContext context,
    PaginatedResponse<Map<String, dynamic>> paginatedResponse,
    PaginatedEntityNotifier<Map<String, dynamic>> notifier,
  ) {
    final items = paginatedResponse.data;
    final pagination = paginatedResponse.pagination;

    return Column(
      children: [
        // Search bar
        if (notifier.searchQuery.isNotEmpty)
          Container(
            padding: const EdgeInsets.all(8.0),
            color: Theme.of(context).primaryColor.withOpacity(0.1),
            child: Row(
              children: [
                const Icon(Icons.search),
                const SizedBox(width: 8),
                Text('Searching: "${notifier.searchQuery}"'),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    notifier.search('');
                  },
                ),
              ],
            ),
          ),
        
        // Pagination info
        Container(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Page ${pagination.currentPage} of ${pagination.totalPages}',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Text(
                '${pagination.totalItems} items total',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),

        // List of items
        Expanded(
          child: items.isEmpty
              ? const Center(
                  child: Text('No data available'),
                )
              : ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return _buildListItem(context, item, index);
                  },
                ),
        ),

        // Pagination controls
        _buildPaginationControls(context, pagination, notifier),
      ],
    );
  }

  Widget _buildListItem(BuildContext context, Map<String, dynamic> item, int index) {
    // Get the first few fields to display
    final displayFields = item.entries.take(3).toList();
    
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      child: ListTile(
        leading: CircleAvatar(
          child: Text('${index + 1}'),
        ),
        title: Text(
          _getItemTitle(item),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: displayFields.map((entry) {
            return Text(
              '${entry.key}: ${entry.value}',
              style: const TextStyle(fontSize: 12),
            );
          }).toList(),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () => _showItemDetails(context, item),
      ),
    );
  }

  String _getItemTitle(Map<String, dynamic> item) {
    // Try to find a reasonable title field
    final possibleTitleFields = [
      'emri', 'name', 'title', 'pershkrimi', 'description',
      'numri', 'number', 'id', 'kodi', 'code'
    ];
    
    for (final field in possibleTitleFields) {
      if (item.containsKey(field) && item[field] != null) {
        return item[field].toString();
      }
    }
    
    // Fallback to first non-null value
    final firstEntry = item.entries.firstWhere(
      (entry) => entry.value != null,
      orElse: () => MapEntry('unknown', 'No Title'),
    );
    
    return firstEntry.value.toString();
  }

  Widget _buildPaginationControls(
    BuildContext context,
    PaginationInfo pagination,
    PaginatedEntityNotifier<Map<String, dynamic>> notifier,
  ) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton.icon(
            onPressed: pagination.currentPage > 1 
                ? () => notifier.loadPreviousPage()
                : null,
            icon: const Icon(Icons.arrow_back),
            label: const Text('Previous'),
          ),
          
          Text(
            '${pagination.currentPage} / ${pagination.totalPages}',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          
          ElevatedButton.icon(
            onPressed: pagination.hasMore 
                ? () => notifier.loadNextPage()
                : null,
            icon: const Icon(Icons.arrow_forward),
            label: const Text('Next'),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorView(
    BuildContext context,
    Object error,
    PaginatedEntityNotifier<Map<String, dynamic>> notifier,
  ) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.error_outline,
            size: 64,
            color: Colors.red,
          ),
          const SizedBox(height: 16),
          Text(
            'Error loading data',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          Text(
            error.toString(),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () => notifier.refresh(),
            icon: const Icon(Icons.refresh),
            label: const Text('Retry'),
          ),
        ],
      ),
    );
  }

  void _showSearchDialog(
    BuildContext context,
    PaginatedEntityNotifier<Map<String, dynamic>> notifier,
  ) {
    final controller = TextEditingController(text: notifier.searchQuery);
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Search'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(
            labelText: 'Search query',
            hintText: 'Enter search terms...',
          ),
          autofocus: true,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              notifier.search(controller.text.trim());
              Navigator.of(context).pop();
            },
            child: const Text('Search'),
          ),
        ],
      ),
    );
  }

  void _showItemDetails(BuildContext context, Map<String, dynamic> item) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(_getItemTitle(item)),
        content: SizedBox(
          width: double.maxFinite,
          child: ListView(
            shrinkWrap: true,
            children: item.entries.map((entry) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 120,
                      child: Text(
                        '${entry.key}:',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      child: Text(entry.value?.toString() ?? 'null'),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
}