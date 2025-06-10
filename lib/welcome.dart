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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarEloquencia(context, pageID, white),
      endDrawer: endDrawerEloquencia(context, pageID, widget.userInfo, white),
    );
  }
}