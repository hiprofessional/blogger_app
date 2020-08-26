import 'package:blogger_app/widget/card.dart';

class SimplePost {
  String header;
  String subHeader;
  String image;
  PostType postType;
  DateTime createdDate;
  SimplePost({
    this.header,
    this.subHeader,
    this.image,
    this.postType,
    this.createdDate,
  });
}

enum PostType { News, Video, Contest }

final List<SimplePost> somePosts = [
  SimplePost(
    header: 'Делаю приложение как у Wylsacom',
    image: 'assets/mask.png',
    postType: PostType.Video,
    createdDate: DateTime.now().add(Duration(minutes: -2)),
  ),
  SimplePost(
    header: 'Началась распродажа смартфонов OPPPO с кешбэком',
    subHeader: 'Все любят скидки.',
    image: 'assets/laptop2.jpg',
    postType: PostType.News,
    createdDate: DateTime.now().add(Duration(days: -1)),
  ),
  SimplePost(
    header: 'Продаю свою Audi A4 после того как увидел новую',
    subHeader: 'WAG еще торт.',
    image: 'assets/laptop.jpg',
    postType: PostType.News,
    createdDate: DateTime.now().add(Duration(days: -2)),
  )
];

final List<SimplePost> someVideos = [
  SimplePost(
    header: 'Делаю приложение как у Wylsacom',
    image: 'assets/mask.png',
    postType: PostType.Video,
  ),
];
