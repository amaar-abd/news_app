class EverythingParams {
  final String? q;
  final String? searchln;
  final String? language;
  final String? sortBy;
  final int? pageSize;
  final int? page;

  const EverythingParams(
    this.q,
    this.searchln,
    this.language,
    this.sortBy,
    this.pageSize,
    this.page,
  );

  Map<String, dynamic> toMap() {
    return {
      'q': q,
      'searchln': searchln,
      'language': language,
      'sortBy': sortBy,
      'pageSize': pageSize,
      'page': page,
    };
  }
}
