class TopHeadlinesParamterBody {
  final String country;
  final String? category;
  final String? sources;
  final String? q;
  final int? pageSize;
  final int? page;

  TopHeadlinesParamterBody({
    this.country = 'us',
    this.category,
    this.sources,
    this.q,
    this.pageSize = 10,
    this.page,
  });
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'country': country,
      'category': category,
      'sources': sources,
      'q': q,
      'pageSize': pageSize,
      'page': page,
    };
  }

  factory TopHeadlinesParamterBody.fromMap(Map<String, dynamic> map) {
    return TopHeadlinesParamterBody(
      country: map['country'] as String,
      category: map['category'] != null ? map['category'] as String : null,
      sources: map['sources'] != null ? map['sources'] as String : null,
      q: map['q'] != null ? map['q'] as String : null,
      pageSize: map['pageSize'] != null ? map['pageSize'] as int : null,
      page: map['page'] != null ? map['page'] as int : null,
    );
  }
}
