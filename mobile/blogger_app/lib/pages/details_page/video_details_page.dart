import 'package:blogger_app/model/constants.dart';
import 'package:blogger_app/model/details_page_constants.dart';
import 'package:blogger_app/widget/details_page_argument.dart';
import 'package:blogger_app/widget/subheader_with_time.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/html_parser.dart';
import 'package:flutter_html/style.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoDetailsPage extends StatefulWidget {
  @override
  _VideoDetailsPageState createState() => _VideoDetailsPageState();
}

class _VideoDetailsPageState extends State<VideoDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final DetailsPageArgument args = ModalRoute.of(context).settings.arguments;
    String videoId;
    print(args.content);
    videoId = YoutubePlayer.convertUrlToId(args.content);

    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: true,
      ),
    );

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(args.title),
      ),
      child: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              YoutubePlayer(
                controller: _controller,
                showVideoProgressIndicator: true,
//                videoProgressIndicatorColor: Colors.amber,
//                progressColors: ProgressColors(
//                  playedColor: Colors.amber,
//                  handleColor: Colors.amberAccent,
//                ),
                onReady: () {
//                  _controller.addListener(listener);
                },
              ),
              Container(
                padding: kPaddingFromScreenEdge,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SubHeaderWithTime(
                      text: 'Тимур',
                      date: args.date,
                      greyColor: true,
                      showAvatar: true,
                    ),
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
                    if (args.subHeader != null)
                      Text(
                        args.subHeader,
                        style: kDetailsSubTitleStyle,
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
