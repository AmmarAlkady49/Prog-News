import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prog_news/features/home/models/top_headlines_api_response.dart';
import 'package:prog_news/features/home/models/top_headlines_paramter_body.dart';
import 'package:prog_news/features/home/services/home_services.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  final homeServices = HomeServices();
  Future<void> getTopHeadLines() async {
    emit(TopHeadlinesLoading());
    try {
      final parameterBody = TopHeadlinesParamterBody(
        category: 'business',
        page: 1,
        pageSize: 5,
      );
      final result = await homeServices.getTopHeadLines(parameterBody);
      emit(TopHeadlinesLoaded(articles: result.articles));
    } catch (e) {
      emit(TopHeadlinesError(
          message: 'failed to load top headlines ${e.toString()}'));
    }
  }
}
