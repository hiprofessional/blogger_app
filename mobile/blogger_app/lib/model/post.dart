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
  });
}

enum PostType { News, Video, Contest }
