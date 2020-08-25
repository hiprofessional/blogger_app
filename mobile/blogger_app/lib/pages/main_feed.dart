import 'package:blogger_app/model/post.dart';
import 'package:blogger_app/widget/card.dart';
import 'package:blogger_app/widget/news_card.dart';
import 'package:blogger_app/widget/video_card.dart';
import 'package:flutter/cupertino.dart';

class MainFeed extends StatefulWidget {
  @override
  _MainFeedState createState() => _MainFeedState();
}

class _MainFeedState extends State<MainFeed> {
  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];
    widgets.add(HeaderListItem(
      header: 'Лента',
    ));
    widgets.add(VideoCard(
        header: 'Продал все что было и не было',
        subHeader: 'Вот так вот',
        image: 'assets/mask.png'));
    widgets.addAll(somePosts.map((e) => NewsCard(
          header: e.header,
          subHeader: e.subHeader,
          image: e.image,
        )));
    return SafeArea(
      child: CupertinoPageScaffold(
        child: ListView.builder(
          itemCount: widgets.length,
          itemBuilder: (context, index) {
            return widgets[index];
          },
        ),
      ),
    );
  }
}
