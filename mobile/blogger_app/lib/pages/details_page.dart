import 'package:flutter/cupertino.dart';
import 'package:flutter_html/flutter_html.dart';

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
        child: Column(
          children: [
            SizedBox(
              height: 45,
            ),
            Row(),
            Html(
              data: """
              <div>
                <h1>Hello there</h1>
              </div>
              """,
            ),
          ],
        ),
      ),
    );
  }
}
