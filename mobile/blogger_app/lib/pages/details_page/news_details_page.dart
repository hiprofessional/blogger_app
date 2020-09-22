import 'package:blogger_app/model/constants.dart';
import 'package:blogger_app/model/details_page_constants.dart';
import 'package:blogger_app/service/feed.service.dart';
import 'package:blogger_app/widget/details/next_post_card.dart';
import 'package:blogger_app/widget/details/small_card_with_link.dart';
import 'package:blogger_app/widget/details_page_argument.dart';
import 'package:blogger_app/widget/popover/popover_menu.dart';
import 'package:blogger_app/widget/subheader_with_time.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/html_parser.dart';
import 'package:flutter_html/style.dart';
//import 'package:popup_menu/popup_menu.dart';

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
  final List<double> textScaleFactors = [0.75, 1, 1.25, 1.5, 1.75, 2];
  int currentScaleId = 1;

  double increaseScale() {
    if (textScaleFactors.length - 1 > currentScaleId) {
      setState(() {
        this.currentScaleId++;
      });
    }
  }

  double decreaseScale() {
    if (currentScaleId > 0) {
      setState(() {
        this.currentScaleId--;
      });
    }
  }

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
    final DetailsPageArgument args = ModalRoute.of(context).settings.arguments;

    if (!this.loaded) {
      if (args.content != '' && args.content != null) {
        this.content = args.content;
        this.postDate = args.date;
        this.title = args.title;
        this.subHeader = args.subHeader;
        this.loaded = true;
      } else {
        loadContentById(args.id);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    getParams();
    PopupMenu.context = context;
    PopupMenu menu = PopupMenu(
//      backgroundColor: Color(0xfffafafa),
      items: [
        MenuItem(
          onTap: () {
            print('sdfsdfsdf');
            this.decreaseScale();
          },
          title: 'Aa',
          textStyle: TextStyle(
            color: Color(0xffc5c5c5),
            fontSize: 16,
          ),
        ),
        MenuItem(
          onTap: () {
            this.increaseScale();
          },
          title: 'Aa',
          textStyle: TextStyle(
            color: Color(0xffc5c5c5),
            fontSize: 22,
          ),
        ),
      ],
      onClickMenu: (MenuItemProvider item) {
//        print(item.menuId);
      },
      stateChanged: (pr) {
        print(pr ? '1212' : '6666');
      },
      onDismiss: () {},
    );

    GlobalKey fontKey = GlobalKey();

    return MediaQuery(
      data: MediaQuery.of(context).copyWith(
        textScaleFactor: 1,
      ),
      child: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          trailing: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CupertinoButton(
                  key: fontKey,
                  padding: EdgeInsets.all(0),
                  child: Text('Aa'),
                  onPressed: () {
                    menu.show(widgetKey: fontKey);
                  }),
              CupertinoButton(
                  padding: EdgeInsets.all(0),
                  child: Icon(
                    CupertinoIcons.share,
                  ),
                  onPressed: () {}),
              CupertinoButton(
                  padding: EdgeInsets.all(0),
                  child: Icon(
                    CupertinoIcons.bookmark,
                  ),
                  onPressed: () {}),
            ],
          ),
        ),
        child: CupertinoScrollbar(
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
                    Center(
                      child: CupertinoActivityIndicator(),
                    ),
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
                          fontSize: FontSize(
                              16 * this.textScaleFactors[this.currentScaleId]),
                          textAlign: TextAlign.justify,
                        ),
                        'img': Style(
                          margin:
                              EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                        ),
                      },
                      customRender: {
                        'img': (RenderContext context, Widget child, attributes,
                            _) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Image(
                              image: AssetImage(attributes['src']),
                            ),
                          );
                        },
                        'my-link': (RenderContext context, Widget child,
                            attributes, _) {
                          return SmallCardWithLink(
                            parsedChild: child,
                            attributes: attributes,
                          );
                        },
                        'next-post': (RenderContext context, Widget child,
                            attributes, _) {
                          return NextPostCard(
                            parsedChild: child,
                            attributes: attributes,
                          );
                        },
                      },
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
