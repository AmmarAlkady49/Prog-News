import 'package:dio/dio.dart';
import 'package:prog_news/core/utils/app_constants.dart';
import 'package:prog_news/features/home/models/top_headlines_api_response.dart';
import 'package:prog_news/features/home/models/top_headlines_paramter_body.dart';

class HomeServices {
  final aDio = Dio();

  Future<TopHeadlinesApiResponse> getTopHeadLines(
      TopHeadlinesParamterBody parameterBody) async {
    try {
      aDio.options.baseUrl = AppConstants.baseUrl;
      final headers = {'X-Api-Key': AppConstants.apiKey};
      final response = await aDio.get(AppConstants.topHeadlines,
          queryParameters: parameterBody.toMap(),
          options: Options(
            headers: headers,
          ));
      if (response.statusCode == 200) {
        return TopHeadlinesApiResponse.fromMap(response.data); 
      } else {
        throw Exception(
            'failed to load top headlines ${response.statusMessage}');
      }
    } catch (e) {
      rethrow;
    }
  }
}
