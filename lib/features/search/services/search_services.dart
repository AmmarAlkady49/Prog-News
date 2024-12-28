import 'package:dio/dio.dart';
import 'package:prog_news/core/utils/app_constants.dart';
import 'package:prog_news/core/utils/models/articles_api_response.dart';
import 'package:prog_news/features/search/models/api_everything_parameter.dart';

class SearchServices {
  final aDio = Dio();

  Future<ArticlesApiResponse> searchArticles(
      ApiEverythingParameter queryParameter) async {
    aDio.options.baseUrl = AppConstants.baseUrl;
    final headers = {'X-Api-Key': AppConstants.apiKey};

    final response = await aDio.get(
      AppConstants.everything,
      queryParameters: queryParameter.toMap(),
      options: Options(headers: headers),
    );
    if (response.statusCode == 200) {
      return ArticlesApiResponse.fromMap(response.data);
    } else {
      throw Exception(
          'failed to load Searched articles ${response.statusMessage}');
    }
  }
}
