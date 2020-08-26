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
            contestFinishDate: e.contestFinishDate,
            isContestFinished: e.isContestFinished,
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
        child: CustomScrollView(
          slivers: <Widget>[
            new CupertinoSliverRefreshControl(
              onRefresh: () {
                return Future.delayed(const Duration(seconds: 3));
              },
            ),
            new SliverSafeArea(
              top: true,
              sliver: new SliverList(
                delegate: new SliverChildBuilderDelegate(
                  (context, index) {
                    return widgets[index];
                  },
                  childCount: widgets.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
