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
  final T Function(Map<String, dynamic>) _fromJson;
  
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
final faturaListProvider = StateNotifierProvider<EntityListNotifier<Fatura>, AsyncValue<List<Fatura>>>((ref) {
  final apiService = ref.read(apiServiceProvider);
  return EntityListNotifier<Fatura>(
    apiService,
    'Fatura',
    (json) => Fatura.fromJson(json),
  );
});

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
final blerjetListProvider = StateNotifierProvider<EntityListNotifier<Blerjet>, AsyncValue<List<Blerjet>>>((ref) {
  final apiService = ref.read(apiServiceProvider);
  return EntityListNotifier<Blerjet>(
    apiService,
    'Blerjet',
    (json) => Blerjet.fromJson(json),
  );
});

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
final stokuListProvider = StateNotifierProvider<EntityListNotifier<Stoku>, AsyncValue<List<Stoku>>>((ref) {
  final apiService = ref.read(apiServiceProvider);
  return EntityListNotifier<Stoku>(
    apiService,
    'Stoku',
    (json) => Stoku.fromJson(json),
  );
});

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
final subjektetListProvider = StateNotifierProvider<EntityListNotifier<Subjekti>, AsyncValue<List<Subjekti>>>((ref) {
  final apiService = ref.read(apiServiceProvider);
  return EntityListNotifier<Subjekti>(
    apiService,
    'Subjektet',
    (json) => Subjekti.fromJson(json),
  );
});

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

// Kategoria Providers
final kategoriaListProvider = StateNotifierProvider<EntityListNotifier<Kategoria>, AsyncValue<List<Kategoria>>>((ref) {
  final apiService = ref.read(apiServiceProvider);
  return EntityListNotifier<Kategoria>(
    apiService,
    'Kategoria',
    (json) => Kategoria.fromJson(json),
  );
});

// TVSH Providers
final tvshListProvider = StateNotifierProvider<EntityListNotifier<TVSH>, AsyncValue<List<TVSH>>>((ref) {
  final apiService = ref.read(apiServiceProvider);
  return EntityListNotifier<TVSH>(
    apiService,
    'TVSH',
    (json) => TVSH.fromJson(json),
  );
});

// Shfrytezuesi Providers
final shfrytezuesiListProvider = StateNotifierProvider<EntityListNotifier<Shfrytezuesi>, AsyncValue<List<Shfrytezuesi>>>((ref) {
  final apiService = ref.read(apiServiceProvider);
  return EntityListNotifier<Shfrytezuesi>(
    apiService,
    'Shfrytezuesi',
    (json) => Shfrytezuesi.fromJson(json),
  );
});

// Entity CRUD Operations Provider
class EntityCrudNotifier<T> extends StateNotifier<AsyncValue<T?>> {
  final ApiService _apiService;
  final String _table;
  final T Function(Map<String, dynamic>) _fromJson;
  
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
