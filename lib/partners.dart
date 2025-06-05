import 'package:eloquencia/main.dart';
import 'package:flutter/material.dart';

class PartnersPage extends StatefulWidget {
  final Map<String, dynamic> userInfo;
  const PartnersPage({super.key, required this.userInfo});

  @override
  State<PartnersPage> createState() => _PartnersPageState();
}

class _PartnersPageState extends State<PartnersPage> {
  final pageID = 'Partenaires';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarEloquencia(context, pageID, 0),  // Barre de navigation en haut
      endDrawer: endDrawerEloquencia(context, pageID, widget.userInfo),
      body: Center(
        child: ListView(
          children: [
            Text('data'),
            Divider(
              color: yellow
            )
          ],
        )
      )
    );
  }
}