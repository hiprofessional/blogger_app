import 'post.dart';

final videoPost = SimplePost(
  id: 1,
  header: 'Делаю приложение как у Wylsacom',
  image: 'assets/mask.png',
  postType: PostType.Video,
  createdDate: DateTime.now().add(Duration(minutes: -2)),
);
final contestPost = SimplePost(
  id: 2,
  header: 'Розыгрыш приставки AppleTV',
  image: 'assets/appleTv.png',
  postType: PostType.Contest,
  createdDate: DateTime.now().add(Duration(hours: -1)),
  contestFinishDate: DateTime.now().add(Duration(days: 1, minutes: 1)),
  isContestFinished: false,
);

final contestPost2 = SimplePost(
  id: 3,
  header: 'Розыгрыш приставки AppleTV 4k',
  image: 'assets/appleTv.png',
  postType: PostType.Contest,
  createdDate: DateTime.now().add(Duration(hours: -5)),
  contestFinishDate: DateTime.now().add(Duration(days: 2)),
  isContestFinished: true,
);

final newsPost1 = SimplePost(
  id: 4,
  header: 'Началась распродажа смартфонов OPPPO с кешбэком',
  subHeader: 'Все любят скидки.',
  image: 'assets/laptop2.jpg',
  postType: PostType.News,
  createdDate: DateTime.now().add(Duration(days: -1)),
);
final newsPost2 = SimplePost(
  id: 5,
  header: 'Продаю свою Audi A4 после того как увидел новую',
  subHeader: 'WAG еще торт.',
  image: 'assets/laptop.jpg',
  postType: PostType.News,
  createdDate: DateTime.now().add(Duration(days: -2)),
);

final List<SimplePost> somePosts = [
  videoPost,
  contestPost,
  newsPost1,
  newsPost2,
];

final List<SimplePost> someVideos = [
  videoPost,
];

final List<SimplePost> someContest = [
  contestPost,
  contestPost2,
];

final List<SimplePost> allData = [
  videoPost,
  contestPost,
  newsPost1,
  newsPost2,
];
