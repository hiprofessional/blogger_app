import 'package:blogger_app/model/post.dart';
import 'package:blogger_app/widget/card.dart';
import 'package:flutter/cupertino.dart';

class MainFeed extends StatefulWidget {
  @override
  _MainFeedState createState() => _MainFeedState();
}

class _MainFeedState extends State<MainFeed> {
  getHeader() {
    return Column(
      children: <Widget>[Text('Лента')],
    );
  }

  getData(int index) {
    if (index == 0) {
      return ListItem(
        header: 'Лента',
      );
    } else {
      return SimpleCard(
        header: somePosts[index - 1].header,
        subHeader: somePosts[index - 1].subHeader,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CupertinoPageScaffold(
        child: ListView.builder(
          itemCount: somePosts.length + 1,
          itemBuilder: (context, index) {
            return getData(index);
          },
        ),
      ),
    );
  }
}
