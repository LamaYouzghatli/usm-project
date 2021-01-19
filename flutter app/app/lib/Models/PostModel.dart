import 'CommentModel.dart';

class Post {
  int id;
  String title;
  String description = '';
  int likes = 0;
  int comments = 0;
  String image;
  String duration;
  List<Comment> commentArr = [];
  List<dynamic> likesArr = [];

  Post({
    this.id,
    this.title,
    this.description,
    this.image,
    this.likes = 0,
    this.comments = 0,
    this.commentArr,
  });
  Post.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['value'];
    likes = json['likeCount'];
    comments = json['commentCount'];
    duration = this.getDuration(json['created_at']);
    this.commentArr =
        (json['commentCount'] > 0) ? setComments(json['commentsInfo']) : [];
  }

  setComments(commentsJson) {
    return (commentsJson as List)
        .map((item) => Comment.fromJson(item))
        .toList();
  }

  getDuration(String date) {
    DateTime dob = DateTime.parse(date);
    Duration dur = DateTime.now().difference(dob);
    num years = (dur.inDays / 365).floor();
    num months = ((dur.inDays % 365) / 12).floor();
    num days = ((dur.inDays % 365) % 12);
    num hours = (dur.inHours % 24);
    num minutes = (dur.inMinutes % 60);

    return (years > 0 ? years.toString() + ' y ' : '') +
        (months > 0 ? months.toString() + ' mon ' : '') +
        (days > 0 ? days.toString() + ' day ' : '') +
        (hours > 0 ? hours.toString() + ' hour ' : '') +
        (minutes > 0 ? minutes.toString() + ' min ' : '');
  }
}
