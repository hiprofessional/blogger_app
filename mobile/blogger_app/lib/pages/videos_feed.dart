import 'package:blogger_app/model/post.dart';
import 'package:blogger_app/widget/card.dart';
import 'package:blogger_app/widget/video_card.dart';
import 'package:flutter/cupertino.dart';

class VideosFeed extends StatefulWidget {
  @override
  _VideosFeedState createState() => _VideosFeedState();
}

class _VideosFeedState extends State<VideosFeed> {
  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];
    widgets.add(HeaderListItem(
      header: 'Видео',
    ));
    widgets.addAll(someVideos.map((e) => VideoCard(
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
