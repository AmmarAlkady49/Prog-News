import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prog_news/core/utils/models/articles_api_response.dart';
import 'package:prog_news/features/search/models/api_everything_parameter.dart';
import 'package:prog_news/features/search/services/search_services.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  final searchServices = SearchServices();
  void search(String q) async {
    emit(Searching());
    try {
      final queryParameter = ApiEverythingParameter(q: q);
      searchServices
          .searchArticles(queryParameter)
          .then((value) => emit(Searched(articles: value.articles!)));
    } catch (e) {
      emit(SearchError(message: e.toString()));
    }
  }
}
