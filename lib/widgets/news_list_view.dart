import 'package:flutter/cupertino.dart';
import '../Models/articles_model.dart';
import 'news_card.dart';

class NewsListView extends StatelessWidget {
  NewsListView({super.key, required this.articles});

  List<ArticleModel> articles = [];

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(childCount: articles.length,
                (context, index) {
              return NewsCard(
                articleModel: articles[index],
              );
                  }

    )
    );
  }
}
