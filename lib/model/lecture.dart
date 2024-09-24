class Lecture{
  int? id;
  Map<String, String>? data;

  Lecture({required this.id, required this.data});

  factory Lecture.fromJson(Map<String, dynamic> json){
    return Lecture(
      id: json['id'],
      data: json['data']
    );
  }
}