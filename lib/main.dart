//import 'dart:nativewrappers/_internal/vm/lib/internal_patch.dart';
import 'dart:io';
import 'package:eloquencia/about.dart';
import 'package:eloquencia/blog.dart';
import 'package:eloquencia/contact.dart';
import 'package:eloquencia/home.dart';
import 'package:eloquencia/join.dart';
import 'package:eloquencia/login.dart';
import 'package:eloquencia/partners.dart';
import 'package:eloquencia/reduction.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

// Variables globales



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
const Color yellow3 = Color(0xFFD9A407);  // Couleur tertiaire de l'application
const Color black = Colors.black;  // Couleur noire
const Color white = Color(0xFFF1EBF2);  // Couleur blanche

// Fonctions globales

// Fonctions pour les dimensions de l'application
getWidth(context, [double width = 0]) {
  if (width != 0) {
    double modifier = 411.42857142857144/width;
    double displayWidth = MediaQuery.sizeOf(context).width;
    if (kDebugMode) {
      print(displayWidth);
    }
    return displayWidth/modifier;
  } else {
    return 0.0;
  }
}

getHeight(context, [double height = 0]) {
  if (height != 0) {
    double modifier = 891.4285714285714/height;
    double displayHeight = MediaQuery.sizeOf(context).height;
    if (kDebugMode) {
      print(displayHeight);
    }
    return displayHeight/modifier;
  } else {
    return 0.0;
  }
}

appBarHeight(context) {  // Hauteur de la barre de navigation
  return getHeight(context, 60);
}

objectWidth(context) {  // Largeur des objets
  return getWidth(context, 350);
}

largeHeight(context) {
  return getHeight(context, 30);
}

mediumHeight(context) {
  return getHeight(context, 20);
}

smallHeight(context) {
  return getHeight(context, 10);
}

largeWidth(context) {
  return getWidth(context, 350);
}

mediumWidth(context) {
  return getWidth(context, 350);
}

smallWidth(context) {
  return getWidth(context, 350);
}

// Fonctions pour les éléments de l'application

appBarEloquencia(BuildContext context, pageID, [double space = 16.0]) {  // Fonction pour créer la barre de navigation en haut de l'application
  return AppBar(
    backgroundColor: yellow,
    title: logoEloquencia(context, pageID, 22, ' - $pageID'),  // Logo et titre de l'application
    titleSpacing: getWidth(context, space),  // Espace entre le logo et le bord gauche de l'écran
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

Future<bool> checkConnection() async {  //TODO : custom "connexion perdue" page
  try {
    final result = await InternetAddress.lookup(helloassoUrl);  // Vérifier la connexion à Internet
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  } on SocketException catch (_) {
    return false;
  }
}

void httpPackageResponse() async {
  final httpPackageResponse = await http.post(
    Uri.parse('http://10.200.0.5/api/login'),
    body: {
      'username': 'toto',
      'password': 'toto',
    }
  );
  if (httpPackageResponse.statusCode != 200) {
    print('Failed to retrieve the http package!');
    return;
  }
  print(httpPackageResponse.body);
}

Future<String> pickFile() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles();
  if (result != null) {
    File file = File(result.files.single.path!);
    String fileName = file.toString().split(r'/',).last;  // Récupérer le nom du fichier
    print(file);
    return fileName.split('\'').first;
  } else {
    // User canceled the picker
    return '5Mo max (PNG, JPG)';
  }
}

class MyApp extends StatefulWidget {  // L'application
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    // Hides the bottom navigation bar and the status bar
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  }

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