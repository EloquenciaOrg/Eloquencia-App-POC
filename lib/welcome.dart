import 'package:flutter/material.dart';
import 'package:eloquencia/main.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';

class WelcomePage extends StatefulWidget {
  final Map<String, dynamic> userInfo;
  const WelcomePage({super.key, required this.userInfo});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final pageID = 'Bienvenue';
  Widget lms = SizedBox();

  @override
  void initState() {
    _initLMS();
    super.initState();
  }

  Future<void> _initLMS() async {
    lms = await lmsQuote(context);
    setState(() {
      lms = lms;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarEloquencia(context, pageID, white),
      endDrawer: endDrawerEloquencia(context, pageID, widget.userInfo, white),
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