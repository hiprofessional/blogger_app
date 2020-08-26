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
  final bool isFinished;
  final int daysToFinish;

  ContestCard({
    this.header,
    this.subHeader,
    this.image,
    this.createdDate,
    this.isFinished,
    this.daysToFinish,
  });
  @override
  _ContestCardState createState() => _ContestCardState();
}

class _ContestCardState extends State<ContestCard> {
  getMessageForFinish(int days) {
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
                    if (widget.isFinished)
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
                    if (!widget.isFinished)
                      Row(
                        children: <Widget>[
                          Icon(
                            CupertinoIcons.clock_solid,
                            color: Color(0xff2FC576),
                          ),
                          SizedBox(
                            width: kPaddingVerticalSize,
                          ),
                          Text(
                            getMessageForFinish(widget.daysToFinish),
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
