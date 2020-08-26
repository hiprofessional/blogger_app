import 'package:blogger_app/model/post.dart';
import 'package:blogger_app/widget/card.dart';
import 'package:blogger_app/widget/contest_card.dart';
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

    widgets.addAll(somePosts.map((e) {
      switch (e.postType) {
        case PostType.News:
          return NewsCard(
            header: e.header,
            subHeader: e.subHeader,
            image: e.image,
            createdDate: e.createdDate,
          );
        case PostType.Video:
          return VideoCard(
            header: e.header,
            subHeader: e.subHeader,
            image: e.image,
            createdDate: e.createdDate,
          );
        case PostType.Contest:
          return ContestCard(
            header: e.header,
            subHeader: e.subHeader,
            image: e.image,
            createdDate: e.createdDate,
            daysToFinish: e.daysToFinish,
            isFinished: e.isFinished,
          );
        default:
          return NewsCard(
            header: e.header,
            subHeader: e.subHeader,
            image: e.image,
            createdDate: e.createdDate,
          );
      }
    }));
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
