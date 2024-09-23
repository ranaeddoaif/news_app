import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../Models/articles_model.dart';
import '../services/news_service.dart';
import 'news_list_view.dart';

class NewsListViewBuilder extends StatefulWidget {
  const NewsListViewBuilder({super.key, required this.category});
final String category;
  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  List<ArticleModel> articles = [];

  bool isLoading = true;
  var future;

  @override
  void initState() {
    super.initState();
    getGeneralNews();
    future = NewsService(Dio()).getNews(category: widget.category);
  }

  Future<void> getGeneralNews() async {
    articles = await NewsService(Dio()).getNews(category:widget.category);
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return NewsListView(articles: snapshot.data!);
          } else if (snapshot.hasError) {
            return const SliverToBoxAdapter(
              child: Center(
                child: Text('Oop!\nTry again later'),
              ),
            );
          } else {
            return const SliverToBoxAdapter(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
    // isLoading
    //     ? const SliverToBoxAdapter(
    //         child: Center(child: CircularProgressIndicator()))
    //     : articles.isNotEmpty
    //         ? NewsListView(articles: articles)
    //         : const SliverToBoxAdapter(
    //             child: Center(child: Text('Oop!\nTry again later')));
  }
}
