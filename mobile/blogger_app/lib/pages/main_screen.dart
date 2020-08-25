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
                builder: (context) => MainFeed(), defaultTitle: 'Лента');
          case 1:
            return CupertinoTabView(
                builder: (context) => Text('Hi'), defaultTitle: 'My Title');
          case 2:
            return CupertinoTabView(builder: (context) => VideosFeed());
          default:
            return CupertinoTabView(
                builder: (context) => MainFeed(), defaultTitle: 'Видео');
        }
      },
    );
//    return SafeArea(
//      child: Container(
//        child: Text(
//          'Feed',
////          style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
//        ),
//      ),
//    );
  }
}
