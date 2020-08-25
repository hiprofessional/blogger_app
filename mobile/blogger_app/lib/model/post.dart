import 'package:blogger_app/widget/card.dart';

class SimplePost {
  String header;
  String subHeader;

  SimplePost({this.header, this.subHeader});
}

final List<SimplePost> somePosts = [
  SimplePost(
      header: 'Началась распродажа смартфонов OPPPO с кешбэком',
      subHeader: 'Все любят скидки.'),
  SimplePost(
      header: 'Продаю свою Audi A4 после того как увидел новую',
      subHeader: 'WAG еще торт.')
];
