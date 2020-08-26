import 'package:blogger_app/model/post.dart';
import 'package:blogger_app/widget/card.dart';
import 'package:blogger_app/widget/contest_card.dart';
import 'package:blogger_app/widget/video_card.dart';
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
