import 'package:flutter/material.dart';
import 'package:news_app/widgets/news_list_view_builder.dart';
import '../widgets/categories_list_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        title: const Text(
          'News Cloud',
          style: TextStyle(
            color: Colors.white,
          fontWeight: FontWeight.bold
        ),),
        centerTitle: true
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: CategoriesListView()
            ),
          const  SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),
            const NewsListViewBuilder(category: 'general',),
          ],
        ),
      )
    );
  }
}
