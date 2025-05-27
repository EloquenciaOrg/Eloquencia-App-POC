import 'package:eloquencia/main.dart';
import 'package:flutter/material.dart';

class ArticlePage extends StatefulWidget {
  final int articleId; 
  const ArticlePage({super.key, required this.articleId});

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  final pageID = 'Article';
  late Widget blogArticle = SizedBox();  // Variable pour stocker l'article du blog

  @override
  void initState() {
    super.initState();
    _initBlogArticle();
    // Any initialization code can go here if needed
  }

  Future<void> _initBlogArticle() async {
    blogArticle = await showArticle(context, widget.articleId);
    setState(() {
      blogArticle = blogArticle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarEloquencia(context, pageID, 0),
      endDrawer: endDrawerEloquencia(context, pageID),
      body: ListView(
        children: [
          Center(
            child: SizedBox(
              width: objectWidth(context),
              child: Column(
                children: [
                  SizedBox(height: appBarHeight(context)),
                  blogArticle
                ]
              )
            )
          )
        ]
      )
    );
  }
}