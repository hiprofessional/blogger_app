import 'package:blogger_app/model/post.dart';

class RoutesUtil {
  static String getRouteByPostType(PostType postType) {
    switch (postType) {
      case PostType.News:
        return '/details/news';
      case PostType.Video:
        return '/details/video';
      case PostType.Contest:
        return '/details/contest';
    }
  }
}
