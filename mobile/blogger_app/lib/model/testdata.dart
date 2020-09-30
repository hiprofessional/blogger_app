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
data-posttype='0'
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
<next-post data-img='assets/laptop.jpg' 
data-id='5' data-posttype='0'
data-title='Продаю свою Audi A4 после того как увидел новую'></next-post>
""";

var descriptionForVideo = """
<p>Захотелось сделать для канала приложение как у Wylsacom.</p>
<p>Разработка будет кроссплатформенной - думаю Flutter должен неплохо в этом помочь.
</p>
<p>В этой серии сделаю страницы со списками новостей, конкурсов, видео.
</p>
<p>Приложение выглядит лаконичным, и поэтому скрывает в себе очень много мелких деталей. Думаю, они помогут лучше узнать фреймворк Flutter. 

</p>
<p>И пока не знаю стоит ли делать розыгрыши. Что думаете?
</p>
<p>
- - - - - - - - - - - - - - - - - - - - - -
</p>
<p>Подписывайся, чтобы не пропустить новые ролики!
</p>
<p>
GitHub: 
<a href='https://github.com/hiprofessional'>https://github.com/hiprofessional</a>
</p>
<p>
Join my Discord! 
<a href='https://discord.gg/ES9PP53'>https://discord.gg/ES9PP53</a>
</p>
<p>
Instagram 
<a href='https://www.instagram.com/hi.professional/'>https://www.instagram.com/hi.professional/</a>
</p>
<p>
- - - - - - - - - - - - - - - - - - - - - -
</p>
""";
final videoPost = SimplePost(
  id: 1,
  header: 'Делаю приложение как у Wylsacom',
  image: 'assets/mask.png',
  postType: PostType.Video,
  createdDate: DateTime.now().add(Duration(minutes: -2)),
  content: 'jOuvnGlCkG8',
  additionalDescription: descriptionForVideo,
);
final contestPost = SimplePost(
    id: 2,
    header: 'Розыгрыш приставки AppleTV',
    image: 'assets/appleTv.png',
    postType: PostType.Contest,
    createdDate: DateTime.now().add(Duration(hours: -1)),
    contestFinishDate: DateTime.now().add(Duration(days: 1, minutes: 1)),
    isContestFinished: false,
    content:
        'Все просто - набираем 1000 подписчиков на канале и разыгрываем приставку');

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
  content: v1content,
);
final newsPost2 = SimplePost(
  id: 5,
  header:
      'Продаю свою Audi A4 после того как увидел новую Продаю свою Audi A4 после того как увидел новую',
  subHeader: 'WAG еще торт.',
  image: 'assets/laptop.jpg',
  postType: PostType.News,
  createdDate: DateTime.now().add(Duration(days: -2)),
  content: '<p>не продаю</p>',
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
