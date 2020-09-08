import 'package:blogger_app/model/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class SubHeaderWithTime extends StatelessWidget {
  final String text;
  final DateTime date;
  final bool showAvatar;
  final bool greyColor;

  SubHeaderWithTime({
    this.text,
    this.date,
    this.showAvatar = false,
    this.greyColor = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        if (showAvatar)
          Row(
            children: [
              CircleAvatar(
                radius: 10,
              ),
              SizedBox(
                width: kPaddingVerticalSize,
              ),
            ],
          ),
        Text(
          this.text,
          style: this.greyColor
              ? kVideoCardChanelTitleStyle
              : kNewsCardTypeTitleStyle,
        ),
        Text(
          '  •  ',
          style: this.greyColor
              ? kVideoCardChanelTitleStyle
              : kNewsCardTypeTitleStyle,
        ),
        if (this.date != null)
          Text(
            timeago.format(this.date, locale: 'ru'),
            style: this.greyColor
                ? kVideoCardChanelTitleStyle
                : kNewsCardTypeTitleStyle,
          )
      ],
    );
  }
}
