import 'package:blogger_app/model/constants.dart';
import 'package:blogger_app/model/details_page_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/html_parser.dart';
import 'package:flutter_html/style.dart';

class SmallCardWithLink extends StatelessWidget {
  final Widget parsedChild;
  final Map<String, String> attributes;

  SmallCardWithLink({this.parsedChild, this.attributes});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(kSmallBorderRadius),
          ),
        ),
        shadows: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.12),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(1, 1), // changes position of shadow
          ),
        ],
      ),
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      height: 100,
      child: Row(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(kSmallBorderRadius),
                bottomLeft: Radius.circular(kSmallBorderRadius),
              ),
              child: Image(
                image: AssetImage(attributes['data-img']),
                height: 150,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              width: 200,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Новость'.toUpperCase(),
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xff6D6D72),
                      )
                      // kDetailsSubTitleStyle,
                      ),
                  Text(attributes['data-title'],
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      )
                      // kSmallCardTitleStyle,
                      ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
