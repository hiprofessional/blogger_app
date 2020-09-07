import 'post.dart';

var v1content = """
<div>
<img src='assets/laptop2.jpg'/>
<p>На этой неделе компания решила не делать 
громких заявлений и особых поводов для новостей. 
Видимо, это затишье перед бурей, когда Apple выпустит 
целый ворох новинок. 
</p>
<my-link data-title='Продаю свою Audi A4 после того как увидел новую'
data-id='5'
data-img='assets/laptop.jpg'></my-link>
<p>
Даты презентации или презентаций пока нет, 
так что все мы заняли выжидающую позицию. 

</p>
<img src='assets/laptop2.jpg'/>
<p>А пока приходится довольствоваться новыми версиями операционных систем:
</p>

<h2>Автомобили</h2>
<p>Главная новинка недели — новенький S-Class. 
Потрясающая машина, которая точно станет популярной:
</p>
</div>
""";

final videoPost = SimplePost(
  id: 1,
  header: 'Делаю приложение как у Wylsacom',
  image: 'assets/mask.png',
  postType: PostType.Video,
  createdDate: DateTime.now().add(Duration(minutes: -2)),
  content: 'https://youtu.be/jOuvnGlCkG8',
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
  header: 'Новости Aplle - утечки, релизы',
  subHeader: 'Все любят скидки.',
  image: 'assets/laptop2.jpg',
  postType: PostType.News,
  createdDate: DateTime.now().add(Duration(days: -1)),
  content: v1content + v1content + v1content,
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
  newsPost1,
  videoPost,
  contestPost,
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
  newsPost1,
  videoPost,
  contestPost,
  newsPost2,
];
