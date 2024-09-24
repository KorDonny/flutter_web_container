import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/lecture.dart';

class RemoteDataSource {
  Future<List<Lecture>> getLectureList() async{
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/albums')
    );
  return jsonDecode(response.body
  ).map<Lecture>((json) => Lecture.fromJson(json)).toList();
  }
}