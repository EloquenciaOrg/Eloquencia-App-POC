import 'dart:nativewrappers/_internal/vm/lib/internal_patch.dart';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
// ignore: unused_import
import 'package:flutter/foundation.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';  // Pour vérifier la connexion Internet

void main() {
  runApp(const MyApp());
}

// Variables globales

bool filePicked = false;

// Constantes globales

// Constantes pour les dimensions de l'application
const double appBarHeight = 60;  // Hauteur de la barre de navigation
const double objectWidth = 350;  // Largeur des objets

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
const Color black = Colors.black;  // Couleur noire
const Color white = Color(0xFFF1EBF2);  // Couleur blanche

// Fonctions globales
appBarEloquencia(BuildContext context, pageID) {  // Fonction pour créer la barre de navigation en haut de l'application
  return AppBar(
    backgroundColor: yellow,
    title: logoEloquencia(context, pageID, 22),  // Logo et titre de l'application
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

logoEloquencia(BuildContext context, pageID, double fontSize) {
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
      ],
    ),
    onTap: () {
      if (pageID == 'home') {
      }
      else {
        while (Navigator.canPop(context)) {  // Si je ne suis pas sur la page d'accueil, je retourne à la page d'accueil
          Navigator.pop(context);  // Ferme le menu de navigation
        }
        
      }
    },
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
    /*else if (buttonID == 'Blog') {
      Navigator.pop(context);  // Ferme le menu de navigation
      Navigator.push(context, MaterialPageRoute(builder: (context) => const BlogPage()));
    }
    else if (buttonID == 'Partenaires') {
      Navigator.pop(context);  // Ferme le menu de navigation
      Navigator.push(context, MaterialPageRoute(builder: (context) => const PartnersPage()));
    }*/
    else if (buttonID == 'Réductions') {
      Navigator.pop(context);  // Ferme le menu de navigation
      Navigator.push(context, MaterialPageRoute(builder: (context) => const ReductionPage()));
    }
    /*else if (buttonID == 'Contact') {
      Navigator.pop(context);  // Ferme le menu de navigation
      Navigator.push(context, MaterialPageRoute(builder: (context) => const ContactPage()));
    }
    else if (buttonID == 'À propos') {
      Navigator.pop(context);  // Ferme le menu de navigation
      Navigator.push(context, MaterialPageRoute(builder: (context) => const AboutPage()));
    }*/
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
      ],
    ),
  );
}

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
          )
        ),
      )
    );
  }
}

class HomePage extends StatelessWidget {  // La page d'accueil
  const HomePage({super.key});
  final pageID = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarEloquencia(context, pageID),  // Barre de navigation en haut
      endDrawer: endDrawerEloquencia(context, pageID),  // Menu de navigation à droite
      body:  Center(
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: objectWidth,
                  child: Column(
                    children: [
                      const SizedBox(height: 60),  // Espace entre le haut de la page et le texte
                      SelectableText('Eloquéncia',  // Titre de la page d'accueil
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 30),  // Espace entre le titre et le texte
                      Text('La plateforme de cours en ligne pour apprendre à parler en public.',  // Slogan de la page d'accueil
                        style: Theme.of(context).textTheme.headlineMedium,
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(height: 30),  // Espace entre le slogan et les boutons d'adhésion et de connexion
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(  // Bouton d'adhésion
                            style: ButtonStyle(
                              backgroundColor: const WidgetStatePropertyAll<Color>(yellow),
                              shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              padding: const WidgetStatePropertyAll<EdgeInsetsGeometry>(
                                EdgeInsets.symmetric(horizontal: 11),
                              ),
                              minimumSize: const WidgetStatePropertyAll<Size>(
                                Size(buttonwidth, buttonheight),
                              ),
                            ),

                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const HelloAssoPage()),
                              );
                            },
                            child:  Text('Adhérer',
                              style: Theme.of(context).textTheme.bodyMedium
                            ),
                          ),
                          const SizedBox(width: 10),  // Espace horizontal entre les deux boutons
                          ElevatedButton(  // Bouton de connexion
                            style: ButtonStyle(
                              backgroundColor: const WidgetStatePropertyAll<Color>(yellow),
                              shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              padding: const WidgetStatePropertyAll<EdgeInsetsGeometry>(
                                EdgeInsets.symmetric(horizontal: 11),
                              ),
                              minimumSize: const WidgetStatePropertyAll<Size>(
                                Size(buttonwidth, buttonheight),
                              ),
                            ),
                            
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const LoginPage()),
                              );
                            },
                            child: Text('Se Connecter',
                              style: Theme.of(context).textTheme.bodyMedium
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ),
                const SizedBox(height: 30),  // Espace entre le bouton de connexion et le texte de réduction
                SizedBox(
                  width: objectWidth,
                  child: Column(
                    children: [
                      Text('Étudiant·e ou mineur·e ? Vous pouvez faire une demande de réduction ici.',
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(height: 20),  // Espace entre le texte et le bouton de demande de réduction
                      ElevatedButton(  // Bouton de demande de réduction
                        // TODO : faire une page de demande de réduction
                        style: ButtonStyle(
                          backgroundColor: const WidgetStatePropertyAll<Color>(yellow),
                          shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          padding: const WidgetStatePropertyAll<EdgeInsetsGeometry>(
                            EdgeInsets.symmetric(horizontal: 11),
                          ),
                          minimumSize: const WidgetStatePropertyAll<Size>(
                            Size(largebuttonwidth, buttonheight),
                          ),
                        ),
                        
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const ReductionPage()));
                        },
                        child: Text('Demander une réduction',
                          style: Theme.of(context).textTheme.bodyMedium
                        ),
                      ),
                    ]
                  )
                ),
                const SizedBox(height: 10),  // Espace entre les boutons d'adhésion et de connexion et le carrousel
                CarouselSlider(  // Carrousel d'images
                  items: [
                    Image.asset('assets/images/carousel.jpg',
                      width: 400,
                    ),
                    Image.asset('assets/images/carousel1.jpg',
                      width: 400,
                    )
                  ],
                  options: CarouselOptions(
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 7),
                    enlargeCenterPage: true,
                    enlargeFactor: 2
                  )
                ),
                SizedBox(
                  width: objectWidth,
                  child: Column(
                    children: [
                      const SizedBox(height: 30),
                      Text('Articles à la une',
                        style: Theme.of(context).textTheme.titleMedium,
                        textAlign: TextAlign.center,
                      ),
                    ]
                  )
                ),
              ],
            ),
          ]
        )
      ),
    );
  }
}

class JoinPage extends StatelessWidget {
  const JoinPage({super.key});
  final pageID = 'Rejoindre';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarEloquencia(context, pageID),
      endDrawer: endDrawerEloquencia(context, pageID),
      body: ListView(
        children: [
          Center(
            child: InteractiveViewer(
              panEnabled: false,
              child: SizedBox(
                width: objectWidth,
                child: Column(
                  children: [
                    const SizedBox(height: appBarHeight),
                    Text('Pourquoi nous rejoindre ?',
                      style: Theme.of(context).textTheme.titleMedium,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    Text('Découvrez les valeurs, les engagements et les avantages de l\'association Eloquéncia.',
                      style: Theme.of(context).textTheme.headlineSmall,
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(height: 20),
                    const Divider(
                      color: black,
                      thickness: 3,
                      height: 0,
                    ),
                    const SizedBox(height: 20),
                    Text('Une équipe de bénévoles passionnés',
                      style: Theme.of(context).textTheme.titleSmall,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    Image.asset('assets/images/recrutement_1.png',
                    height: objectWidth,
                    ),
                    const SizedBox(height: 20),
                    Text('Eloquéncia, fondée par Marouan JLASSI, un lycéen passionné, est bien plus qu\'une simple association. C\'est un projet dynamique et social,'
                      ' ouvert à toutes les personnes motivées, quels que soient leurs parcours. En nous rejoignant, vous aurez l\'opportunité d\'enrichir vos compétences dans des domaines variés :'
                      ' maîtrise de la prise de parole en public, développement de vos aptitudes sociales, approfondissement de vos connaissances dans le domaine qui vous passionne, et bien plus encore.'
                      ' Vous participerez à un projet ambitieux, porteur de sens et rempli de défis ! Venez vivre une aventure humaine unique,'
                      ' tissez des liens forts et devenez un acteur actif de la vie associative !',
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.justify,
                    ),
                  ]
                ),
              ),
            ),
          ),
        ]
      ),
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
class HelloAssoPage extends StatefulWidget {  // Page de HelloAsso
  const HelloAssoPage({super.key});

  @override
  State<HelloAssoPage> createState() => _HelloAssoPageState();
}

class _HelloAssoPageState extends State<HelloAssoPage> {

  late WebViewController controller;  // Contrôleur de la WebView
  var loadingPercentage = 0;  // Pourcentage de chargement de la page
  final pageID = 'HelloAsso';

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (url) {
          setState(() {
            loadingPercentage = 0;  // Réinitialiser le pourcentage de chargement
          });
        },
        onProgress: (progress) {
          setState(() {
            loadingPercentage = progress;  // Mettre à jour le pourcentage de chargement
          });
        },
        onPageFinished: (url) {
          setState(() {
            loadingPercentage = 100;  // Charger la page à 100%
          });
        },
      ))
      ..setJavaScriptMode(JavaScriptMode.unrestricted)  // Autoriser JavaScript
      ..loadRequest(Uri.parse(helloassoUrl));  // Charger l'URL de HelloAsso

      /*if (connectionStatus == true) {
        controller.loadRequest(Uri.parse(helloassoUrl));  // Charger l'URL de HelloAsso
      } else if (connectionStatus == false) {
      }*/
      
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarEloquencia(context, pageID),
      endDrawer: endDrawerEloquencia(context, pageID),
      body: Stack(
        children: [
          WebViewWidget(
            controller: controller,  // Afficher la WebView avec le contrôleur
          ),
          loadingPercentage < 100  // Afficher la barre de chargement si la page n'est pas complètement chargée
            ? LinearProgressIndicator(
                value: loadingPercentage / 100,
                backgroundColor: null,
                color: black,
              )
            : Container(),  // Sinon, afficher un conteneur vide
        ]
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isChecked = false;  // Statut de la case à cocher
  final pageID = "Connexion";

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<WidgetState> states) {
      const Set<WidgetState> interactiveStates = <WidgetState>{
        WidgetState.pressed,
        WidgetState.hovered,
        WidgetState.focused
      };
      if (states.any(interactiveStates.contains)) {
        return yellow2;  // Couleur de la case à cocher si elle est pressée, survolée ou focalisée
      }
      else if (isChecked == true) {
        return yellow;  // Couleur de la case à cocher si elle est cochée
      }
      return white;
    }
    return Scaffold(
      appBar: appBarEloquencia(context, pageID),
      endDrawer: endDrawerEloquencia(context, pageID),
      body: Center(
        child: ListView(
          children: [
            SizedBox(
              width: objectWidth,
              child: Column(
                children: [
                  const SizedBox(height: 60),  // Espace entre le haut de la page et le contenu
                  ClipRRect(
                    child: Column(
                      children: [
                        Container(
                          width: objectWidth,
                          decoration: BoxDecoration(
                            color: white,
                            //border: Border.all(color: black, width: 3),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: Column(
                                  children: [
                                    Container(
                                      width: objectWidth,
                                      color: yellow,
                                      child: Column(
                                        children: [
                                          const SizedBox(height: 20),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text('Connexion',
                                              style: Theme.of(context).textTheme.titleLarge,
                                          ),
                                            ]
                                          ),
                                          const SizedBox(height: 20),
                                        ]
                                      )
                                    ),
                                    const Divider(
                                      color: black,
                                      thickness: 3,
                                      height: 0,
                                    ),
                                    Container(
                                      decoration: const BoxDecoration(
                                        color: white,
                                      ),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            width: objectWidth - 50,
                                            child: Column(
                                              children: [
                                                const SizedBox(height: 30),
                                                TextField(  // Champ de texte pour la connexion
                                                  onTapOutside: (event) {
                                                    FocusScope.of(context).unfocus();
                                                  },
                                                  cursorColor: black,
                                                  decoration: InputDecoration(
                                                    labelText: 'Adresse e-mail',
                                                    labelStyle: Theme.of(context).textTheme.bodyMedium,
                                                    enabledBorder: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(10),
                                                      borderSide: const BorderSide(color: black, width: 1),
                                                    ),
                                                    focusedBorder: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(10),
                                                      borderSide: const BorderSide(color: yellow2, width: 2),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(height: 30),
                                                TextField(  // Champ de texte pour la connexion
                                                  onTapOutside: (event) {
                                                    FocusScope.of(context).unfocus();
                                                  },
                                                  obscureText: true,  // Masquer le mot de passe
                                                  cursorColor: black,
                                                  decoration: InputDecoration(
                                                    labelText: 'Mot de passe',
                                                    labelStyle: Theme.of(context).textTheme.bodyMedium,
                                                    //helperText: '*Minimum 8 caractères dont\n1 majuscule, 1 chiffre et\n1 caractère spécial',  // TODO Déplacer dans le page de modification de mot de passe
                                                    //helperStyle: const TextStyle(color: black),
                                                    enabledBorder: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(10),
                                                      borderSide: const BorderSide(color: black, width: 1),
                                                    ),
                                                    focusedBorder: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(10),
                                                      borderSide: const BorderSide(color: yellow2, width: 2),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(height: 15),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                    Checkbox(
                                                      checkColor: white,
                                                      fillColor: WidgetStateProperty.resolveWith(getColor),
                                                      value: isChecked,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          isChecked = value!;  // Mettre à jour le statut de la case à cocher
                                                        });
                                                      },
                                                    ),
                                                    GestureDetector(
                                                      child: Text('Se souvenir de moi',
                                                        style: Theme.of(context).textTheme.bodyMedium,
                                                      ),
                                                      onTap: () {
                                                        setState(() {
                                                          isChecked = !isChecked;  // Inverser le statut de la case à cocher
                                                        });
                                                      },
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 15),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: objectWidth,
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    ElevatedButton(  // Bouton de connexion
                                                      style: ButtonStyle(
                                                        backgroundColor: const WidgetStatePropertyAll<Color>(yellow),
                                                        shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
                                                          RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(5),
                                                          ),
                                                        ),
                                                        padding: const WidgetStatePropertyAll<EdgeInsetsGeometry>(
                                                          EdgeInsets.symmetric(horizontal: 11),
                                                        ),
                                                        minimumSize: const WidgetStatePropertyAll<Size>(
                                                          Size(buttonwidth - 40, buttonheight),
                                                        ),
                                                      ),
                                                      
                                                      onPressed: () {
                                                        // TODO : faire la connexion
                                                      },
                                                      child: Text('Connexion',
                                                        style: Theme.of(context).textTheme.bodyMedium
                                                      ),
                                                    ),
                                                    const SizedBox(width: 10),  // Espace horizontal entre les deux boutons
                                                    ElevatedButton(  // Bouton de réinitialisation du mot de passe
                                                      style: ButtonStyle(
                                                        backgroundColor: const WidgetStatePropertyAll<Color>(white),
                                                        shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
                                                          RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(5),
                                                            side: const BorderSide(color: black, width: 1),
                                                          )
                                                        ),
                                                        padding: const WidgetStatePropertyAll<EdgeInsetsGeometry>(
                                                          EdgeInsets.symmetric(horizontal: 11),
                                                        ),
                                                        minimumSize: const WidgetStatePropertyAll<Size>(
                                                          Size(buttonwidth + 40, buttonheight),
                                                        ),
                                                      ),
                                                      
                                                      onPressed: () {
                                                        
                                                      },
                                                      child: Text('Mot de passe oublié',
                                                        style: Theme.of(context).textTheme.bodyMedium
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 20),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ),
                            ]
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ]
        ),
      ),
    );
  }
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

class ReductionPage extends StatelessWidget {
  const ReductionPage({super.key});
  final pageID = 'Réductions';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarEloquencia(context, pageID),  // Barre de navigation en haut
      endDrawer: endDrawerEloquencia(context, pageID),
      body: Center(
        child: ListView(
          children: [
            SizedBox(
              width: objectWidth,
              child: Column(
                children: [
                  const SizedBox(height: 60),  // Espace entre le haut de la page et le contenu
                  ClipRRect(
                    child: Column(
                      children: [
                        Container(
                          width: objectWidth,
                          decoration: BoxDecoration(
                            color: white,
                            //border: Border.all(color: black, width: 3),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: Column(
                                  children: [
                                    Container(
                                      width: objectWidth,
                                      color: yellow,
                                      child: Column(
                                        children: [
                                          const SizedBox(height: 20),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text('Réduction',
                                                style: Theme.of(context).textTheme.titleLarge,
                                              ),
                                            ]
                                          ),
                                          const SizedBox(height: 20),
                                        ]
                                      )
                                    ),
                                    const Divider(
                                      color: black,
                                      thickness: 3,
                                      height: 0,
                                    ),
                                    Container(
                                      decoration: const BoxDecoration(
                                        color: white,
                                      ),
                                      child: SizedBox(
                                        width: objectWidth - 50,
                                        child: Column(
                                          children: [
                                            const SizedBox(height: 30),
                                            TextField(  // Champ de texte pour la connexion
                                              onTapOutside: (event) {
                                                FocusScope.of(context).unfocus();
                                              },
                                              cursorColor: black,
                                              decoration: InputDecoration(
                                                labelText: 'Nom complet',
                                                labelStyle: Theme.of(context).textTheme.bodyMedium,
                                                enabledBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(10),
                                                  borderSide: const BorderSide(color: black, width: 1),
                                                ),
                                                focusedBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(10),
                                                  borderSide: const BorderSide(color: yellow2, width: 2),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 30),
                                            TextField(  // Champ de texte pour la connexion
                                              onTapOutside: (event) {
                                                FocusScope.of(context).unfocus();
                                              },
                                              cursorColor: black,
                                              decoration: InputDecoration(
                                                labelText: 'Adresse e-mail',
                                                labelStyle: Theme.of(context).textTheme.bodyMedium,
                                                //helperText: '*Minimum 8 caractères dont\n1 majuscule, 1 chiffre et\n1 caractère spécial',  // TODO Déplacer dans le page de modification de mot de passe
                                                //helperStyle: const TextStyle(color: black),
                                                enabledBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(10),
                                                  borderSide: const BorderSide(color: black, width: 1),
                                                ),
                                                focusedBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(10),
                                                  borderSide: const BorderSide(color: yellow2, width: 2),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 20),
                                            Text('Justificatif d\'identité/Certificat de scolarité',
                                              style: Theme.of(context).textTheme.bodySmall,
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                border: Border.all(color: black, width: 1),
                                                borderRadius: BorderRadius.circular(10),
                                              ),
                                              height: 55,
                                              child: Row(
                                                children: [
                                                  ElevatedButton(
                                                    style: ButtonStyle(
                                                      backgroundColor: const WidgetStatePropertyAll<Color>(yellow),
                                                      shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
                                                        RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(10),
                                                        ),
                                                      ),
                                                      padding: const WidgetStatePropertyAll<EdgeInsetsGeometry>(
                                                        EdgeInsets.symmetric(horizontal: 11),
                                                      ),
                                                      minimumSize: const WidgetStatePropertyAll(
                                                        Size(buttonwidth - 40, 55)),
                                                    ),
                                                    
                                                    onPressed: () => pickFile(),
                                                    child: Text('Parcourir...',  // TODO filePicked ? const Text('Choisir un fichier') : Text(fileName)),
                                                      style: Theme.of(context).textTheme.bodyMedium)
                                                  ),
                                                  const SizedBox(width: 7),  // Espace horizontal entre le bouton et le texte
                                                  GestureDetector(
                                                    child: Text('5Mo max (PNG, JPG)',
                                                      style: Theme.of(context).textTheme.bodyMedium,
                                                    ),
                                                    onTap: () {
                                                      pickFile();  // Ouvrir le sélecteur de fichiers
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(height: 20),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                ElevatedButton(  // Bouton de connexion
                                                  style: ButtonStyle(
                                                    backgroundColor: const WidgetStatePropertyAll<Color>(yellow),
                                                    shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
                                                      RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(5),
                                                      ),
                                                    ),
                                                    padding: const WidgetStatePropertyAll<EdgeInsetsGeometry>(
                                                      EdgeInsets.symmetric(horizontal: 11),
                                                    ),
                                                    minimumSize: const WidgetStatePropertyAll<Size>(
                                                      Size(buttonwidth - 40, buttonheight),
                                                    ),
                                                    maximumSize: const WidgetStatePropertyAll<Size>(
                                                      Size(buttonwidth - 40, buttonheight),
                                                    ),
                                                  ),
                                                  
                                                  onPressed: () {
                                                    // TODO : faire la connexion
                                                  },
                                                  child: Text('Connexion',
                                                    style: Theme.of(context).textTheme.bodyMedium
                                                  ),
                                                ),
                                                const SizedBox(width: 10),  // Espace horizontal entre les deux boutons
                                                ElevatedButton(  // Bouton de réinitialisation du mot de passe
                                                  style: ButtonStyle(
                                                    backgroundColor: const WidgetStatePropertyAll<Color>(white),
                                                    shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
                                                      RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(5),
                                                        side: const BorderSide(color: black, width: 1),
                                                      )
                                                    ),
                                                    padding: const WidgetStatePropertyAll<EdgeInsetsGeometry>(
                                                      EdgeInsets.symmetric(horizontal: 6),
                                                    ),
                                                    minimumSize: const WidgetStatePropertyAll<Size>(
                                                      Size(buttonwidth + 30, buttonheight),
                                                    ),
                                                    maximumSize: const WidgetStatePropertyAll<Size>(
                                                      Size(buttonwidth + 30, buttonheight),
                                                    ),
                                                  ),
                                                  
                                                  onPressed: () {
                                                    
                                                  },
                                                  child: Text('Mot de passe oublié',
                                                    style: Theme.of(context).textTheme.bodyMedium
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 20),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ),
                            ]
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ]
        ),
      ),
    );
  }
}