import 'package:dio/dio.dart';
import 'package:news_app/models/article_model.dart';

class NewsService {
  final Dio dio;
  final String apiKey = 'pub_56529ab046a4f26989a0c5c70e61b19400dc6';
  final String baseUrl = 'https://newsdata.io/api/1/latest';

  const NewsService({required this.dio});

  Future<List<ArticleModel>> getNewsByCategory(String category) async {
    try {
      Response response = await dio.get(
          '$baseUrl?apikey=$apiKey&country=eg,sa&language=ar&category=$category');

      Map<String, dynamic> jsonData = response.data;
      List<dynamic> results = jsonData['results'];
      List<ArticleModel> articles =
          []; //empty list of articles which will be filled and returned
      for (var article in results) {
        // article is a Map<String, dynamic> concider each article in results
        articles.add(ArticleModel.fromjson(article));
      }
      return articles;
    } catch (e) {
      return [];
    }
  } //getNewsByCategory
} //NewseService class
