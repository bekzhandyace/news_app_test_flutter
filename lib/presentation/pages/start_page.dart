import 'package:flutter/material.dart';
import 'package:new_app/presentation/pages/favorite_news_page.dart';
import 'package:new_app/presentation/pages/news_page.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            
            currentIndex: pageIndex,
            onTap: (index) {
              pageIndex = index;
              mainNavigation[pageIndex];
              setState(() {});
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.view_list), label: 'News'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.bookmark), label: 'News'),
                  
            ],
          ),
          body: mainNavigation[pageIndex],
        ));
  }
}

const List<Widget> mainNavigation = [NewsPage(), FavoriteNewsPage()];
