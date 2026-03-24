class TopHeadlinesParams {
  final String country;
  final String? category;
  final String? sources;
  final int? pageSize;
  final int? page;

  TopHeadlinesParams({
    required this.country,
    this.category,
    this.sources,
    this.pageSize,
    this.page,
  });

  Map<String, dynamic> toMap() {
    final results = <String, dynamic>{};
    results.addAll({'country': country});
    
    if (category != null) {
      results.addAll({'category': category});
    }
    if (sources != null) {
      results.addAll({'sources': sources});
    }
    if (pageSize != null) {
      results.addAll({'pageSize': pageSize});
    }
    if (page != null) {
      results.addAll({'page': page});
    }
    return results;
  }
}
