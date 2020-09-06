import 'package:blogger_app/model/constants.dart';
import 'package:blogger_app/model/details_page_constants.dart';
import 'package:blogger_app/widget/details_page_argument.dart';
import 'package:blogger_app/widget/subheader_with_time.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_html/flutter_html.dart';

class DetailsPage extends StatefulWidget {
//  final String content;

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    final DetailsPageArgument args = ModalRoute.of(context).settings.arguments;
    print(args.title);
    return SafeArea(
      child: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text(args.title),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 65,
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
              Image(image: AssetImage('assets/laptop.jpg')),
              Html(
                data: args.content,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
