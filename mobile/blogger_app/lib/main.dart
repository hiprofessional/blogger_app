//import 'package:flutter/material.dart';
import 'package:blogger_app/pages/main_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:timeago/timeago.dart' as timeago;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: CupertinoThemeData(
//        primaryColor: Color(0xFFFF2D55),
          ),
      home: CupertinoPageScaffold(
//        navigationBar: CupertinoNavigationBar(),
        child: MainScreen(),
      ),
    );
  }
}
