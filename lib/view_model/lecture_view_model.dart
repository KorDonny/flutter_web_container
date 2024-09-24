import 'package:flutter/material.dart';
import '../model/lecture.dart';
import '../repository/lecture_repository.dart';

class LectureViewModel with ChangeNotifier {
  late final LectureRepository _lectureRepository;
  List<Lecture> _lectureList = List.empty(growable: true);
  List<Lecture> get lectureList => _lectureList;

  LectureViewModel() {
    _lectureRepository = LectureRepository();
    _getLectureList();
  }

  Future<void> _getLectureList() async {
    _lectureList = await _lectureRepository.getLectureList();
    notifyListeners();
  }
}