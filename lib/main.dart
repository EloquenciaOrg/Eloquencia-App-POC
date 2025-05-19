//import 'dart:nativewrappers/_internal/vm/lib/internal_patch.dart';
import 'dart:convert';
import 'dart:io';
import 'package:eloquencia/about.dart';
import 'package:eloquencia/blog.dart';
import 'package:eloquencia/contact.dart';
import 'package:eloquencia/home.dart';
import 'package:eloquencia/join.dart';
import 'package:eloquencia/login.dart';
import 'package:eloquencia/partners.dart';
import 'package:eloquencia/reduction.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter/foundation.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

void httpPackageInfo() async {
  final httpPackageUrl = Uri.http('10.200.0.5', '/api/login');
  final httpPackageInfo = await http.read(httpPackageUrl);
  final httpPackageJson = json.decode(httpPackageInfo) as Map<String, dynamic>;
  print(httpPackageJson);
}

void httpPackageResponse() async {
  final httpPackageResponse = await http.get(
    Uri.http('10.200.0.5', '/api/login'),
    headers: {'User-Agent': '<product name>/<product-version>'},
  );
  if (httpPackageResponse.statusCode != 200) {
    print('Failed to retrieve the http package!');
    return;
  }
  print(httpPackageResponse.body);
}

// Variables globales

bool filePicked = false;

// Constantes globales

// Constantes pour la taille des boutons
const double largebuttonwidth = 250;  // Hauteur des gros boutons
const double buttonwidth = 150;  // Hauteur des boutons normaux
const double buttonheight = 40;  // Largeur des boutons normaux

// Constantes pour les images
const String logo = 'assets/images/eloquencia_round.png';

// Constantes pour la connexion Internet
const String helloassoUrl = 'https://www.helloasso.com/associations/eloquencia/adhesions/adhesion';
bool connectionStatus = false;  // Statut de la connexion à Internet

// Constantes pour les couleurs
const Color yellow = Color(0xFFFFC107);  // Couleur principale de l'application
const Color yellow2 = Color(0xFFFFCA2C);  // Couleur secondaire de l'application
const Color yellow3 = Color(0xFFE6AE07);  // Couleur tertiaire de l'application
const Color black = Colors.black;  // Couleur noire
const Color white = Color(0xFFF1EBF2);  // Couleur blanche

// Fonctions globales

// Fonctions pour les dimensions de l'application
getWidth(context, [modifier = 1]) {
  double width = MediaQuery.sizeOf(context).width;
  if (kDebugMode) {
    print(width);
  }
  if (modifier != 0) {
    return width/modifier;
  } else {
    if (kDebugMode) {
      print('Division par 0');
    }
  }
}

getHeight(context, [modifier = 1]) {
  double height = MediaQuery.sizeOf(context).height;
  if (modifier != 0) {
    return height/modifier;
  } else {
    if (kDebugMode) {
      print('Division par 0');
    }
  }
}

appBarHeight(context) {  // Hauteur de la barre de navigation
  return getHeight(context, 14.8572);
}

objectWidth(context) {  // Largeur des objets
  return getWidth(context, 1.17552);
}

largeHeight(context) {
  return getHeight(context, 29.7143);
}

mediumHeight(context) {
  return getHeight(context, 44.5715);
}

smallHeight(context) {
  return getHeight(context, 89.1429);
}

largeWidth(context) {
  return getWidth(context, 1.17552);
}

mediumWidth(context) {
  return getWidth(context, 1.17552);
}

smallWidth(context) {
  return getWidth(context, 1.17552);
}

// Fonctions pour les éléments de l'application

appBarEloquencia(BuildContext context, pageID) {  // Fonction pour créer la barre de navigation en haut de l'application
  return AppBar(
    backgroundColor: yellow,
    title: logoEloquencia(context, pageID, 22, ' - $pageID'),  // Logo et titre de l'application
  );
}

drawerHeaderEloquencia(BuildContext context, pageID) {  // Fonction pour créer l'en-tête du menu de navigation
  return DrawerHeader(  // En-tête du menu de navigation
    decoration: const BoxDecoration(color: yellow), // quand bouton cliqué : 0xFFFFCA2C
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        logoEloquencia(context, pageID, 30)
      ],
    ),
  );
}

logoEloquencia(BuildContext context, pageID, double fontSize, [String suffix = '']) {
  return GestureDetector(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(logo,
          width: fontSize * 2,
        ),
        const SizedBox(width: 10),
        Text('Eloquéncia',
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold
          ),
        ),
        Text(suffix,
          style: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: fontSize*0.85
          ),
        )
      ],
    ),
    onTap: () {
      if (pageID == 'Accueil') {
      }
      else {
        while (Navigator.canPop(context)) {  // Si je ne suis pas sur la page d'accueil, je retourne à la page d'accueil
          Navigator.pop(context);  // Ferme le menu de navigation
        }
      }
    },
  );
}

copyrightEloquencia(BuildContext context) {  // Fonction pour créer le copyright
  return SizedBox(
    child: Text('©Eloquéncia 2024-2025 |\nFait avec 💙 et hébergé à Marseille',
      style: Theme.of(context).textTheme.labelMedium,
      textAlign: TextAlign.center,
    ),
  );
}

drawerBehavior(context, pageID, buttonID) {
  /*Est-ce que le nom du bouton est le même que l'ID de la page sur laquelle je suis
  si oui, Navigator.pop(context)
  si non, Navigator.push(context, MaterialPageRoute(builder: (context) => const lapage)*/
  if (pageID == buttonID) {
    Navigator.pop(context);
  }
  else {
    if (buttonID == 'Rejoindre') {
      Navigator.pop(context);  // Ferme le menu de navigation
      Navigator.push(context, MaterialPageRoute(builder: (context) => const JoinPage()));
    }
    else if (buttonID == 'Blog') {
      Navigator.pop(context);  // Ferme le menu de navigation
      Navigator.push(context, MaterialPageRoute(builder: (context) => const BlogPage()));
    }
    else if (buttonID == 'Partenaires') {
      Navigator.pop(context);  // Ferme le menu de navigation
      Navigator.push(context, MaterialPageRoute(builder: (context) => const PartnersPage()));
    }
    else if (buttonID == 'Réductions') {
      Navigator.pop(context);  // Ferme le menu de navigation
      Navigator.push(context, MaterialPageRoute(builder: (context) => const ReductionPage()));
    }
    else if (buttonID == 'Contact') {
      Navigator.pop(context);  // Ferme le menu de navigation
      Navigator.push(context, MaterialPageRoute(builder: (context) => const ContactPage()));
    }
    else if (buttonID == 'À propos') {
      Navigator.pop(context);  // Ferme le menu de navigation
      Navigator.push(context, MaterialPageRoute(builder: (context) => const AboutPage()));
    }
    else if (buttonID == 'Connexion') {
      Navigator.pop(context);  // Ferme le menu de navigation
      Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
    }
  }
}

endDrawerEloquencia(BuildContext context, pageID) {  // Fonction pour créer le menu de navigation à droite
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        drawerHeaderEloquencia(context, pageID),  // En-tête du menu de navigation
        ListTile(
          title: Text('Rejoindre',
            style: Theme.of(context).textTheme.bodyMedium),
          onTap: () {
            drawerBehavior(context, pageID, 'Rejoindre');
          },
        ),
        ListTile(
          title: Text('Blog',
            style: Theme.of(context).textTheme.bodyMedium),
          onTap: () {
            drawerBehavior(context, pageID, 'Blog');
          },
        ),
        ListTile(
          title: Text('Partenaires',
            style: Theme.of(context).textTheme.bodyMedium),
          onTap: () {
            drawerBehavior(context, pageID, 'Partenaires');
          },
        ),
        ListTile(
          title: Text('Réductions',
            style: Theme.of(context).textTheme.bodyMedium),
          onTap: () {
            drawerBehavior(context, pageID, 'Réductions');
          },
        ),
        ListTile(
          title: Text('Contact',
            style: Theme.of(context).textTheme.bodyMedium),
          onTap: () {
            drawerBehavior(context, pageID, 'Contact');
          },
        ),
        ListTile(
          title: Text('À propos',
            style: Theme.of(context).textTheme.bodyMedium),
          onTap: () {
            drawerBehavior(context, pageID, 'À propos');
          },
        ),
        ListTile(
          title: Text('Connexion',  // TODO changer position du bouton juste en dessous du logo et l'afficher seulement si pas connecté
            style: Theme.of(context).textTheme.bodyMedium), 
          onTap: () {
            drawerBehavior(context, pageID, 'Connexion');
          },
        ),
        copyrightEloquencia(context)
      ],
    ),
  );
}

Future<String> pickFile() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles();
  if (result != null) {
    File file = File(result.files.single.path!);
    String fileName = file.toString().split(r'/').last;  // Récupérer le nom du fichier
    filePicked = true;
    return fileName;  // Retourner le nom du fichier
  } else {
    // User canceled the picker
    filePicked = false;  // Aucune sélection de fichier
    return '';
  }
}
//TODO
/*
pickFileText() {
  if (file != null) {
    return Text(fileName);
  } else {
    return const Text('Choisir un fichier');
  }
} */

class MyApp extends StatelessWidget {  // L'application
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
      theme: ThemeData(
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 45
          ),
          titleMedium: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30
          ),
          titleSmall: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25
          ),
          headlineMedium: TextStyle(
            fontStyle: FontStyle.italic,
            fontSize: 22
          ),
          headlineSmall: TextStyle(
            fontStyle: FontStyle.italic,
            fontSize: 20
          ),
          bodyMedium: TextStyle(
            fontSize: 18
          ),
          bodySmall: TextStyle(
            fontSize: 14
          ),
          labelMedium: TextStyle(
            fontSize: 12
          ),
        ),
      )
    );
  }
}

/*
Future check() async {  TODO : custom "connexion perdue" page
  try {
    final result = await InternetAddress.lookup(helloassoUrl);  // Vérifier la connexion à Internet
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      connectionStatus = true;
      print("connected $connectionStatus");
    }
  } on SocketException catch (_) {
    connectionStatus = false;
    print("not connected $connectionStatus");
  }
}
*/