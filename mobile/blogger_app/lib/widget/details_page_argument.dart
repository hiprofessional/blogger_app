import 'package:blogger_app/model/post.dart';

class DetailsPageArgument {
  final String title;
  final String subHeader;
  final String content;
  final DateTime date;
  final int id;
  final String description;
  final String imageUrl;

  final SimplePost post;

  DetailsPageArgument({
    this.title,
    this.subHeader,
    this.content,
    this.date,
    this.id,
    this.post,
    this.description,
    this.imageUrl,
  });
}
