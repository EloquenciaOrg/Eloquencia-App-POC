import 'package:eloquencia/main.dart';
import 'package:flutter/material.dart';

class LessonPage extends StatefulWidget {
  final int chapterID;
  final int lessonID; 
  final Map<String, dynamic> userInfo;
  const LessonPage({super.key, required this.chapterID, required this.lessonID, required this.userInfo});

  @override
  State<LessonPage> createState() => _LessonPageState();
}

class _LessonPageState extends State<LessonPage> {
  final pageID = 'Leçon';
  List<dynamic> chapters = [];
  late Widget lesson = SizedBox();

  @override
  void initState() {
    super.initState();
    _initLesson();
    _initLMS();
    // Any initialization code can go here if needed
  }

  Future<void> _initLMS() async {
    chapters = await lmsChapters(context);
    if (!mounted) return;
    setState(() {
      chapters = chapters;
    });
  }

  Future<void> _initLesson() async {
    lesson = await showLesson(context, widget.chapterID, widget.lessonID, widget.userInfo);
    setState(() {
      lesson = lesson;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarEloquencia(context, pageID, white, 0),
      endDrawer: endDrawerLMS(context, pageID, widget.userInfo, white, chapters),
      body: ListView(
        children: [
          Center(
            child: SizedBox(
              width: objectWidth(context),
              child: Column(
                children: [
                  SizedBox(height: appBarHeight(context)),
                  lesson
                ]
              )
            )
          )
        ]
      )
    );
  }
}