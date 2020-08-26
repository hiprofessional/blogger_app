import 'package:blogger_app/widget/card.dart';

class SimplePost {
  String header;
  String subHeader;
  String image;
  PostType postType;
  DateTime createdDate;
  final bool isFinished;
  final int daysToFinish;
  SimplePost({
    this.header,
    this.subHeader,
    this.image,
    this.postType,
    this.createdDate,
    this.isFinished,
    this.daysToFinish,
  });
}

enum PostType { News, Video, Contest }

final videoPost = SimplePost(
  header: 'Делаю приложение как у Wylsacom',
  image: 'assets/mask.png',
  postType: PostType.Video,
  createdDate: DateTime.now().add(Duration(minutes: -2)),
);
final contestPost = SimplePost(
  header: 'Розыгрыш приставки AppleTV',
  image: 'assets/appleTv.png',
  postType: PostType.Contest,
  createdDate: DateTime.now().add(Duration(hours: -1)),
  daysToFinish: 2,
  isFinished: false,
);

final contestPost2 = SimplePost(
  header: 'Розыгрыш приставки AppleTV 4k',
  image: 'assets/appleTv.png',
  postType: PostType.Contest,
  createdDate: DateTime.now().add(Duration(hours: -5)),
  daysToFinish: 0,
  isFinished: true,
);
final List<SimplePost> somePosts = [
  videoPost,
  contestPost,
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
  videoPost,
];

final List<SimplePost> someContest = [
  contestPost,
  contestPost2,
];
