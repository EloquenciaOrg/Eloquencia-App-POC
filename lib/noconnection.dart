import 'package:eloquencia/main.dart';
import 'package:flutter/material.dart';

class NoConnectionPage extends StatelessWidget {  // Page de connexion
  final Map<String, dynamic> userInfo;
  const NoConnectionPage({super.key, required this.userInfo});
  final pageID = 'Connexion ?';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarEloquencia(context, pageID, 0),
      endDrawer: endDrawerEloquencia(context, pageID, userInfo),
      body: Scaffold()
    );
  }
}