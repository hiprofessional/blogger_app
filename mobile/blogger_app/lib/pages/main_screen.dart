import 'package:blogger_app/pages/contest_feed.dart';
import 'package:blogger_app/pages/details_page.dart';
import 'package:blogger_app/pages/main_feed.dart';
import 'package:blogger_app/pages/videos_feed.dart';
import 'package:flutter/cupertino.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
            title: Text('Лента'),
            icon: Icon(CupertinoIcons.news),
          ),
          BottomNavigationBarItem(
            title: Text('Конкурсы'),
            icon: Icon(CupertinoIcons.heart),
          ),
          BottomNavigationBarItem(
            title: Text('Видео'),
            icon: Icon(CupertinoIcons.video_camera),
          ),
        ],
      ),
      resizeToAvoidBottomInset: false,
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return CupertinoTabView(
              builder: (context) => MainFeed(),
              routes: {
                '/details/': (context) => DetailsPage(),
              },
            );
          case 1:
            return CupertinoTabView(
              builder: (context) => ContestFeed(),
              routes: {
                '/details/': (context) => DetailsPage(),
              },
            );
          case 2:
            return CupertinoTabView(
              builder: (context) => VideosFeed(),
              routes: {
                '/details/': (context) => DetailsPage(),
              },
            );
          default:
            return CupertinoTabView(
              builder: (context) => MainFeed(),
              routes: {
                '/details/': (context) => DetailsPage(),
              },
            );
        }
      },
    );
  }
}
