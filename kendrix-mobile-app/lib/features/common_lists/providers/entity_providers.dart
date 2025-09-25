import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/fatura.dart';
import '../models/blerjet.dart';
import '../models/artikulli_baze.dart';
import '../models/business_entities.dart';
import '../../../core/networking/api_service.dart';

// API Service Provider
final apiServiceProvider = Provider<ApiService>((ref) => ApiService.instance);

// Dashboard Provider
final dashboardStatsProvider = FutureProvider<DashboardStats>((ref) async {
  final apiService = ref.read(apiServiceProvider);
  final response = await apiService.getDashboardStats();
  
  if (response.success && response.data != null) {
    return response.data!;
  } else {
    throw Exception(response.error ?? 'Failed to load dashboard stats');
  }
});

// Generic Entity List Provider
class EntityListNotifier<T> extends StateNotifier<AsyncValue<List<T>>> {
  final ApiService _apiService;
  final String _table;
  final T Function(dynamic) _fromJson;
  
  EntityListNotifier(this._apiService, this._table, this._fromJson) : super(const AsyncValue.loading()) {
    loadEntities();
  }

  Future<void> loadEntities({
    int page = 1,
    int limit = 50,
    String? search,
    Map<String, dynamic>? filters,
  }) async {
    state = const AsyncValue.loading();
    
    try {
      final response = await _apiService.getEntities<T>(
        _table,
        page: page,
        limit: limit,
        search: search,
        filters: filters,
        fromJson: _fromJson,
      );
      
      print('🌐 Entity provider response success: ${response.success}');
      print('🌐 Entity provider response data: ${response.data}');
      
      if (response.success && response.data != null) {
        print('🌐 Setting state with ${response.data!.data.length} entities');
        state = AsyncValue.data(response.data!.data);
      } else {
        print('🌐 Entity provider error: ${response.error}');
        state = AsyncValue.error(
          Exception(response.error ?? 'Failed to load entities'),
          StackTrace.current,
        );
      }
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> refresh() async {
    await loadEntities();
  }

  Future<void> search(String query) async {
    await loadEntities(search: query);
  }

  Future<void> applyFilters(Map<String, dynamic> filters) async {
    await loadEntities(filters: filters);
  }
}

// Fatura Providers
final faturaListProvider = StateNotifierProvider<FaturaListNotifier, AsyncValue<List<Fatura>>>((ref) {
  final apiService = ref.read(apiServiceProvider);
  return FaturaListNotifier(apiService);
});

class FaturaListNotifier extends StateNotifier<AsyncValue<List<Fatura>>> {
  final ApiService _apiService;
  
  FaturaListNotifier(this._apiService) : super(const AsyncValue.loading()) {
    loadFatura();
  }

  Future<void> loadFatura() async {
    state = const AsyncValue.loading();
    
    try {
      print('🌐 Loading Fatura data...');
      final response = await _apiService.getFatura();
      
      if (response.success && response.data != null) {
        final faturaList = response.data!.map((json) => Fatura.fromJson(json)).toList();
        print('🌐 Loaded ${faturaList.length} Fatura records');
        state = AsyncValue.data(faturaList);
      } else {
        print('🌐 Failed to load Fatura: ${response.error}');
        state = AsyncValue.error(Exception(response.error ?? 'Failed to load Fatura'), StackTrace.current);
      }
    } catch (e, stackTrace) {
      print('🌐 Error loading Fatura: $e');
      state = AsyncValue.error(e, stackTrace);
    }
  }

  Future<void> refresh() async {
    await loadFatura();
  }

  Future<void> search(String query) async {
    // For now, just reload the data
    // TODO: Implement server-side search
    await loadFatura();
  }
}

final faturaProvider = FutureProvider.family<Fatura, int>((ref, id) async {
  final apiService = ref.read(apiServiceProvider);
  final response = await apiService.getEntity<Fatura>(
    'Fatura',
    id,
    fromJson: (json) => Fatura.fromJson(json),
  );
  
  if (response.success && response.data != null) {
    return response.data!;
  } else {
    throw Exception(response.error ?? 'Failed to load fatura');
  }
});

// Blerjet Providers
final blerjetListProvider = StateNotifierProvider<BlerjetListNotifier, AsyncValue<List<Blerjet>>>((ref) {
  final apiService = ref.read(apiServiceProvider);
  return BlerjetListNotifier(apiService);
});

class BlerjetListNotifier extends StateNotifier<AsyncValue<List<Blerjet>>> {
  final ApiService _apiService;
  
  BlerjetListNotifier(this._apiService) : super(const AsyncValue.loading()) {
    loadBlerjet();
  }

  Future<void> loadBlerjet() async {
    state = const AsyncValue.loading();
    
    try {
      print('🌐 Loading Blerjet data...');
      final response = await _apiService.getBlerjet();
      
      if (response.success && response.data != null) {
        final blerjetList = response.data!.map((json) => Blerjet.fromJson(json)).toList();
        print('🌐 Loaded ${blerjetList.length} Blerjet records');
        state = AsyncValue.data(blerjetList);
      } else {
        print('🌐 Failed to load Blerjet: ${response.error}');
        state = AsyncValue.error(Exception(response.error ?? 'Failed to load Blerjet'), StackTrace.current);
      }
    } catch (e, stackTrace) {
      print('🌐 Error loading Blerjet: $e');
      state = AsyncValue.error(e, stackTrace);
    }
  }

  Future<void> refresh() async {
    await loadBlerjet();
  }

  Future<void> search(String query) async {
    // For now, just reload the data
    // TODO: Implement server-side search
    await loadBlerjet();
  }
}

final blerjetProvider = FutureProvider.family<Blerjet, int>((ref, id) async {
  final apiService = ref.read(apiServiceProvider);
  final response = await apiService.getEntity<Blerjet>(
    'Blerjet',
    id,
    fromJson: (json) => Blerjet.fromJson(json),
  );
  
  if (response.success && response.data != null) {
    return response.data!;
  } else {
    throw Exception(response.error ?? 'Failed to load blerjet');
  }
});

// Stoku Providers
final stokuListProvider = StateNotifierProvider<StokuListNotifier, AsyncValue<List<Stoku>>>((ref) {
  final apiService = ref.read(apiServiceProvider);
  return StokuListNotifier(apiService);
});

class StokuListNotifier extends StateNotifier<AsyncValue<List<Stoku>>> {
  final ApiService _apiService;
  
  StokuListNotifier(this._apiService) : super(const AsyncValue.loading()) {
    loadStoku();
  }

  Future<void> loadStoku() async {
    state = const AsyncValue.loading();
    
    try {
      print('🌐 Loading Stoku data...');
      final response = await _apiService.getStoku();
      
      if (response.success && response.data != null) {
        final stokuList = response.data!.map((json) => Stoku.fromJson(json)).toList();
        print('🌐 Loaded ${stokuList.length} Stoku records');
        state = AsyncValue.data(stokuList);
      } else {
        print('🌐 Failed to load Stoku: ${response.error}');
        state = AsyncValue.error(Exception(response.error ?? 'Failed to load Stoku'), StackTrace.current);
      }
    } catch (e, stackTrace) {
      print('🌐 Error loading Stoku: $e');
      state = AsyncValue.error(e, stackTrace);
    }
  }

  Future<void> refresh() async {
    await loadStoku();
  }

  Future<void> search(String query) async {
    // For now, just reload the data
    // TODO: Implement server-side search
    await loadStoku();
  }
}

final stokuProvider = FutureProvider.family<Stoku, int>((ref, id) async {
  final apiService = ref.read(apiServiceProvider);
  final response = await apiService.getEntity<Stoku>(
    'Stoku',
    id,
    fromJson: (json) => Stoku.fromJson(json),
  );
  
  if (response.success && response.data != null) {
    return response.data!;
  } else {
    throw Exception(response.error ?? 'Failed to load stoku');
  }
});

// ArtikulliBaze Providers
final artikulliBazeListProvider = StateNotifierProvider<EntityListNotifier<ArtikulliBaze>, AsyncValue<List<ArtikulliBaze>>>((ref) {
  final apiService = ref.read(apiServiceProvider);
  return EntityListNotifier<ArtikulliBaze>(
    apiService,
    'ArtikulliBaze',
    (json) => ArtikulliBaze.fromJson(json),
  );
});

final artikulliBazeProvider = FutureProvider.family<ArtikulliBaze, int>((ref, id) async {
  final apiService = ref.read(apiServiceProvider);
  final response = await apiService.getEntity<ArtikulliBaze>(
    'ArtikulliBaze',
    id,
    fromJson: (json) => ArtikulliBaze.fromJson(json),
  );
  
  if (response.success && response.data != null) {
    return response.data!;
  } else {
    throw Exception(response.error ?? 'Failed to load artikulli');
  }
});

// Subjektet Providers
final subjektetListProvider = StateNotifierProvider<SubjektetListNotifier, AsyncValue<List<Subjekti>>>((ref) {
  final apiService = ref.read(apiServiceProvider);
  return SubjektetListNotifier(apiService);
});

class SubjektetListNotifier extends StateNotifier<AsyncValue<List<Subjekti>>> {
  final ApiService _apiService;
  
  SubjektetListNotifier(this._apiService) : super(const AsyncValue.loading()) {
    loadSubjektet();
  }

  Future<void> loadSubjektet() async {
    state = const AsyncValue.loading();
    
    try {
      print('🌐 Loading Subjektet data...');
      final response = await _apiService.getSubjektet();
      
      if (response.success && response.data != null) {
        final subjektetList = response.data!.map((json) => Subjekti.fromJson(json)).toList();
        print('🌐 Loaded ${subjektetList.length} Subjektet records');
        state = AsyncValue.data(subjektetList);
      } else {
        print('🌐 Failed to load Subjektet: ${response.error}');
        state = AsyncValue.error(Exception(response.error ?? 'Failed to load Subjektet'), StackTrace.current);
      }
    } catch (e, stackTrace) {
      print('🌐 Error loading Subjektet: $e');
      state = AsyncValue.error(e, stackTrace);
    }
  }

  Future<void> refresh() async {
    await loadSubjektet();
  }

  Future<void> search(String query) async {
    // For now, just reload the data
    // TODO: Implement server-side search
    await loadSubjektet();
  }
}

final subjektiProvider = FutureProvider.family<Subjekti, int>((ref, id) async {
  final apiService = ref.read(apiServiceProvider);
  final response = await apiService.getEntity<Subjekti>(
    'Subjektet',
    id,
    fromJson: (json) => Subjekti.fromJson(json),
  );
  
  if (response.success && response.data != null) {
    return response.data!;
  } else {
    throw Exception(response.error ?? 'Failed to load subjekti');
  }
});

// Generic Data List Providers - for entities that use Map<String, dynamic>
class GenericDataListNotifier extends StateNotifier<AsyncValue<List<Map<String, dynamic>>>> {
  final ApiService _apiService;
  final String _tableName;
  final Future<ApiResponse<List<Map<String, dynamic>>>> Function() _apiCall;
  
  GenericDataListNotifier(this._apiService, this._tableName, this._apiCall) 
      : super(const AsyncValue.loading()) {
    loadData();
  }

  Future<void> loadData() async {
    state = const AsyncValue.loading();
    
    try {
      print('🌐 Loading data for table: $_tableName');
      final response = await _apiCall();
      
      print('🌐 Generic data response success: ${response.success}');
      print('🌐 Generic data response data type: ${response.data?.runtimeType}');
      
      if (response.success && response.data != null) {
        print('🌐 Setting state with ${response.data!.length} generic records');
        state = AsyncValue.data(response.data!);
      } else {
        print('🌐 Generic data provider error: ${response.error}');
        state = AsyncValue.error(
          Exception(response.error ?? 'Failed to load data'),
          StackTrace.current,
        );
      }
    } catch (error, stackTrace) {
      print('🌐 Error loading generic data: $error');
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> refresh() async {
    await loadData();
  }
}

// Kategoria Providers
final kategoriaListProvider = StateNotifierProvider<GenericDataListNotifier, AsyncValue<List<Map<String, dynamic>>>>((ref) {
  final apiService = ref.read(apiServiceProvider);
  return GenericDataListNotifier(
    apiService,
    'Kategoria',
    () => apiService.getKategoria(),
  );
});

// TVSH Providers
final tvshListProvider = StateNotifierProvider<GenericDataListNotifier, AsyncValue<List<Map<String, dynamic>>>>((ref) {
  final apiService = ref.read(apiServiceProvider);
  return GenericDataListNotifier(
    apiService,
    'TVSH',
    () => apiService.getTVSH(),
  );
});

// Shfrytezuesi Providers
final shfrytezuesiListProvider = StateNotifierProvider<GenericDataListNotifier, AsyncValue<List<Map<String, dynamic>>>>((ref) {
  final apiService = ref.read(apiServiceProvider);
  return GenericDataListNotifier(
    apiService,
    'Shfrytezuesi',
    () => apiService.getShfrytezuesi(),
  );
});

// Additional generic providers for other tables
final faturaKategoriaListProvider = StateNotifierProvider<GenericDataListNotifier, AsyncValue<List<Map<String, dynamic>>>>((ref) {
  final apiService = ref.read(apiServiceProvider);
  return GenericDataListNotifier(
    apiService,
    'FaturaKategoria',
    () => apiService.getFaturaKategoria(),
  );
});

final blerjeKategoriaListProvider = StateNotifierProvider<GenericDataListNotifier, AsyncValue<List<Map<String, dynamic>>>>((ref) {
  final apiService = ref.read(apiServiceProvider);
  return GenericDataListNotifier(
    apiService,
    'BlerjeKategoria',
    () => apiService.getBlerjeKategoria(),
  );
});

final menyraPageseListProvider = StateNotifierProvider<GenericDataListNotifier, AsyncValue<List<Map<String, dynamic>>>>((ref) {
  final apiService = ref.read(apiServiceProvider);
  return GenericDataListNotifier(
    apiService,
    'MenyraPageses',
    () => apiService.getMenyraPageses(),
  );
});

final pagesatListProvider = StateNotifierProvider<GenericDataListNotifier, AsyncValue<List<Map<String, dynamic>>>>((ref) {
  final apiService = ref.read(apiServiceProvider);
  return GenericDataListNotifier(
    apiService,
    'Pagesat',
    () => apiService.getPagesat(),
  );
});

final porosiaListProvider = StateNotifierProvider<GenericDataListNotifier, AsyncValue<List<Map<String, dynamic>>>>((ref) {
  final apiService = ref.read(apiServiceProvider);
  return GenericDataListNotifier(
    apiService,
    'Porosia',
    () => apiService.getPorosia(),
  );
});

final porositeEBlerjesListProvider = StateNotifierProvider<GenericDataListNotifier, AsyncValue<List<Map<String, dynamic>>>>((ref) {
  final apiService = ref.read(apiServiceProvider);
  return GenericDataListNotifier(
    apiService,
    'PorositeEBlerjes',
    () => apiService.getPorositeEBlerjes(),
  );
});

final tavolinaListProvider = StateNotifierProvider<GenericDataListNotifier, AsyncValue<List<Map<String, dynamic>>>>((ref) {
  final apiService = ref.read(apiServiceProvider);
  return GenericDataListNotifier(
    apiService,
    'Tavolina',
    () => apiService.getTavolina(),
  );
});

final normativaListProvider = StateNotifierProvider<GenericDataListNotifier, AsyncValue<List<Map<String, dynamic>>>>((ref) {
  final apiService = ref.read(apiServiceProvider);
  return GenericDataListNotifier(
    apiService,
    'Normativa',
    () => apiService.getNormativa(),
  );
});

final zRaportetListProvider = StateNotifierProvider<GenericDataListNotifier, AsyncValue<List<Map<String, dynamic>>>>((ref) {
  final apiService = ref.read(apiServiceProvider);
  return GenericDataListNotifier(
    apiService,
    'ZRaportet',
    () => apiService.getZRaportet(),
  );
});

// Entity CRUD Operations Provider
class EntityCrudNotifier<T> extends StateNotifier<AsyncValue<T?>> {
  final ApiService _apiService;
  final String _table;
  final T Function(dynamic) _fromJson;
  
  EntityCrudNotifier(this._apiService, this._table, this._fromJson) : super(const AsyncValue.data(null));

  Future<void> createEntity(Map<String, dynamic> data) async {
    state = const AsyncValue.loading();
    
    try {
      final response = await _apiService.createEntity<T>(
        _table,
        data,
        fromJson: _fromJson,
      );
      
      if (response.success && response.data != null) {
        state = AsyncValue.data(response.data!);
      } else {
        state = AsyncValue.error(
          Exception(response.error ?? 'Failed to create entity'),
          StackTrace.current,
        );
      }
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> updateEntity(int id, Map<String, dynamic> data) async {
    state = const AsyncValue.loading();
    
    try {
      final response = await _apiService.updateEntity<T>(
        _table,
        id,
        data,
        fromJson: _fromJson,
      );
      
      if (response.success && response.data != null) {
        state = AsyncValue.data(response.data!);
      } else {
        state = AsyncValue.error(
          Exception(response.error ?? 'Failed to update entity'),
          StackTrace.current,
        );
      }
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> deleteEntity(int id) async {
    state = const AsyncValue.loading();
    
    try {
      final response = await _apiService.deleteEntity(_table, id);
      
      if (response.success) {
        state = const AsyncValue.data(null);
      } else {
        state = AsyncValue.error(
          Exception(response.error ?? 'Failed to delete entity'),
          StackTrace.current,
        );
      }
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}

// CRUD Providers for each entity type
final faturaCrudProvider = StateNotifierProvider<EntityCrudNotifier<Fatura>, AsyncValue<Fatura?>>((ref) {
  final apiService = ref.read(apiServiceProvider);
  return EntityCrudNotifier<Fatura>(
    apiService,
    'Fatura',
    (json) => Fatura.fromJson(json),
  );
});

final blerjetCrudProvider = StateNotifierProvider<EntityCrudNotifier<Blerjet>, AsyncValue<Blerjet?>>((ref) {
  final apiService = ref.read(apiServiceProvider);
  return EntityCrudNotifier<Blerjet>(
    apiService,
    'Blerjet',
    (json) => Blerjet.fromJson(json),
  );
});

final stokuCrudProvider = StateNotifierProvider<EntityCrudNotifier<Stoku>, AsyncValue<Stoku?>>((ref) {
  final apiService = ref.read(apiServiceProvider);
  return EntityCrudNotifier<Stoku>(
    apiService,
    'Stoku',
    (json) => Stoku.fromJson(json),
  );
});

final artikulliBazeCrudProvider = StateNotifierProvider<EntityCrudNotifier<ArtikulliBaze>, AsyncValue<ArtikulliBaze?>>((ref) {
  final apiService = ref.read(apiServiceProvider);
  return EntityCrudNotifier<ArtikulliBaze>(
    apiService,
    'ArtikulliBaze',
    (json) => ArtikulliBaze.fromJson(json),
  );
});
