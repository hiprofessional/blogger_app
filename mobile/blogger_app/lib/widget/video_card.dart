import 'package:blogger_app/model/constants.dart';
import 'package:blogger_app/widget/card.dart';
import 'package:blogger_app/widget/subheader_with_time.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class VideoCard extends StatefulWidget {
  final String header;
  final String subHeader;
  final String image;
  final DateTime createdDate;

  VideoCard({this.header, this.subHeader, this.image, this.createdDate});
  @override
  _VideoCardState createState() => _VideoCardState();
}

class _VideoCardState extends State<VideoCard> {
  @override
  Widget build(BuildContext context) {
    timeago.setLocaleMessages('ru', timeago.RuMessages());
    return SimpleCard(
      header: widget.header,
      subHeader: widget.subHeader,
      showBackgroundImage: false,
      onTap: () {
        Navigator.pushNamed(context, '/details/');
      },
      height: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 130,
                decoration: ShapeDecoration(
//                  color: Colors.red,
                  image: DecorationImage(
                    image: AssetImage(widget.image),
                    fit: BoxFit.fitHeight,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(kBorderRadius),
                      topRight: Radius.circular(kBorderRadius),
                    ),
                  ),
                ),
                child: Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 23,
                    child: Center(
                      child: ClipPath(
                        clipper: CustomTriangleClipper(),
                        child: Container(
                          width: 12,
                          height: 14,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: kCardPadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      kNewVideoText.toUpperCase(),
                      style: kVideoCardSubTitleStyle,
                    ),
                    SizedBox(
                      height: kPaddingVerticalSize,
                    ),
                    Text(
                      widget.header,
                      style: kVideoCardTitleStyle,
                    ),
                    SizedBox(
                      height: kPaddingVerticalSize,
                    ),
                    SubHeaderWithTime(
                      text: 'Hi Pro!',
                      date: widget.createdDate,
                      showAvatar: true,
                      greyColor: true,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomTriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width, size.height / 2);
    path.lineTo(0, size.height);
    path.lineTo(0, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
