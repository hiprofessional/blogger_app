//import 'package:http/http.dart' as http;

import 'package:blogger_app/model/testdata.dart';

import 'package:blogger_app/model/post.dart';

class FeedService {
  Future<SimplePost> getPostById(int id) async {
    return Future.delayed(
      Duration(milliseconds: 100),
      () => allData.singleWhere((el) => el.id == id),
    );
  }

  Future<List<SimplePost>> getPostByType(PostType type) async {
    return Future.delayed(
      Duration(milliseconds: 100),
      () => allData.where((el) => el.postType == type).toList(),
    );
  }

  Future<List<SimplePost>> getAllPosts() async {
    return Future.delayed(
      Duration(milliseconds: 100, seconds: 2),
      () => allData,
    );
  }
}
