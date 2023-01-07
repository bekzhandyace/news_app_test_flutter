import 'package:flutter/material.dart';
import 'package:new_app/presentation/pages/all_news_page.dart';
import 'package:new_app/presentation/pages/favorite_news_page.dart';
import 'package:new_app/presentation/pages/top_news_page.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 56, 102, 139),
          title: const Text('Post news'),
          centerTitle: true,
          bottom: const TabBar(tabs: [
            Tab(
              icon: Icon(Icons.newspaper),
            ),
            Tab(
              icon: Icon(Icons.list_alt),
            ),
          ]),
        ),
        body: const TabBarView(
          children: [
            TopNewsPage(),
            AllNewsPage(),
          ],
        ));
  }
}

const List<Widget> listOfNewsPages = [TopNewsPage(), FavoriteNewsPage()];
