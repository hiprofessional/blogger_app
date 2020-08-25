import 'package:blogger_app/model/constants.dart';
import 'package:blogger_app/widget/card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VideoCard extends StatefulWidget {
  final String header;
  final String subHeader;
  final String image;

  VideoCard({this.header, this.subHeader, this.image});
  @override
  _VideoCardState createState() => _VideoCardState();
}

class _VideoCardState extends State<VideoCard> {
  @override
  Widget build(BuildContext context) {
    return SimpleCard(
      header: widget.header,
      subHeader: widget.subHeader,
      showBackgroundImage: false,
//      height: 320,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 150,
                decoration: ShapeDecoration(
                  color: Colors.red,
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
                  child: Container(
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 23,
                      child: Center(
                        child: ClipPath(
                          clipper: CustomTriangleClipper(),
                          child: Container(
                            width: 16,
                            height: 18,
                            color: Colors.black,
                          ),
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
                      'Новое видео'.toUpperCase(),
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
                    Row(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 10,
                        ),
                        SizedBox(
                          width: kPaddingVerticalSize,
                        ),
                        Text(
                          'Hi Pro!',
                          style: kVideoCardChanelTitleStyle,
                        ),
                        Text(
                          '  •  ',
                          style: kVideoCardChanelTitleStyle,
                        ),
                        Text(
                          '16 часов назад',
                          style: kVideoCardChanelTitleStyle,
                        )
                      ],
                    )
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
//    path.lineTo(size.width, 0);
//    path.lineTo(size.width, size.height);
//    path.lineTo(0, 0);

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
