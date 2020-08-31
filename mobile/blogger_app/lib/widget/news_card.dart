import 'package:blogger_app/model/constants.dart';
import 'package:blogger_app/widget/card.dart';
import 'package:flutter/cupertino.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsCard extends StatefulWidget {
  final String header;
  final String subHeader;
  final String image;
  final DateTime createdDate;
  NewsCard({this.header, this.subHeader, this.image, this.createdDate});
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
      height: 300,
      onTap: () {
        Navigator.pushNamed(context, '/details/');
      },
      child: Padding(
        padding: kCardPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  kNewsText,
                  style: kNewsCardTypeTitleStyle,
                ),
                Text(
                  '  •  ',
                  style: kNewsCardTypeTitleStyle,
                ),
                Text(
                  timeago.format(widget.createdDate, locale: 'ru'),
                  style: kNewsCardTypeTitleStyle,
                )
              ],
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
