import 'package:provider/provider.dart';

import 'package:flutter/material.dart';
import '../view_model/lecture_view_model.dart';
import 'view/schedule_view.dart';

void main() => runApp(SylkRoad());

class SylkRoad extends StatelessWidget {
  const SylkRoad({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider<LectureViewModel>(
        create: (context) => LectureViewModel(),
        child: ScheduleView(),
      ),
    );
  }
}