import 'package:blogger_app/model/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  final String header;
  ListItem({this.header});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          padding: kPaddingForLargeTitle,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                this.header,
                style: kLargeTitleStyle,
              ),
              CircleAvatar()
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 25),
          child: Divider(
            indent: kPaddingSize,
          ),
        )
      ],
    );
  }
}

class SimpleCard extends ListItem {
  final String header;
  final String subHeader;

  SimpleCard({this.header, this.subHeader});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        image: DecorationImage(
          image: AssetImage('assets/mask.png'),
          fit: BoxFit.cover,
        ),
        color: Colors.teal,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        shadows: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 20,
            offset: Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
      height: 375,
      margin: kCardMargin,
      child: Column(
        children: <Widget>[
          Text('Новости'),
          Text(header),
          Text(subHeader),
        ],
      ),
    );
  }
}
