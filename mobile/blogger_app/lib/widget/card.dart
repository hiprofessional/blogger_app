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
  final Function onTap;

  SimpleCard({
    this.header,
    this.subHeader,
    this.image,
    this.child,
    this.height,
    this.showBackgroundImage,
    this.contestFinishDate,
    this.onTap,
  });
  @override
  _SimpleCardState createState() => _SimpleCardState();
}

class _SimpleCardState extends State<SimpleCard> {
  var trX = 0.0;
  var trY = 0.0;
  var scale = 1.0;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTapDown: (d) {
        setState(() {
          scale = 0.98;
          trX = 0.01 * width * scale;
          trY = 0.01 * widget.height;
        });
      },
      onTapUp: (d) {
        setState(() {
          scale = 1;
          trX = 0.0;
          trY = 0.0;
        });
      },
      onTap: () {
        widget.onTap();
      },
      child: AnimatedContainer(
        duration: new Duration(milliseconds: 140),
        height: widget.height,
        transform: Matrix4.identity()
          ..translate(trX, trY)
          ..scale(scale, scale),
        child: Container(
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
        ),
      ),
    );
  }
}
