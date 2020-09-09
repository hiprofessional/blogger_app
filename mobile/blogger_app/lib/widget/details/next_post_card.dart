import 'package:blogger_app/model/constants.dart';
import 'package:blogger_app/model/details_page_constants.dart';
import 'package:blogger_app/model/post.dart';
import 'package:blogger_app/utils/routes_util.dart';
import 'package:blogger_app/widget/details_page_argument.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/html_parser.dart';
import 'package:flutter_html/style.dart';

class NextPostCard extends StatelessWidget {
  final Widget parsedChild;
  final Map<String, String> attributes;
  final cardHeight = 76.0 + 40.0;

  NextPostCard({
    this.parsedChild,
    this.attributes,
  });

  @override
  Widget build(BuildContext context) {
    final title = attributes['data-title'];
    final img = attributes['data-img'];
    final PostType nextPagePostType = PostType.values.singleWhere(
        (el) => el.index.toString() == attributes['data-posttype']);
    final int id = int.parse(attributes['data-id']) ?? 0;
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
            context, RoutesUtil.getRouteByPostType(nextPagePostType),
            arguments: DetailsPageArgument(
              title: title,
              id: id,
            ));
      },
      child: Container(
//        color: Colors.red,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        height: cardHeight,
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.all(Radius.circular(kSmallBorderRadius)),
                  boxShadow: [
                    new BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 10,
                      blurRadius: 20,
                      offset: Offset(0, 5), // changes position of shadow
                    )
                  ],
                ),
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.all(Radius.circular(kSmallBorderRadius)),
                  child: Image(
                    image: AssetImage(img),
                    height: cardHeight,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                width: 100,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Читайте далее'.toUpperCase(),
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff999999),
                        )
                        // kDetailsSubTitleStyle,
                        ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(title,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 14,
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
      ),
    );
  }
}
