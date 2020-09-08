import 'package:blogger_app/model/constants.dart';
import 'package:blogger_app/model/details_page_constants.dart';
import 'package:blogger_app/service/feed.service.dart';
import 'package:blogger_app/widget/details/small_card_with_link.dart';
import 'package:blogger_app/widget/details_page_argument.dart';
import 'package:blogger_app/widget/subheader_with_time.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/html_parser.dart';
import 'package:flutter_html/style.dart';

class NewsDetailsPage extends StatefulWidget {
//  final String content;

  @override
  _NewsDetailsPageState createState() => _NewsDetailsPageState();
}

class _NewsDetailsPageState extends State<NewsDetailsPage> {
  var feedService = FeedService();
  var content = '';
  var title = '';
  var subHeader = '';
  DateTime postDate;
  var loaded = false;

  void loadContentById(int id) async {
    feedService.getPostById(id).then((value) {
      setState(() {
        this.content = value.content;
        this.postDate = value.createdDate;
        this.title = value.header;
        this.subHeader = value.subHeader;
        this.loaded = true;
      });
    });
  }

  void getParams() {
    if (!this.loaded) {
      final DetailsPageArgument args =
          ModalRoute.of(context).settings.arguments;

      if (this.content == null ||
          this.content.isEmpty ||
          this.postDate == null) {
        loadContentById(args.id);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    getParams();
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
      child: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text(this.title),
        ),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                Container(
                  padding: kPaddingFromScreenEdge,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SubHeaderWithTime(
                        text: 'Тимур',
                        date: this.postDate,
                        greyColor: true,
                        showAvatar: true,
                      ),
                      SizedBox(
                        height: kPaddingVerticalSize,
                      ),
                      Text(
                        this.title,
                        style: kVideoCardTitleStyle,
                      ),
                      SizedBox(
                        height: kPaddingVerticalSize,
                      ),
                      Text(
                        this.subHeader ?? '',
                        style: kDetailsSubTitleStyle,
                      ),
                    ],
                  ),
                ),
                if (this.content == null || this.content.isEmpty)
                  Text('Loading...'),
                if (this.content != null && !this.content.isEmpty)
                  Html(
                    data: this.content,
                    style: {
                      '*': Style(
                        margin: EdgeInsets.all(0),
                        padding: EdgeInsets.all(0),
                      ),
                      'h2': Style(
                        margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
                      ),
                      'p': Style(
                        margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                        fontSize: FontSize(16),
                        textAlign: TextAlign.justify,
                      ),
                      'img': Style(
                        margin:
                            EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                      ),
                    },
                    customRender: {
                      'img':
                          (RenderContext context, Widget child, attributes, _) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Image(
                            image: AssetImage(attributes['src']),
                          ),
                        );
                      },
                      'my-link':
                          (RenderContext context, Widget child, attributes, _) {
                        return SmallCardWithLink(
                          parsedChild: child,
                          attributes: attributes,
                        );
                      },
//                <my-link data-title='Продаю свою Audi A4 после того как увидел новую'
//                data-id='5'
//                data-img='assets/laptop.jpg'></my-link>
                    },
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
