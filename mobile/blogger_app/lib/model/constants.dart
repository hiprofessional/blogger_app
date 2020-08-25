import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const double kPaddingSize = 20;
const double kPaddingVerticalSize = 10;
const double kBorderRadius = 10;

const EdgeInsetsGeometry kPaddingFromScreenEdge =
    EdgeInsets.symmetric(horizontal: kPaddingSize);
const EdgeInsetsGeometry kPaddingForHeadline = EdgeInsets.fromLTRB(
    kPaddingSize, kPaddingSize + kPaddingVerticalSize, kPaddingSize, 0);

const EdgeInsetsGeometry kCardMargin = EdgeInsets.symmetric(
    vertical: kPaddingVerticalSize, horizontal: kPaddingSize);

const EdgeInsetsGeometry kCardPadding = EdgeInsets.all(kPaddingSize);

const EdgeInsetsGeometry kPaddingForDivider =
    EdgeInsets.fromLTRB(0, kPaddingVerticalSize, 0, 5);

const kHeadlineStyle = TextStyle(
  fontSize: 34,
  fontWeight: FontWeight.bold,
);

const textShadow = Shadow(
  blurRadius: 1,
);
const kNewsCardTitleStyle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.bold,
  color: Colors.white,
  shadows: <Shadow>[
    textShadow,
  ],
);

const kNewsCardTypeTitleStyle = TextStyle(
  fontSize: 12,
  color: Colors.white,
  shadows: <Shadow>[
    textShadow,
  ],
);
final kNewsCardSubTitleStyle = TextStyle(
  fontSize: 14,
  color: Color(0xffc7c7c7),
  shadows: <Shadow>[
    textShadow,
  ],
);

const kVideoCardTitleStyle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.bold,
  color: Colors.black,
);

final kVideoCardSubTitleStyle = TextStyle(
  fontSize: 12,
  color: Color(0xff999999),
);
final kVideoCardChanelTitleStyle = TextStyle(
  fontSize: 12,
  color: Color(0xff6D6D72),
);
