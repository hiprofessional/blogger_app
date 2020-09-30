class SimplePost {
  int id;
  String header;
  String subHeader;
  String image;
  String content;
  PostType postType;
  DateTime createdDate;
  DateTime contestFinishDate;
  bool isContestFinished;
  String additionalDescription;
  String winnerName;
  String winnerImageUrl;
  String contestPrize;
  SimplePost({
    this.id,
    this.header,
    this.subHeader,
    this.image,
    this.content,
    this.postType,
    this.createdDate,
    this.contestFinishDate,
    this.isContestFinished,
    this.additionalDescription,
    this.winnerName,
    this.winnerImageUrl,
    this.contestPrize,
  });
}

enum PostType { News, Video, Contest }
