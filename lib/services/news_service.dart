import 'package:dio/dio.dart';
import 'package:news_app/Models/articles_model.dart';

class NewsService {
  final Dio dio;

  NewsService(this.dio);

  Future<List<ArticleModel>> getNews({required String category}) async {
    try {
      var response = await dio.get(
          'https://newsapi.org/v2/top-headlines?country=us&apiKey=39094a19a2ea48c9b185085cb0588304&category=$category');

      dynamic jsonData = response.data;

      List<dynamic> articles = jsonData['articles'];

      List<ArticleModel> articleList = [];
      for (var article in articles) {
        ArticleModel articleModel = ArticleModel(
            image: article['urlToImage'],
            title: article['title'],
            subTitle: article['description']);

        if (article['urlToImage'] == '[Removed]' ||
            article['title'] == '[Removed]' ||
            article['description'] == '[Removed]') {
          articleList.remove(articleModel);
        }else{
          articleList.add(articleModel);
        }
      }
      return articleList;
    } catch (e) {
      return [];
    }
  }
}
