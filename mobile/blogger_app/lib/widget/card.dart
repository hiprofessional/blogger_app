import 'package:blogger_app/model/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeaderListItem extends StatelessWidget {
  final String header;
  HeaderListItem({this.header});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          padding: kPaddingForHeadline,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                this.header,
                style: kHeadlineStyle,
              ),
              CircleAvatar()
            ],
          ),
        ),
        Padding(
          padding: kPaddingForDivider,
          child: Divider(
            indent: kPaddingSize,
          ),
        )
      ],
    );
  }
}

class SimpleCard extends StatefulWidget {
  final String header;
  final String subHeader;
  final String image;

  SimpleCard({this.header, this.subHeader, this.image});
  @override
  _SimpleCardState createState() => _SimpleCardState();
}

class _SimpleCardState extends State<SimpleCard> {
  @override
  Widget build(BuildContext context) {
//    final double width = MediaQuery.of(context).size.width;
    return Container(
      padding: kCardPadding,
      decoration: ShapeDecoration(
        image: DecorationImage(
          image: AssetImage(widget.image),
          fit: BoxFit.cover,
        ),
        color: Colors.teal,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        shadows: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 20,
            offset: Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
      height: 300,
      margin: kCardMargin,
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
