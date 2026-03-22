class TopHeadlinesParams {
  final String country;
  final String? category;
  final String? sources;
  final int? pageSize;
  final int? page;

  TopHeadlinesParams({
   required this.country ,
    this.category,
    this.sources,
    this.pageSize,
    this.page,
  });

  Map<String, dynamic> toMap() {
    return {
      'country': country,
      'category': category,
      'sources': sources,
      'pageSize': pageSize,
      'page': page,
    };
  }
}
