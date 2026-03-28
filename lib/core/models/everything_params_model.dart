class EverythingParams {
  final String? q;
  final String? searchln;
  final String? language;
  final String? sortBy;
  final int? pageSize;
  final int? page;

   EverythingParams(
   { this.q,
    this.searchln,
    this.language,
    this.sortBy,
    this.pageSize,
    this.page,}
  );

  Map<String, dynamic> toMapEverything() {
    final result = <String, dynamic>{};
    if (q != null) {
      result.addAll({'q': q});
    }
    if (searchln != null) {
      result.addAll({'searchln': searchln});
    }
    if (language != null) {
      result.addAll({'language': language});
    }
    if (sortBy != null) {
      result.addAll({'sortBy': sortBy});
    }
    if (pageSize != null) {
      result.addAll({'pageSize': pageSize});
    }
    if (page != null) {
      result.addAll({'page': page});
    }
    return result;
  }
}
