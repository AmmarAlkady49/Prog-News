class ApiEverythingParameter {
  final String q;
  final String? searchIn;
  final int? page;
  final int? pageSize;

  ApiEverythingParameter(
      {required this.q,
      this.searchIn = 'title',
      this.page = 1,
      this.pageSize = 10});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'q': q,
      'searchIn': searchIn,
      'page': page,
      'pageSize': pageSize,
    };
  }

  factory ApiEverythingParameter.fromMap(Map<String, dynamic> map) {
    return ApiEverythingParameter(
      q: map['q'] as String,
      searchIn: map['searchIn'] != null ? map['searchIn'] as String : null,
      page: map['page'] != null ? map['page'] as int : null,
      pageSize: map['pageSize'] != null ? map['pageSize'] as int : null,
    );
  }
}
