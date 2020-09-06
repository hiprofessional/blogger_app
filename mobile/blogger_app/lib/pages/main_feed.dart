import 'package:blogger_app/model/post.dart';
import 'package:blogger_app/model/testdata.dart';
import 'package:blogger_app/service/feed.service.dart';
import 'package:blogger_app/widget/card.dart';
import 'package:blogger_app/widget/contest_card.dart';
import 'package:blogger_app/widget/news_card.dart';
import 'package:blogger_app/widget/video_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainFeed extends StatefulWidget {
  @override
  _MainFeedState createState() => _MainFeedState();
}

class _MainFeedState extends State<MainFeed> {
  var feedService = FeedService();
  bool loading = true;
  List<SimplePost> posts = [];
  List<Widget> header = [
    HeaderListItem(
      header: 'Лента',
    )
  ];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    feedService.getAllPosts().then((value) {
      setState(() {
        this.posts = value;
        this.loading = false;
      });
    });
  }

  List<Widget> getWidgetsForPosts(List<SimplePost> items) {
    List<Widget> widgets = [];

    widgets.addAll(items.map((e) {
      switch (e.postType) {
        case PostType.News:
          return NewsCard(
            header: e.header,
            subHeader: e.subHeader,
            image: e.image,
            createdDate: e.createdDate,
            content: e.content,
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
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    var widgets = getWidgetsForPosts(this.posts);
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
                    return header[index];
                  },
                  childCount: header.length,
                ),
              ),
            ),
            if (this.loading) _beforeDataLoaded(),
            if (!this.loading)
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

  Widget _beforeDataLoaded() {
    return new SliverFillRemaining(
      child: new Container(
        child: new Center(
          child: new CupertinoActivityIndicator(),
        ),
      ),
    );
  }
}
