import 'package:blogger_app/model/constants.dart';
import 'package:blogger_app/widget/card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class ContestCard extends StatefulWidget {
  final String header;
  final String subHeader;
  final String image;
  final DateTime createdDate;
  final DateTime contestFinishDate;
  bool isContestFinished;

  ContestCard({
    this.header,
    this.subHeader,
    this.image,
    this.createdDate,
    this.contestFinishDate,
    this.isContestFinished,
  });
  @override
  _ContestCardState createState() => _ContestCardState();
}

class _ContestCardState extends State<ContestCard> {
  getMessageForFinish(DateTime contestFinishDate) {
    final days = howMuchDaysToFinish(contestFinishDate);
    var mod = days % 10;
    var modH = days % 100;

    if (mod == 1 && modH != 11) {
      return 'Остался $days день';
    } else if (<int>[2, 3, 4].contains(mod) &&
        !<int>[12, 13, 14].contains(modH)) {
      return 'Осталось $days дня';
    }
    return 'Осталось $days дней';
  }

  int howMuchDaysToFinish(DateTime contestFinishDate) {
    Duration difference = contestFinishDate.difference(DateTime.now());
    return difference.inDays;
  }

  @override
  Widget build(BuildContext context) {
    timeago.setLocaleMessages('ru', timeago.RuMessages());
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
              Padding(
                padding: kCardPadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    if (widget.isContestFinished)
                      Text(
                        kContestFinishedText.toUpperCase(),
                        style: kVideoCardSubTitleStyle,
                      ),
                    if (widget.subHeader != null)
                      Text(
                        widget.subHeader.toUpperCase(),
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
                    if (!widget.isContestFinished)
                      Row(
                        children: <Widget>[
                          Icon(
                            CupertinoIcons.clock_solid,
                            color: Color(0xff2FC576),
                            size: 16,
                          ),
                          SizedBox(
                            width: kPaddingVerticalSize,
                          ),
                          Text(
                            getMessageForFinish(widget.contestFinishDate),
                            style: kTimeToFinishContestStyle,
                          ),
                        ],
                      )
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 150,
                decoration: ShapeDecoration(
                  image: DecorationImage(
                    image: AssetImage(widget.image),
                    fit: BoxFit.fitHeight,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(kBorderRadius),
                      bottomRight: Radius.circular(kBorderRadius),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
