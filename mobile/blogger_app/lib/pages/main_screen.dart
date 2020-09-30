import 'package:blogger_app/pages/contest_feed.dart';
import 'package:blogger_app/pages/details_page/contest_details_page.dart';
import 'package:blogger_app/pages/details_page/news_details_page.dart';
import 'package:blogger_app/pages/details_page/video_details_page.dart';
import 'package:blogger_app/pages/main_feed.dart';
import 'package:blogger_app/pages/videos_feed.dart';
import 'package:flutter/cupertino.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final GlobalKey<NavigatorState> videoTabNavKey = GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> contestTabNavKey =
      GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> newsTabNavKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    int currentIndex = 0;
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
        onTap: (index) {
          // back home only if not switching tab
          if (currentIndex == index) {
            switch (index) {
              case 0:
                newsTabNavKey.currentState.popUntil((r) => r.isFirst);
                break;
              case 1:
                contestTabNavKey.currentState.popUntil((r) => r.isFirst);
                break;
              case 2:
                videoTabNavKey.currentState.popUntil((r) => r.isFirst);
                break;
            }
          }
          currentIndex = index;
        },
      ),
      resizeToAvoidBottomInset: false,
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return CupertinoTabView(
              navigatorKey: newsTabNavKey,
              builder: (context) => MainFeed(),
              routes: {
                '/details/news': (context) => NewsDetailsPage(),
                '/details/video': (context) => VideoDetailsPage(),
                '/details/contest': (context) => ContestDetailsPage(),
              },
            );
          case 1:
            return CupertinoTabView(
              navigatorKey: contestTabNavKey,
              builder: (context) => ContestFeed(),
              routes: {
                '/details/contest': (context) => ContestDetailsPage(),
              },
            );
          case 2:
            return CupertinoTabView(
              navigatorKey: videoTabNavKey,
              builder: (context) => VideosFeed(),
              routes: {
                '/details/video': (context) => VideoDetailsPage(),
              },
            );
          default:
            return CupertinoTabView(
//              navigatorKey: newsTabNavKey,
              builder: (context) => MainFeed(),
              routes: {
                '/details/': (context) => NewsDetailsPage(),
              },
            );
        }
      },
    );
  }
}
