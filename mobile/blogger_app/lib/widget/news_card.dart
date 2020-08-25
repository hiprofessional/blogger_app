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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                'Новости',
                style: kCardTypeTitleStyle,
              ),
              Text(
                '  •  ',
                style: kCardTypeTitleStyle,
              ),
              Text(
                '16 часов назад',
                style: kCardTypeTitleStyle,
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                widget.header,
                style: kCardTitleStyle,
              ),
              SizedBox(
                height: kPaddingVerticalSize,
              ),
              Text(
                widget.subHeader,
                style: kCardSubTitleStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
