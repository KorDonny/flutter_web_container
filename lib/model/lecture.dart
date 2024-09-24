class Lecture {
  int? userId;
  int? id;
  String? title;

  Lecture({this.userId, this.id, this.title});

  factory Lecture.fromJson(Map<String, dynamic> json) {
    return Lecture(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}