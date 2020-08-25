import 'package:blogger_app/model/post.dart';
import 'package:blogger_app/widget/card.dart';
import 'package:flutter/cupertino.dart';

class MainFeed extends StatefulWidget {
  @override
  _MainFeedState createState() => _MainFeedState();
}

class _MainFeedState extends State<MainFeed> {
  getData(int index) {
    if (index == 0) {
      return HeaderListItem(
        header: 'Лента',
      );
    } else {
      return SimpleCard(
          header: somePosts[index - 1].header,
          subHeader: somePosts[index - 1].subHeader,
          image: somePosts[index - 1].image);
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];
    widgets.add(HeaderListItem(
      header: 'Лента',
    ));
    widgets.addAll(somePosts.map((e) =>
        SimpleCard(header: e.header, subHeader: e.subHeader, image: e.image)));
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
