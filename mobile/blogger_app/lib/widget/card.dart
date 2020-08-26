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
  final Widget child;
  final double height;
  final bool showBackgroundImage;
  final DateTime contestFinishDate;

  SimpleCard({
    this.header,
    this.subHeader,
    this.image,
    this.child,
    this.height,
    this.showBackgroundImage,
    this.contestFinishDate,
  });
  @override
  _SimpleCardState createState() => _SimpleCardState();
}

class _SimpleCardState extends State<SimpleCard> {
  @override
  Widget build(BuildContext context) {
//    final double width = MediaQuery.of(context).size.width;
    return Container(
      decoration: ShapeDecoration(
        image: widget.showBackgroundImage
            ? DecorationImage(
                image: AssetImage(widget.image),
                fit: BoxFit.cover,
              )
            : null,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(kBorderRadius),
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
      height: widget.height,
      margin: kCardMargin,
      child: widget.child,
    );
  }
}
