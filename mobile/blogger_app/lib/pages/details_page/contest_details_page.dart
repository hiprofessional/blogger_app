import 'package:blogger_app/model/constants.dart';
import 'package:blogger_app/model/contest_page_constants.dart';
import 'package:blogger_app/model/details_page_constants.dart';
import 'package:blogger_app/widget/details_page_argument.dart';
import 'package:flutter/cupertino.dart';

class ContestDetailsPage extends StatefulWidget {
  @override
  _ContestDetailsPageState createState() => _ContestDetailsPageState();
}

class _ContestDetailsPageState extends State<ContestDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final DetailsPageArgument args = ModalRoute.of(context).settings.arguments;

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(),
      child: CupertinoScrollbar(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: kPaddingFromScreenEdge,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    args.title,
                    style: kContestTitleStyle,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    args.content,
                    style: kContestDetailsStyle,
                  ),
                  Image(
                    image: AssetImage(args.imageUrl),
                  ),
                  if (!args.isContestFinished)
                    SizedBox(
                      width: double.infinity,
                      child: CupertinoButton.filled(
                        child: Text('Принять участие'),
                        onPressed: () {},
                      ),
                    ),
                  if (args.isContestFinished)
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Приняло участие',
                                  style: kContestParticipateTitleStyle,
                                ),
                                Text(
                                  '567',
                                  style: kContestParticipateCountStyle,
                                ),
                              ],
                            ),
                            Text(
                              'Итоги подведены',
                              style: kContestParticipateSummStyle,
                            ),
                          ],
                        ),
                      ],
                    )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
