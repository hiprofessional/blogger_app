import 'package:blogger_app/model/post.dart';
import 'package:blogger_app/model/testdata.dart';
import 'package:blogger_app/widget/card/card.dart';
import 'package:blogger_app/widget/card/contest_card.dart';
import 'package:flutter/cupertino.dart';

class ContestFeed extends StatefulWidget {
  @override
  _ContestFeedState createState() => _ContestFeedState();
}

class _ContestFeedState extends State<ContestFeed> {
  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];
    widgets.add(HeaderListItem(
      header: 'Конкурсы',
    ));
    widgets.addAll(someContest.map((e) => ContestCard(
          header: e.header,
          subHeader: e.subHeader,
          image: e.image,
          createdDate: e.createdDate,
          contestFinishDate: e.contestFinishDate,
          isContestFinished: e.isContestFinished,
          content: e.content,
        )));

    return SafeArea(
      child: CupertinoPageScaffold(
        child: CupertinoScrollbar(
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
      ),
    );
  }
}
