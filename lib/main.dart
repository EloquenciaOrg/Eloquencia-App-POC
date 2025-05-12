//import 'dart:nativewrappers/_internal/vm/lib/internal_patch.dart';

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
    else if (buttonID == 'Contact') {
      Navigator.pop(context);  // Ferme le menu de navigation
      Navigator.push(context, MaterialPageRoute(builder: (context) => const ContactPage()));
    }
    /*
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
                  width: objectWidth(context),
                  child: Column(
                    children: [
                      SizedBox(height: appBarHeight(context)),  // Espace entre le haut de la page et le texte
                      SelectableText('Eloquéncia',  // Titre de la page d'accueil
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      SizedBox(height: largeHeight(context)),  // Espace entre le titre et le texte
                      Text('La plateforme de cours en ligne pour apprendre à parler en public.',  // Slogan de la page d'accueil
                        style: Theme.of(context).textTheme.headlineMedium,
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(height: largeHeight(context)),  // Espace entre le slogan et les boutons d'adhésion et de connexion
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
                SizedBox(height: largeHeight(context)),  // Espace entre le bouton de connexion et le texte de réduction
                SizedBox(
                  width: objectWidth(context),
                  child: Column(
                    children: [
                      Text('Étudiant·e ou mineur·e ? Vous pouvez faire une demande de réduction ici.',
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(height: mediumHeight(context)),  // Espace entre le texte et le bouton de demande de réduction
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
                SizedBox(height: smallHeight(context)),  // Espace entre les boutons d'adhésion et de connexion et le carrousel
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
                    enlargeFactor: 2,
                    height: 231
                  )
                ),
                SizedBox(
                  width: objectWidth(context),
                  child: Column(
                    children: [
                      SizedBox(height: largeHeight(context)),
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
            child: SizedBox(
            width: objectWidth(context),
            child: Column(
              children: [
                SizedBox(height: appBarHeight(context)),
                Text('Pourquoi nous rejoindre ?',
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: mediumHeight(context)),
                Text('Découvrez les valeurs, les engagements et les avantages de l\'association Eloquéncia.',
                  style: Theme.of(context).textTheme.headlineSmall,
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: mediumHeight(context)),
                const Divider(
                  color: black,
                  thickness: 3,
                  height: 0,
                ),
                SizedBox(height: mediumHeight(context)),
                Text('Une équipe de bénévoles passionnés',
                  style: Theme.of(context).textTheme.titleSmall,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: mediumHeight(context)),
                Image.asset('assets/images/recrutement_1.png',
                height: objectWidth(context) - 50,
                ),
                SizedBox(height: largeHeight(context)),
                RichText(
                  textAlign: TextAlign.justify,
                  text: TextSpan(
                    style: Theme.of(context).textTheme.bodyMedium,
                    children: const <TextSpan>[
                      TextSpan(
                        text: 'Eloquéncia',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: yellow3
                        )
                      ),
                      TextSpan(
                        text: ', fondée par Marouan JLASSI, un lycéen passionné, est bien plus qu\'une simple association. C\'est un '
                      ),
                      TextSpan(
                        text: 'projet dynamique',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: yellow3
                        )
                      ),
                      TextSpan(
                        text: ' et '
                      ),
                      TextSpan(
                        text: 'social',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: yellow3
                        )
                      ),
                      TextSpan(
                        text: ' ouvert à toutes les personnes motivées, quels que soient leurs parcours. En nous rejoignant, vous aurez l\'opportunité d\''
                      ),
                      TextSpan(
                        text: 'enrichir vos compétences',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: yellow3
                        )
                      ),
                      TextSpan(
                        text: ' dans des domaines variés : '
                      ),
                      TextSpan(
                        text: 'maîtrise',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: yellow3
                        )
                      ),
                      TextSpan(
                        text: ' de la '
                      ),
                      TextSpan(
                        text: 'prise de parole',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: yellow3
                        )
                      ),
                      TextSpan(
                        text: ' en public, '
                      ),
                      TextSpan(
                        text: 'développement',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: yellow3
                        )
                      ),
                      TextSpan(
                        text: ' de vos '
                      ),
                      TextSpan(
                        text: 'aptitudes sociales',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: yellow3
                        )
                      ),
                      TextSpan(
                        text: ', '
                      ),
                      TextSpan(
                        text: 'approfondissement',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: yellow3
                        )
                      ),
                      TextSpan(
                        text: ' de vos '
                      ),
                      TextSpan(
                        text: 'connaissances',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: yellow3
                        )
                      ),
                      TextSpan(
                        text: ' dans le domaine qui vous '
                      ),
                      TextSpan(
                        text: 'passionne',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: yellow3
                        )
                      ),
                      TextSpan(
                        text: ', et bien plus encore. Vous participerez à un projet '
                      ),
                      TextSpan(
                        text: 'ambitieux',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: yellow3
                        )
                      ),
                      TextSpan(
                        text: ', porteur de '
                      ),
                      TextSpan(
                        text: 'sens',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: yellow3
                        )
                      ),
                      TextSpan(
                        text: ' et rempli de '
                      ),
                      TextSpan(
                        text: 'défis',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: yellow3
                        )
                      ),
                      TextSpan(
                        text: ' ! Venez vivre une aventure humaine unique, tissez des liens forts et devenez un acteur actif de la vie associative !'
                      )
                    ]
                  ),
                ),
                SizedBox(height: largeHeight(context)),
                const Divider(
                  color: black,
                  thickness: 3,
                  height: 0,
                ),
                SizedBox(height: mediumHeight(context)),
                Text('Les avantages du monde associatif',
                  style: Theme.of(context).textTheme.titleSmall,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: mediumHeight(context)),
                Image.asset('assets/images/recrutement_2.png',
                height: objectWidth(context) - 50,
                ),
                SizedBox(height: largeHeight(context)),
                RichText(
                  textAlign: TextAlign.justify,
                  text: TextSpan(
                    style: Theme.of(context).textTheme.bodyMedium,
                    children: const <TextSpan>[
                      TextSpan(
                        text: 'Rejoindre notre association, c\'est l\'opportunité d\''
                      ),
                      TextSpan(
                        text: 'acquérir',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: yellow3
                        )
                      ),
                      TextSpan(
                        text: ' des compétences '
                      ),
                      TextSpan(
                        text: 'pratiques',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: yellow3
                        )
                      ),
                      TextSpan(
                        text: ' et '
                      ),
                      TextSpan(
                        text: 'valorisées',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: yellow3
                        )
                      ),
                      TextSpan(
                        text: ', d\''
                      ),
                      TextSpan(
                        text: 'élargir',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: yellow3
                        )
                      ),
                      TextSpan(
                        text: ' ton '
                      ),
                      TextSpan(
                        text: 'réseau',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: yellow3
                        )
                      ),
                      TextSpan(
                        text: ', et de t\''
                      ),
                      TextSpan(
                        text: 'épanouir personnellement',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: yellow3
                        )
                      ),
                      TextSpan(
                        text: ' en t\'engageant pour des '
                      ),
                      TextSpan(
                        text: 'causes importantes',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: yellow3
                        )
                      ),
                      TextSpan(
                        text: '. C\'est une expérience '
                      ),
                      TextSpan(
                        text: 'enrichissante',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: yellow3
                        )
                      ),
                      TextSpan(
                        text: ' qui te permet non seulement de te '
                      ),
                      TextSpan(
                        text: 'préparer',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: yellow3
                        )
                      ),
                      TextSpan(
                        text: ' pour ton '
                      ),
                      TextSpan(
                        text: 'avenir professionnel',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: yellow3
                        )
                      ),
                      TextSpan(
                        text: ', mais aussi de '
                      ),
                      TextSpan(
                        text: 'contribuer positivement',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: yellow3
                        )
                      ),
                      TextSpan(
                        text: ' à la société. En plus, cela te donnera l\'occasion de faire des '
                      ),
                      TextSpan(
                        text: 'rencontres',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: yellow3
                        )
                      ),
                      TextSpan(
                        text: ', de développer ta '
                      ),
                      TextSpan(
                        text: 'conscience sociale',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: yellow3
                        )
                      ),
                      TextSpan(
                        text: ', et de vivre des expériences '
                      ),
                      TextSpan(
                        text: 'concrètes',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: yellow3
                        )
                      ),
                      TextSpan(
                        text: ' que tu pourras '
                      ),
                      TextSpan(
                        text: 'valoriser',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: yellow3
                        )
                      ),
                      TextSpan(
                        text: ' dans ton parcours. Alors, pourquoi ne pas faire le premier pas et nous rejoindre ?',
                      ),
                    ]
                  ),
                ),
                SizedBox(height: largeHeight(context)),
                const Divider(
                  color: black,
                  thickness: 3,
                  height: 0,
                ),
                SizedBox(height: mediumHeight(context)),
                Text('Nous avons besoin de vous !',
                  style: Theme.of(context).textTheme.titleSmall,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: mediumHeight(context)),
                Image.asset('assets/images/recrutement_3.png',
                height: objectWidth(context) - 50,
                ),
                SizedBox(height: largeHeight(context)),
                RichText(
                  textAlign: TextAlign.justify,
                  text: TextSpan(
                    style: Theme.of(context).textTheme.bodyMedium,
                    children: const <TextSpan>[
                      TextSpan(
                        text: 'Nous recherchons des personnes de '
                      ),
                      TextSpan(
                        text: 'tout horizon',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: yellow3
                        )
                      ),
                      TextSpan(
                        text: ' pour former une équipe '
                      ),
                      TextSpan(
                        text: 'dynamique',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: yellow3
                        )
                      ),
                      TextSpan(
                        text: ', composée de jeunes et d\'adultes '
                      ),
                      TextSpan(
                        text: 'motivés',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: yellow3
                        )
                      ),
                      TextSpan(
                        text: ', afin de rendre notre association encore plus '
                      ),
                      TextSpan(
                        text: 'active',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: yellow3
                        )
                      ),
                      TextSpan(
                        text: '. Plusieurs '
                      ),
                      TextSpan(
                        text: 'missions',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: yellow3
                        )
                      ),
                      TextSpan(
                        text: ' sont disponibles, et seront '
                      ),
                      TextSpan(
                        text: 'proposées',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: yellow3
                        )
                      ),
                      TextSpan(
                        text: ' en fonction de vos '
                      ),
                      TextSpan(
                        text: 'compétences',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: yellow3
                        )
                      ),
                      TextSpan(
                        text: ' et de vos '
                      ),
                      TextSpan(
                        text: 'intérêts',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: yellow3
                        )
                      ),
                      TextSpan(
                        text: '. Vous pourrez '
                      ),
                      TextSpan(
                        text: 'adapter',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: yellow3
                        )
                      ),
                      TextSpan(
                        text: ' votre engagement selon vos '
                      ),
                      TextSpan(
                        text: 'disponibilités',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: yellow3
                        )
                      ),
                      TextSpan(
                        text: ', que ce soit pour un '
                      ),
                      TextSpan(
                        text: 'soutien régulier',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: yellow3
                        )
                      ),
                      TextSpan(
                        text: ' à mi-temps ou une '
                      ),
                      TextSpan(
                        text: 'aide ponctuelle',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: yellow3
                        )
                      ),
                      TextSpan(
                        text: '. Chaque contribution est '
                      ),
                      TextSpan(
                        text: 'précieuse',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: yellow3
                        )
                      ),
                      TextSpan(
                        text: ' et nous avons besoin de toutes les '
                      ),
                      TextSpan(
                        text: 'bonnes volontés',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: yellow3
                        )
                      ),
                      TextSpan(
                        text: ' !'
                      )
                    ]
                  ),
                ),
                SizedBox(height: largeHeight(context)),
                const Divider(
                  color: black,
                  thickness: 3,
                  height: 0,
                )
              ]
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
              width: objectWidth(context),
              child: Column(
                children: [
                  SizedBox(height: appBarHeight(context)),  // Espace entre le haut de la page et le contenu
                  ClipRRect(
                    child: Column(
                      children: [
                        Container(
                          width: objectWidth(context),
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
                                      width: objectWidth(context),
                                      color: yellow,
                                      child: Column(
                                        children: [
                                          SizedBox(height: mediumHeight(context)),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text('Connexion',
                                              style: Theme.of(context).textTheme.titleLarge,
                                          ),
                                            ]
                                          ),
                                          SizedBox(height: mediumHeight(context)),
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
                                            width: objectWidth(context) - 50,
                                            child: Column(
                                              children: [
                                                SizedBox(height: largeHeight(context)),
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
                                                SizedBox(height: largeHeight(context)),
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
                                                SizedBox(height: smallHeight(context)),
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
                                                SizedBox(height: smallHeight(context)),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: objectWidth(context),
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
                                                SizedBox(height: mediumHeight(context)),
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

class ReductionPage extends StatefulWidget {
  const ReductionPage({super.key});

  @override
  State<ReductionPage> createState() => _ReductionPageState();
}

class _ReductionPageState extends State<ReductionPage> {
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
              width: objectWidth(context),
              child: Column(
                children: [
                  SizedBox(height: appBarHeight(context)),  // Espace entre le haut de la page et le contenu
                  ClipRRect(
                    child: Column(
                      children: [
                        Container(
                          width: objectWidth(context),
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
                                      width: objectWidth(context),
                                      color: yellow,
                                      child: Column(
                                        children: [
                                          SizedBox(height: mediumHeight(context)),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text('Réduction',
                                                style: Theme.of(context).textTheme.titleLarge,
                                              ),
                                            ]
                                          ),
                                          SizedBox(height: mediumHeight(context)),
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
                                        width: objectWidth(context) - 50,
                                        child: Column(
                                          children: [
                                            SizedBox(height: largeHeight(context)),
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
                                            SizedBox(height: largeHeight(context)),
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
                                            SizedBox(height: mediumHeight(context)),
                                            Text('Justificatif d\'identité/Certificat de scolarité',
                                              style: Theme.of(context).textTheme.bodySmall
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
                                                        Size(buttonwidth - 35, 55)
                                                      ),
                                                      maximumSize: const WidgetStatePropertyAll(
                                                        Size(buttonwidth - 35, 55)
                                                      )
                                                    ),
                                                    
                                                    onPressed: () => pickFile(),
                                                    child: Text('Parcourir...',  // TODO filePicked ? const Text('Choisir un fichier') : Text(fileName)),
                                                      style: Theme.of(context).textTheme.bodyMedium)
                                                  ),
                                                  const SizedBox(width: 5),  // Espace horizontal entre le bouton et le texte
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
                                            Text('En soumettant ce formulaire, vous acceptez que vos données soient utilisées pour traiter votre demande de réduction. Une fois la demande traitée, vos données seront supprimées.',
                                              style: Theme.of(context).textTheme.bodySmall
                                            ),
                                            SizedBox(height: mediumHeight(context)),
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
                                              child: Text('Envoyer',
                                                style: Theme.of(context).textTheme.bodyMedium
                                              ),
                                            ),
                                            SizedBox(height: mediumHeight(context)),
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

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final pageID = 'Contact';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarEloquencia(context, pageID),  // Barre de navigation en haut
      endDrawer: endDrawerEloquencia(context, pageID),
      body: Center(
        child: ListView(
          children: [
            SizedBox(
              width: objectWidth(context),
              child: Column(
                children: [
                  SizedBox(height: appBarHeight(context)),  // Espace entre le haut de la page et le contenu
                  ClipRRect(
                    child: Column(
                      children: [
                        Container(
                          width: objectWidth(context),
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
                                      width: objectWidth(context),
                                      color: yellow,
                                      child: Column(
                                        children: [
                                          SizedBox(height: mediumHeight(context)),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text('Contact',
                                                style: Theme.of(context).textTheme.titleLarge,
                                              ),
                                            ]
                                          ),
                                          SizedBox(height: mediumHeight(context)),
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
                                        width: objectWidth(context) - 50,
                                        child: Column(
                                          children: [
                                            SizedBox(height: largeHeight(context)),
                                            TextField(  // Champ de texte pour la connexion
                                              onTapOutside: (event) {
                                                FocusScope.of(context).unfocus();
                                              },
                                              cursorColor: black,
                                              decoration: InputDecoration(
                                                labelText: 'Nom',
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
                                            SizedBox(height: largeHeight(context)),
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
                                            SizedBox(height: largeHeight(context)),
                                            SizedBox(
                                              height: getHeight(context)/3,
                                              child: TextField(  // Champ de texte pour la connexion
                                                textAlignVertical: TextAlignVertical.top,
                                                expands: true,
                                                maxLines: null,
                                                cursorColor: black,
                                                decoration: InputDecoration(
                                                  labelText: 'Message',
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
                                                onTapOutside: (event) {
                                                  FocusScope.of(context).unfocus();
                                                },
                                              ),
                                            ),
                                            SizedBox(height: mediumHeight(context)),
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
                                              child: Text('Envoyer',
                                                style: Theme.of(context).textTheme.bodyMedium
                                              ),
                                            ),
                                            SizedBox(height: mediumHeight(context)),
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
      )
    );
  }
}