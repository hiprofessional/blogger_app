import 'package:blogger_app/model/constants.dart';
import 'package:blogger_app/widget/details_page_argument.dart';
import 'package:blogger_app/widget/card/card.dart';
import 'package:blogger_app/widget/subheader_with_time.dart';
import 'package:flutter/cupertino.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsCard extends StatefulWidget {
  final String header;
  final String subHeader;
  final String image;
  final DateTime createdDate;
  final int id;

  final String content;
  NewsCard(
      {this.header,
      this.subHeader,
      this.image,
      this.createdDate,
      this.id,
      this.content});
  @override
  _NewsCardState createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  @override
  Widget build(BuildContext context) {
    timeago.setLocaleMessages('Ru', timeago.RuMessages());
    return SimpleCard(
      header: widget.header,
      subHeader: widget.subHeader,
      image: widget.image,
      showBackgroundImage: true,
      height: 380,
      onTap: () {
        Navigator.pushNamed(context, '/details/news',
            arguments: DetailsPageArgument(
              title: widget.header,
              subHeader: widget.subHeader,
              content: widget.content,
              date: widget.createdDate,
              id: widget.id,
            ));
      },
      child: Padding(
        padding: kCardPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SubHeaderWithTime(
              text: kNewsText,
              date: widget.createdDate,
              showAvatar: false,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  widget.header,
                  style: kNewsCardTitleStyle,
                ),
                SizedBox(
                  height: kPaddingVerticalSize,
                ),
                Text(
                  widget.subHeader ?? '',
                  style: kNewsCardSubTitleStyle,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
