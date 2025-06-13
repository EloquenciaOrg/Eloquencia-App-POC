import 'package:flutter/material.dart';
import 'package:eloquencia/main.dart';

class WelcomePage extends StatefulWidget {
  final Map<String, dynamic> userInfo;
  const WelcomePage({super.key, required this.userInfo});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final pageID = 'Bienvenue';
  Widget lms = SizedBox();
  List<dynamic> chapters = [];

  @override
  void initState() {
    _initLMS();
    super.initState();
  }

  Future<void> _initLMS() async {
    lms = await lmsQuote(context);
    chapters = await lmsChapters(context);
    setState(() {
      lms = lms;
      chapters = chapters;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarEloquencia(context, pageID, white),
      endDrawer: endDrawerLMS(context, pageID, widget.userInfo, white, chapters),
      body: RefreshIndicator(
        color: yellow,
        onRefresh: () async {
          Navigator.pop(context);
          Navigator.push(context, MaterialPageRoute(builder: (context) => WelcomePage(userInfo: widget.userInfo)));
        },
        child: ListView(
          children: [
            Column(
              children: [
                SizedBox(
                  width: objectWidth(context),
                  child: Column(
                    children: [
                      SizedBox(height: appBarHeight(context)),
                      Text('Bienvenue ${widget.userInfo['first_name']} ${widget.userInfo['name']}',
                        style: Theme.of(context).textTheme.titleLarge,
                        textAlign: TextAlign.center
                      ),
                      lms,
                    ],
                  ),
                ),
              ]
            ),
          ]
        ),
      ),
    );
  }
}