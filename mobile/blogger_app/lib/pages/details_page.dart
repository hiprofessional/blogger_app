import 'package:flutter/cupertino.dart';

class DetailsPage extends StatefulWidget {
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(),
        child: Container(
          child: Center(
            child: Text('Hi'),
          ),
        ),
      ),
    );
  }
}
