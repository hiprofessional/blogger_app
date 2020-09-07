//import 'package:flutter/material.dart';
import 'package:blogger_app/pages/details_page/news_details_page.dart';
import 'package:blogger_app/pages/main_screen.dart';
import 'package:flutter/cupertino.dart';

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
      routes: {
        '/': (context) => MainScreen(),
      },
    );
  }
}
