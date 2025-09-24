class PaginationParams {
  final int page;
  final int perPage;
  final String? sortBy;
  final String? sortDirection;
  final Map<String, dynamic> filters;

  const PaginationParams({
    this.page = 1,
    this.perPage = 20,
    this.sortBy,
    this.sortDirection = 'asc',
    this.filters = const {},
  });

  PaginationParams copyWith({
    int? page,
    int? perPage,
    String? sortBy,
    String? sortDirection,
    Map<String, dynamic>? filters,
  }) {
    return PaginationParams(
      page: page ?? this.page,
      perPage: perPage ?? this.perPage,
      sortBy: sortBy ?? this.sortBy,
      sortDirection: sortDirection ?? this.sortDirection,
      filters: filters ?? this.filters,
    );
  }

  Map<String, dynamic> toQueryParameters() {
    final params = <String, dynamic>{
      'page': page,
      'per_page': perPage,
    };

    if (sortBy != null) {
      params['sort_by'] = sortBy;
      params['sort_direction'] = sortDirection;
    }

    // Add filters
    filters.forEach((key, value) {
      if (value != null && value.toString().isNotEmpty) {
        params[key] = value;
      }
    });

    return params;
  }

  @override
  String toString() {
    return 'PaginationParams(page: $page, perPage: $perPage, sortBy: $sortBy, sortDirection: $sortDirection, filters: $filters)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PaginationParams &&
        other.page == page &&
        other.perPage == perPage &&
        other.sortBy == sortBy &&
        other.sortDirection == sortDirection &&
        _mapEquals(other.filters, filters);
  }

  @override
  int get hashCode {
    return Object.hash(
      page,
      perPage,
      sortBy,
      sortDirection,
      filters,
    );
  }

  bool _mapEquals(Map<String, dynamic> a, Map<String, dynamic> b) {
    if (a.length != b.length) return false;
    for (final key in a.keys) {
      if (!b.containsKey(key) || a[key] != b[key]) return false;
    }
    return true;
  }
}

class PaginationResult<T> {
  final List<T> data;
  final int currentPage;
  final int lastPage;
  final int perPage;
  final int total;
  final bool hasNextPage;
  final bool hasPreviousPage;

  const PaginationResult({
    required this.data,
    required this.currentPage,
    required this.lastPage,
    required this.perPage,
    required this.total,
  })  : hasNextPage = currentPage < lastPage,
        hasPreviousPage = currentPage > 1;

  factory PaginationResult.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) fromJsonT,
  ) {
    return PaginationResult<T>(
      data: (json['data'] as List<dynamic>)
          .map((item) => fromJsonT(item as Map<String, dynamic>))
          .toList(),
      currentPage: json['current_page'] as int,
      lastPage: json['last_page'] as int,
      perPage: json['per_page'] as int,
      total: json['total'] as int,
    );
  }

  PaginationResult<R> map<R>(R Function(T) mapper) {
    return PaginationResult<R>(
      data: data.map(mapper).toList(),
      currentPage: currentPage,
      lastPage: lastPage,
      perPage: perPage,
      total: total,
    );
  }

  PaginationResult<T> copyWith({
    List<T>? data,
    int? currentPage,
    int? lastPage,
    int? perPage,
    int? total,
  }) {
    return PaginationResult<T>(
      data: data ?? this.data,
      currentPage: currentPage ?? this.currentPage,
      lastPage: lastPage ?? this.lastPage,
      perPage: perPage ?? this.perPage,
      total: total ?? this.total,
    );
  }

  @override
  String toString() {
    return 'PaginationResult(data: ${data.length} items, currentPage: $currentPage, lastPage: $lastPage, perPage: $perPage, total: $total)';
  }
}

class PaginationMeta {
  final int currentPage;
  final int lastPage;
  final int perPage;
  final int total;
  final int from;
  final int to;

  const PaginationMeta({
    required this.currentPage,
    required this.lastPage,
    required this.perPage,
    required this.total,
    required this.from,
    required this.to,
  });

  factory PaginationMeta.fromJson(Map<String, dynamic> json) {
    return PaginationMeta(
      currentPage: json['current_page'] as int,
      lastPage: json['last_page'] as int,
      perPage: json['per_page'] as int,
      total: json['total'] as int,
      from: json['from'] as int? ?? 0,
      to: json['to'] as int? ?? 0,
    );
  }

  bool get hasNextPage => currentPage < lastPage;
  bool get hasPreviousPage => currentPage > 1;
  bool get isFirstPage => currentPage == 1;
  bool get isLastPage => currentPage == lastPage;

  String get displayText => 'Showing $from-$to of $total';
  String get pageText => 'Page $currentPage of $lastPage';

  @override
  String toString() {
    return 'PaginationMeta(currentPage: $currentPage, lastPage: $lastPage, perPage: $perPage, total: $total, from: $from, to: $to)';
  }
}