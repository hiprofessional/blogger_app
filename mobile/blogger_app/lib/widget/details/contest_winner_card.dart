import 'package:blogger_app/model/constants.dart';
import 'package:blogger_app/model/contest_page_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContestWinnerCard extends StatelessWidget {
  final String winnerName;
  final String winnerImageUrl;
  final String prize;

  ContestWinnerCard({this.winnerImageUrl, this.winnerName, this.prize});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: kPaddingForWinnerCard,
      decoration: ShapeDecoration(
        color: CupertinoTheme.of(context)
            .copyWith(
              scaffoldBackgroundColor:
                  CupertinoTheme.brightnessOf(context) == Brightness.dark
                      ? Color(0xff333333)
                      : CupertinoTheme.of(context).scaffoldBackgroundColor,
            )
            .scaffoldBackgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(kSmallBorderRadius),
          ),
        ),
        shadows: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.12),
            spreadRadius: 5,
            blurRadius: 20,
            offset: Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 28,
          ),
          SizedBox(
            width: kPaddingSize,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                this.winnerName,
                style: kWinnerNameStyle.copyWith(
                    color:
                        CupertinoTheme.of(context).textTheme.textStyle.color),
              ),
              Text(
                this.prize,
                style: kPrizeStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
