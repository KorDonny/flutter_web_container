import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/lecture_view_model.dart';
import '../model/lecture.dart';

class ScheduleView extends StatefulWidget{
  const ScheduleView({Key? key});

  @override
  State<ScheduleView> createState() => _ScheduleViewState();
}

class _ScheduleViewState extends State<ScheduleView>{
  late List<Lecture> lectureList;
  static const double _paddingValue = 15.0;
  static const String _offset1 = "id";
  static const String _offset2 = "title";

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('시간표'),
      ),
      body: Consumer<LectureViewModel>(
        builder: (context, provider, child){
          lectureList = provider.lectureList;
          return ListView.builder(
            itemCount: lectureList.length,
            itemBuilder: (context, index){
              return Container(
                padding: const EdgeInsets.all(_paddingValue),
                child: Text(
                  "${lectureList[index].data?[_offset1
                  ]}: ${lectureList[index].data?[_offset2]}",
                ),
              );
            },
          );
        },
      ),
    );
  }
}