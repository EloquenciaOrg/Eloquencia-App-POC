import 'package:eloquencia/main.dart';
import 'package:flutter/material.dart';

class ChapterPage extends StatefulWidget {
  final int chapterID; 
  final Map<String, dynamic> userInfo;
  const ChapterPage({super.key, required this.chapterID, required this.userInfo});

  @override
  State<ChapterPage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ChapterPage> {
  final pageID = 'Chapitre';
  late Widget chapter = SizedBox();  // Variable pour stocker l'article du blog
  List<dynamic> chapters = [];

  @override
  void initState() {
    super.initState();
    _initChapter();
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

  Future<void> _initChapter() async {
    chapter = await showChapter(context, widget.chapterID);
    if (!mounted) return;
    setState(() {
      chapter = chapter;
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
                  chapter,
                ]
              )
            )
          )
        ]
      )
    );
  }
}