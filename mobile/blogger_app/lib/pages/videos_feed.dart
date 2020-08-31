import 'package:blogger_app/model/testdata.dart';
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
          createdDate: e.createdDate,
        )));
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
