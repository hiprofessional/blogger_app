import 'package:blogger_app/model/constants.dart';
import 'package:blogger_app/model/details_page_constants.dart';
import 'package:blogger_app/widget/details_page_argument.dart';
import 'package:blogger_app/widget/subheader_with_time.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/html_parser.dart';
import 'package:flutter_html/style.dart';

class DetailsPage extends StatefulWidget {
//  final String content;

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    final DetailsPageArgument args = ModalRoute.of(context).settings.arguments;
    var fullWidth = MediaQuery.of(context).size.width;
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
      child: CupertinoPageScaffold(
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
                      Text(
                        args.subHeader,
                        style: kDetailsSubTitleStyle,
                      ),
                      SizedBox(
                        height: kPaddingVerticalSize * 2,
                      ),
                    ],
                  ),
                ),
                Html(
                  data: args.content,
                  style: {
                    '*': Style(
                      margin: EdgeInsets.all(0),
                      padding: EdgeInsets.all(0),
                    ),
                    'h2': Style(
                      margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
                    ),
                    'p': Style(
                      margin: kPaddingFromScreenEdge,
                      fontSize: FontSize(16),
                      textAlign: TextAlign.justify,
                    ),
                    'img': Style(
                      margin: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                    ),
                  },
                  customRender: {
                    'img':
                        (RenderContext context, Widget child, attributes, _) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Image(
                          width: fullWidth * 8,
                          image: AssetImage(attributes['src']),
                        ),
                      );
                    },
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
