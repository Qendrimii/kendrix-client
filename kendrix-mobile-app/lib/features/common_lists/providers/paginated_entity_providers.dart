import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/networking/api_service.dart';
import 'entity_providers.dart'; // Import for apiServiceProvider

// Paginated providers for entities
class PaginatedEntityNotifier<T> extends StateNotifier<AsyncValue<PaginatedResponse<T>>> {
  final ApiService _apiService;
  final String _tableName;
  final T Function(dynamic) _fromJson;
  
  int _currentPage = 1;
  static const int _pageSize = 25;
  String _searchQuery = '';
  
  PaginatedEntityNotifier(
    this._apiService,
    this._tableName,
    this._fromJson,
  ) : super(const AsyncValue.loading()) {
    loadFirstPage();
  }

  int get currentPage => _currentPage;
  int get pageSize => _pageSize;
  String get searchQuery => _searchQuery;
  
  Future<void> loadFirstPage() async {
    _currentPage = 1;
    await _loadPage(_currentPage);
  }

  Future<void> loadNextPage() async {
    final currentData = state.value;
    if (currentData?.pagination.hasMore == true) {
      _currentPage++;
      await _loadPage(_currentPage);
    }
  }

  Future<void> loadPreviousPage() async {
    if (_currentPage > 1) {
      _currentPage--;
      await _loadPage(_currentPage);
    }
  }

  Future<void> search(String query) async {
    _searchQuery = query;
    _currentPage = 1;
    await _loadPage(_currentPage);
  }

  Future<void> refresh() async {
    await _loadPage(_currentPage);
  }

  Future<void> _loadPage(int page) async {
    try {
      state = const AsyncValue.loading();
      
      final response = await _apiService.getEntities<T>(
        _tableName,
        page: page,
        limit: _pageSize,
        search: _searchQuery.isNotEmpty ? _searchQuery : null,
        fromJson: _fromJson,
      );

      if (response.success && response.data != null) {
        state = AsyncValue.data(response.data!);
      } else {
        state = AsyncValue.error(
          Exception(response.error ?? 'Failed to load $_tableName'),
          StackTrace.current,
        );
      }
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }
}

// Create providers for each entity type with pagination
final paginatedArtikulliBazeProvider = StateNotifierProvider<PaginatedEntityNotifier<Map<String, dynamic>>, AsyncValue<PaginatedResponse<Map<String, dynamic>>>>((ref) {
  return PaginatedEntityNotifier<Map<String, dynamic>>(
    ref.watch(apiServiceProvider),
    'ArtikulliBaze',
    (data) => data,
  );
});

final paginatedFaturaProvider = StateNotifierProvider<PaginatedEntityNotifier<Map<String, dynamic>>, AsyncValue<PaginatedResponse<Map<String, dynamic>>>>((ref) {
  return PaginatedEntityNotifier<Map<String, dynamic>>(
    ref.watch(apiServiceProvider),
    'Fatura',
    (data) => data,
  );
});

final paginatedBlerjetProvider = StateNotifierProvider<PaginatedEntityNotifier<Map<String, dynamic>>, AsyncValue<PaginatedResponse<Map<String, dynamic>>>>((ref) {
  return PaginatedEntityNotifier<Map<String, dynamic>>(
    ref.watch(apiServiceProvider),
    'Blerjet',
    (data) => data,
  );
});

final paginatedStokuProvider = StateNotifierProvider<PaginatedEntityNotifier<Map<String, dynamic>>, AsyncValue<PaginatedResponse<Map<String, dynamic>>>>((ref) {
  return PaginatedEntityNotifier<Map<String, dynamic>>(
    ref.watch(apiServiceProvider),
    'Stoku',
    (data) => data,
  );
});

final paginatedSubjektetProvider = StateNotifierProvider<PaginatedEntityNotifier<Map<String, dynamic>>, AsyncValue<PaginatedResponse<Map<String, dynamic>>>>((ref) {
  return PaginatedEntityNotifier<Map<String, dynamic>>(
    ref.watch(apiServiceProvider),
    'Subjektet',
    (data) => data,
  );
});

final paginatedBlerjeKategoriaProvider = StateNotifierProvider<PaginatedEntityNotifier<Map<String, dynamic>>, AsyncValue<PaginatedResponse<Map<String, dynamic>>>>((ref) {
  return PaginatedEntityNotifier<Map<String, dynamic>>(
    ref.watch(apiServiceProvider),
    'BlerjeKategoria',
    (data) => data,
  );
});

final paginatedFaturaKategoriaProvider = StateNotifierProvider<PaginatedEntityNotifier<Map<String, dynamic>>, AsyncValue<PaginatedResponse<Map<String, dynamic>>>>((ref) {
  return PaginatedEntityNotifier<Map<String, dynamic>>(
    ref.watch(apiServiceProvider),
    'FaturaKategoria',
    (data) => data,
  );
});

final paginatedShfrytezuesiProvider = StateNotifierProvider<PaginatedEntityNotifier<Map<String, dynamic>>, AsyncValue<PaginatedResponse<Map<String, dynamic>>>>((ref) {
  return PaginatedEntityNotifier<Map<String, dynamic>>(
    ref.watch(apiServiceProvider),
    'Shfrytezuesi',
    (data) => data,
  );
});

final paginatedMenyraPageseProvider = StateNotifierProvider<PaginatedEntityNotifier<Map<String, dynamic>>, AsyncValue<PaginatedResponse<Map<String, dynamic>>>>((ref) {
  return PaginatedEntityNotifier<Map<String, dynamic>>(
    ref.watch(apiServiceProvider),
    'MenyraPageses',
    (data) => data,
  );
});

final paginatedPorosiaProvider = StateNotifierProvider<PaginatedEntityNotifier<Map<String, dynamic>>, AsyncValue<PaginatedResponse<Map<String, dynamic>>>>((ref) {
  return PaginatedEntityNotifier<Map<String, dynamic>>(
    ref.watch(apiServiceProvider),
    'Porosia',
    (data) => data,
  );
});

final paginatedKategoriaProvider = StateNotifierProvider<PaginatedEntityNotifier<Map<String, dynamic>>, AsyncValue<PaginatedResponse<Map<String, dynamic>>>>((ref) {
  return PaginatedEntityNotifier<Map<String, dynamic>>(
    ref.watch(apiServiceProvider),
    'Kategoria',
    (data) => data,
  );
});

final paginatedTVSHProvider = StateNotifierProvider<PaginatedEntityNotifier<Map<String, dynamic>>, AsyncValue<PaginatedResponse<Map<String, dynamic>>>>((ref) {
  return PaginatedEntityNotifier<Map<String, dynamic>>(
    ref.watch(apiServiceProvider),
    'TVSH',
    (data) => data,
  );
});