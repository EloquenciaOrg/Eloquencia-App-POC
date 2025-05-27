import 'package:eloquencia/main.dart';
import 'package:flutter/material.dart';

class NoConnectionPage extends StatelessWidget {  // Page de connexion
  const NoConnectionPage({super.key});
  final pageID = 'Connexion ?';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarEloquencia(context, pageID, 0),
      endDrawer: endDrawerEloquencia(context, pageID),
      body: Scaffold()
    );
  }
}