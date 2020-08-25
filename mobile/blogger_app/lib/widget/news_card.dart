import 'package:blogger_app/model/constants.dart';
import 'package:blogger_app/widget/card.dart';
import 'package:flutter/cupertino.dart';

class NewsCard extends StatefulWidget {
  final String header;
  final String subHeader;
  final String image;
  NewsCard({this.header, this.subHeader, this.image});
  @override
  _NewsCardState createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  @override
  Widget build(BuildContext context) {
    return SimpleCard(
      header: widget.header,
      subHeader: widget.subHeader,
      image: widget.image,
      showBackgroundImage: true,
      height: 300,
      child: Padding(
        padding: kCardPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  'Новости',
                  style: kNewsCardTypeTitleStyle,
                ),
                Text(
                  '  •  ',
                  style: kNewsCardTypeTitleStyle,
                ),
                Text(
                  '16 часов назад',
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
                  widget.subHeader,
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
