import 'package:blogger_app/widget/card.dart';

class SimplePost {
  String header;
  String subHeader;
  String image;

  SimplePost({this.header, this.subHeader, this.image});
}

final List<SimplePost> somePosts = [
  SimplePost(
    header: 'Началась распродажа смартфонов OPPPO с кешбэком',
    subHeader: 'Все любят скидки.',
    image: 'assets/laptop2.jpg',
  ),
  SimplePost(
    header: 'Продаю свою Audi A4 после того как увидел новую',
    subHeader: 'WAG еще торт.',
    image: 'assets/laptop.jpg',
  )
];

final List<SimplePost> someVideos = [
  SimplePost(
    header: 'Делаю приложение как у Wylsacom',
//    subHeader: 'Все любят скидки.',
    image: 'assets/mask.png',
  ),
];
