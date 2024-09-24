import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/lecture_view_model.dart';
import '../view/schedule_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider<LectureViewModel>(
        create: (context) => LectureViewModel(),
        child: const LectureView(),
      ),
    );
  }
}