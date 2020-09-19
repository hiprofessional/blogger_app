import 'package:blogger_app/model/constants.dart';
import 'package:blogger_app/model/details_page_constants.dart';
import 'package:blogger_app/pages/details_page/video_player.dart';
import 'package:blogger_app/widget/details_page_argument.dart';
import 'package:blogger_app/widget/subheader_with_time.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VideoDetailsPage extends StatefulWidget {
  @override
  _VideoDetailsPageState createState() => _VideoDetailsPageState();
}

class _VideoDetailsPageState extends State<VideoDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final DetailsPageArgument args = ModalRoute.of(context).settings.arguments;

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        trailing: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CupertinoButton(
                padding: EdgeInsets.all(0),
                child: Icon(
                  CupertinoIcons.share,
                ),
                onPressed: () {}),
            CupertinoButton(
                padding: EdgeInsets.all(0),
                child: Icon(
                  CupertinoIcons.bookmark,
                ),
                onPressed: () {}),
          ],
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            VideoPlayer(
              sourceUrl: args.content,
            ),
            SizedBox(
              height: kPaddingVerticalSize,
            ),
            SingleChildScrollView(
              child: Container(
                padding: kPaddingFromScreenEdge,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: kPaddingVerticalSize,
                    ),
                    Text(
                      args.title,
                      style: kVideoCardTitleStyle,
                    ),
                    SizedBox(
                      height: kPaddingVerticalSize,
                    ),
//                    SubHeaderWithTime(
//                      text: 'Тимур',
//                      date: args.date,
//                      greyColor: true,
//                      showAvatar: true,
//                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
