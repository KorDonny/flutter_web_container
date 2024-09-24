import 'package:flutter/material.dart';
import '../model/lecture.dart';
import '../repository/lecture_repository.dart';

class LectureViewModel with ChangeNotifier{
  late final LectureRepository _repository;
  List<Lecture> _lectureList = List.empty(growable: true);

  List<Lecture> get lectureList => _lectureList;

  ListViewModel(){
    _repository = LectureRepository();
    _getLectureList();
  }

  Future<void> _getLectureList() async{
    _lectureList = await _repository.getLectureList();
    notifyListeners();
  }
}