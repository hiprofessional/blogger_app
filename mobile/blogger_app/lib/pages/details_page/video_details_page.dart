import 'package:blogger_app/model/constants.dart';
import 'package:blogger_app/model/details_page_constants.dart';
import 'package:blogger_app/pages/details_page/video_player.dart';
import 'package:blogger_app/widget/details_page_argument.dart';
import 'package:blogger_app/widget/subheader_with_time.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/html_parser.dart';
import 'package:flutter_html/style.dart';
import 'package:url_launcher/url_launcher.dart';

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
        child: SingleChildScrollView(
          child: Column(
            children: [
              VideoPlayer(
                sourceUrl: args.content,
              ),
              SizedBox(
                height: kPaddingVerticalSize,
              ),
              Container(
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

                    Html(
                      data: args.description,
                      style: {
                        '*': Style(
                          margin: EdgeInsets.all(0),
                          padding: EdgeInsets.all(0),
                        ),
                        'h2': Style(
                          margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
                        ),
                        'p': Style(
                          margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                          fontSize: FontSize(16),
                          textAlign: TextAlign.justify,
                        ),
                      },
                      onLinkTap: (url) {
                        print(url);
                        _launchURL(url);
                      },
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

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
