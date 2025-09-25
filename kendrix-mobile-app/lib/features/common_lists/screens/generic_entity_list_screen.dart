import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../providers/entity_providers.dart';
import '../models/business_entities.dart';
import '../../../core/i18n/l10n.dart';
import '../../../core/theme/theme.dart';
import '../../../widgets/empty_state.dart';
import '../../../widgets/error_view.dart';
import '../../../widgets/shimmer_box.dart';

class GenericEntityListScreen extends ConsumerStatefulWidget {
  final String title;
  final String tableName;
  final String emptyTitle;
  final String emptySubtitle;
  final String emptyActionText;
  final IconData emptyIcon;
  final VoidCallback? onCreatePressed;

  const GenericEntityListScreen({
    super.key,
    required this.title,
    required this.tableName,
    required this.emptyTitle,
    required this.emptySubtitle,
    required this.emptyActionText,
    required this.emptyIcon,
    this.onCreatePressed,
  });

  // Named constructors for different entity types
  const GenericEntityListScreen.category({
    super.key,
    required this.title,
    required this.tableName,
    this.onCreatePressed,
  }) : emptyTitle = 'No categories found',
       emptySubtitle = 'Categories will appear here when available',
       emptyActionText = 'Add Category',
       emptyIcon = Icons.category;

  const GenericEntityListScreen.basic({
    super.key,
    required this.title,
    required this.tableName,
    this.onCreatePressed,
  }) : emptyTitle = 'No items found',
       emptySubtitle = 'Items will appear here when available',
       emptyActionText = 'Add Item',
       emptyIcon = Icons.list;

  const GenericEntityListScreen.user({
    super.key,
    required this.title,
    required this.tableName,
    this.onCreatePressed,
  }) : emptyTitle = 'No users found',
       emptySubtitle = 'Users will appear here when available',
       emptyActionText = 'Add User',
       emptyIcon = Icons.people;

  const GenericEntityListScreen.subject({
    super.key,
    required this.title,
    required this.tableName,
    this.onCreatePressed,
  }) : emptyTitle = 'No subjects found',
       emptySubtitle = 'Subjects will appear here when available',
       emptyActionText = 'Add Subject',
       emptyIcon = Icons.business;

  @override
  ConsumerState<GenericEntityListScreen> createState() => _GenericEntityListScreenState();
}

class _GenericEntityListScreenState extends ConsumerState<GenericEntityListScreen> {
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
              _refreshData();
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
              },
            ),
          ),
          
          // List content
          Expanded(
            child: _buildEntityList(isMobile),
          ),
        ],
      ),
    );
  }

  Widget _buildEntityList(bool isMobile) {
    // Get the appropriate provider based on table name
    final provider = _getProviderForTable(widget.tableName);
    
    if (provider == null) {
      return ErrorView(
        message: 'Unsupported table: ${widget.tableName}',
        error: 'No provider found for table ${widget.tableName}',
        onRetry: () {
          // Do nothing for unsupported tables
        },
      );
    }

    return Consumer(
      builder: (context, ref, child) {
        final entityListAsync = ref.watch(provider);
        
        return entityListAsync.when(
          data: (entities) {
            final filteredEntities = _filterEntities(entities);
            
            if (filteredEntities.isEmpty) {
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
                await _refreshData();
              },
              child: ListView.builder(
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? 16 : 24,
                  vertical: 8,
                ),
                itemCount: filteredEntities.length,
                itemBuilder: (context, index) {
                  final entity = filteredEntities[index];
                  return _buildEntityCard(entity);
                },
              ),
            );
          },
          loading: () => _buildLoadingState(isMobile),
          error: (error, stackTrace) => ErrorView(
            message: 'Failed to load ${widget.title}',
            error: error.toString(),
            onRetry: () {
              _refreshData();
            },
          ),
        );
      },
    );
  }

  // Get the appropriate provider based on table name
  ProviderBase? _getProviderForTable(String tableName) {
    switch (tableName) {
      case 'ArtikulliBaze':
        return artikulliBazeListProvider;
      case 'Fatura':
        return faturaListProvider;
      case 'Blerjet':
        return blerjetListProvider;
      case 'Stoku':
        return stokuListProvider;
      case 'Subjektet':
        return subjektetListProvider;
      case 'Kategoria':
        return kategoriaListProvider;
      case 'FaturaKategoria':
        return faturaKategoriaListProvider;
      case 'BlerjeKategoria':
        return blerjeKategoriaListProvider;
      case 'TVSH':
        return tvshListProvider;
      case 'Shfrytezuesi':
        return shfrytezuesiListProvider;
      case 'MenyraPageses':
        return menyraPageseListProvider;
      case 'Pagesat':
        return pagesatListProvider;
      case 'Porosia':
        return porosiaListProvider;
      case 'PorositeEBlerjes':
        return porositeEBlerjesListProvider;
      case 'Tavolina':
        return tavolinaListProvider;
      case 'Normativa':
        return normativaListProvider;
      case 'ZRaportet':
        return zRaportetListProvider;
      default:
        return null;
    }
  }

  // Filter entities based on search query
  List<dynamic> _filterEntities(List<dynamic> entities) {
    if (_searchQuery.isEmpty) {
      return entities;
    }
    
    return entities.where((entity) {
      final searchLower = _searchQuery.toLowerCase();
      
      // Try to match common fields
      if (entity is Map<String, dynamic>) {
        // Check name fields
        final name = entity['Emri'] ?? entity['Name'] ?? entity['name'] ?? '';
        if (name.toString().toLowerCase().contains(searchLower)) {
          return true;
        }
        
        // Check code/id fields
        final code = entity['Shifra'] ?? entity['Code'] ?? entity['code'] ?? '';
        if (code.toString().toLowerCase().contains(searchLower)) {
          return true;
        }
        
        // Check description fields
        final description = entity['Pershkrimi'] ?? entity['Description'] ?? entity['description'] ?? '';
        if (description.toString().toLowerCase().contains(searchLower)) {
          return true;
        }
      } else {
        // For objects with properties, try to get name/title properties
        try {
          final nameProperty = entity.toString().toLowerCase();
          if (nameProperty.contains(searchLower)) {
            return true;
          }
        } catch (e) {
          // Ignore errors
        }
      }
      
      return false;
    }).toList();
  }

  // Refresh data based on table name
  Future<void> _refreshData() async {
    switch (widget.tableName) {
      case 'ArtikulliBaze':
        ref.read(artikulliBazeListProvider.notifier).refresh();
        break;
      case 'Fatura':
        ref.read(faturaListProvider.notifier).refresh();
        break;
      case 'Blerjet':
        ref.read(blerjetListProvider.notifier).refresh();
        break;
      case 'Stoku':
        ref.read(stokuListProvider.notifier).refresh();
        break;
      case 'Subjektet':
        ref.read(subjektetListProvider.notifier).refresh();
        break;
      case 'Kategoria':
        ref.read(kategoriaListProvider.notifier).refresh();
        break;
      case 'FaturaKategoria':
        ref.read(faturaKategoriaListProvider.notifier).refresh();
        break;
      case 'BlerjeKategoria':
        ref.read(blerjeKategoriaListProvider.notifier).refresh();
        break;
      case 'TVSH':
        ref.read(tvshListProvider.notifier).refresh();
        break;
      case 'Shfrytezuesi':
        ref.read(shfrytezuesiListProvider.notifier).refresh();
        break;
      case 'MenyraPageses':
        ref.read(menyraPageseListProvider.notifier).refresh();
        break;
      case 'Pagesat':
        ref.read(pagesatListProvider.notifier).refresh();
        break;
      case 'Porosia':
        ref.read(porosiaListProvider.notifier).refresh();
        break;
      case 'PorositeEBlerjes':
        ref.read(porositeEBlerjesListProvider.notifier).refresh();
        break;
      case 'Tavolina':
        ref.read(tavolinaListProvider.notifier).refresh();
        break;
      case 'Normativa':
        ref.read(normativaListProvider.notifier).refresh();
        break;
      case 'ZRaportet':
        ref.read(zRaportetListProvider.notifier).refresh();
        break;
    }
  }

  // Build entity card based on data type
  Widget _buildEntityCard(dynamic entity) {
    if (entity is Map<String, dynamic>) {
      return _buildGenericCard(entity);
    }
    
    // For typed objects, try to extract basic information
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        title: Text(entity.toString()),
        onTap: () {
          // TODO: Navigate to entity details
        },
      ),
    );
  }

  // Build a generic card from map data
  Widget _buildGenericCard(Map<String, dynamic> data) {
    final name = data['Emri'] ?? data['Name'] ?? data['name'] ?? 'Unknown';
    final code = data['Shifra'] ?? data['Code'] ?? data['code'];
    final description = data['Pershkrimi'] ?? data['Description'] ?? data['description'];
    final active = data['Aktiv'] ?? data['Active'] ?? data['active'];
    
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        title: Text(name.toString()),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (code != null) Text('Code: $code'),
            if (description != null) Text('Description: $description'),
          ],
        ),
        trailing: active != null
            ? Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: (active == 1 || active == true ? Colors.green : Colors.red).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  active == 1 || active == true ? 'Active' : 'Inactive',
                  style: TextStyle(
                    color: active == 1 || active == true ? Colors.green : Colors.red,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            : null,
        onTap: () {
          // TODO: Navigate to entity details
        },
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
