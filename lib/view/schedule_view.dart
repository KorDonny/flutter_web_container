import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "../view_model/lecture_view_model.dart";

import "../model/lecture.dart";

class LectureView extends StatefulWidget {
  const LectureView({super.key});

  @override
  State<LectureView> createState() => _LectureViewState();
}

class _LectureViewState extends State<LectureView> {
  late List<Lecture> LectureList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("시간표"),
      ),
      body: Consumer<LectureViewModel>(
        builder: (context, provider, child) {
          LectureList = provider.lectureList;
          return ListView.builder(
            itemCount: LectureList.length,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.all(15),
                child: Text(
                  "${LectureList[index].id}: ${LectureList[index].title}",
                ),
              );
            },
          );
        },
      ),
    );
  }
}