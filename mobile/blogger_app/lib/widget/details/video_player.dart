import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:webview_flutter/webview_flutter.dart';

class VideoPlayer extends StatefulWidget {
  final String sourceUrl;
  VideoPlayer({this.sourceUrl});
  @override
  _VideoPlayerState createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  final aspectRatio = 16 / 9;
  final embedYoutubeTemplate = 'https://www.youtube.com/embed/';

  @override
  Widget build(BuildContext context) {
    final widthOfScreen = MediaQuery.of(context).size.width;
    var heightOfVideoContainer = widthOfScreen / aspectRatio;
    return _buildVideoPlayerWidget(heightOfVideoContainer);
  }

  Widget _buildVideoPlayerWidget(double height) {
    return Container(
      alignment: Alignment.center,
      height: height,
      child: Builder(builder: (BuildContext context) {
        return WebView(
          initialUrl: embedYoutubeTemplate + widget.sourceUrl,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
          navigationDelegate: (NavigationRequest request) {
            return NavigationDecision.navigate;
          },
          gestureNavigationEnabled: true,
        );
      }),
    );
  }
}
