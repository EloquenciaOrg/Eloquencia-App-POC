import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:webview_flutter/webview_flutter.dart';
//import 'dart:io';  // Pour vérifier la connexion Internet

void main() {
  runApp(const MyApp());
}

// Variables globales

// Constantes pour la taille des boutons
const double largebuttonwidth = 250;  // Hauteur des gros boutons
const double buttonwidth = 150;  // Hauteur des boutons normaux
const double buttonheight = 10;  // Largeur des boutons normaux

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
appBarEloquencia() {  // Fonction pour créer la barre de navigation en haut de l'application
  return AppBar(
    backgroundColor: yellow,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(logo,
          width: 44,
        ),
        const SizedBox(width: 10),
        const Text('Eloquéncia',
          style: TextStyle(
            fontSize: 22,
          ),
        ),
      ],
    ),
  );
}

drawerHeaderEloquencia() {  // Fonction pour créer l'en-tête du menu de navigation
  return DrawerHeader(  // En-tête du menu de navigation
    decoration: const BoxDecoration(color: yellow), // quand bouton cliqué : 0xFFFFCA2C
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            Image.asset(logo,
              width: 60,
            ),
            const SizedBox(width: 10),
            const Text('Eloquéncia',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ],
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
          bodyMedium: TextStyle(
            fontSize: 18,
          ),
        ),
      )
    );
  }
}

class HomePage extends StatelessWidget {  // La page d'accueil
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarEloquencia(),  // Barre de navigation en haut
      endDrawer: Drawer(  // Menu de navigation à droite
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            drawerHeaderEloquencia(),  // En-tête du menu de navigation
            ListTile(
              title: Text('Rejoindre',
                style: Theme.of(context).textTheme.bodyMedium),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const JoinPage()),
                );
              },
            ),
            ListTile(
              title: Text('Blog',
                style: Theme.of(context).textTheme.bodyMedium),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Partenaires',
                style: Theme.of(context).textTheme.bodyMedium),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Réductions',
                style: Theme.of(context).textTheme.bodyMedium),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Contact',
                style: Theme.of(context).textTheme.bodyMedium),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('À propos',
                style: Theme.of(context).textTheme.bodyMedium),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Connexion',  // TODO changer position du bouton juste en dessous du logo et l'afficher seulement si pas connecté
                style: Theme.of(context).textTheme.bodyMedium), 
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
            ),
          ],
        ),
      ),
      body:  Center(
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 350,
                  child: Column(
                    children: [
                      const SizedBox(height: 60),  // Espace entre le haut de la page et le texte
                      const SelectableText('Eloquéncia',  // Titre de la page d'accueil
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 45,
                        ),
                      ),
                      const SizedBox(height: 30),  // Espace entre le titre et le texte
                      Text('La plateforme de cours en ligne pour apprendre à parler en public.',  // Slogan de la page d'accueil
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 30),  // Espace entre le slogan et les boutons d'adhésion et de connexion
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(  // Bouton d'adhésion
                            style: ButtonStyle(
                              backgroundColor: const WidgetStatePropertyAll<Color>(yellow),
                              foregroundColor: const WidgetStatePropertyAll<Color>(black),
                              shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              padding: const WidgetStatePropertyAll<EdgeInsetsGeometry>(
                                EdgeInsets.symmetric(horizontal: 11),
                              ),
                              fixedSize: const WidgetStatePropertyAll<Size>(
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
                              foregroundColor: const WidgetStatePropertyAll<Color>(black),
                              shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              padding: const WidgetStatePropertyAll<EdgeInsetsGeometry>(
                                EdgeInsets.symmetric(horizontal: 11),
                              ),
                              fixedSize: const WidgetStatePropertyAll<Size>(
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
                
                const SizedBox(height: 20),  // Espace entre le carrousel et le texte de réduction
                SizedBox(
                  width: 350,
                  child: Column(
                    children: [
                      Text('Étudiant·e ou mineur·e ? Vous pouvez faire une demande de réduction ici.',
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),  // Espace entre le texte et le bouton de demande de réduction
                      ElevatedButton(  // Bouton de demande de réduction
                        // TODO : faire une page de demande de réduction
                        style: ButtonStyle(
                          backgroundColor: const WidgetStatePropertyAll<Color>(Color(0xFFFFC107)),
                          foregroundColor: const WidgetStatePropertyAll<Color>(black),
                          shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          padding: const WidgetStatePropertyAll<EdgeInsetsGeometry>(
                            EdgeInsets.symmetric(horizontal: 11),
                          ),
                          fixedSize: const WidgetStatePropertyAll<Size>(
                            Size(largebuttonwidth, buttonheight),
                          ),
                        ),
                        
                        onPressed: () {
                          const ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll<Color>(yellow2),
                            foregroundColor: WidgetStatePropertyAll<Color>(black),
                          );
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
                const SizedBox(
                  width: 350,
                  child: Column(
                    children: [
                      SizedBox(height: 30),
                      Text('Articles à la une',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarEloquencia(),
      endDrawer: Drawer(  // Menu de navigation à droite
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            drawerHeaderEloquencia(),  // En-tête du menu de navigation
            ListTile(
              title: Text('Rejoindre',
                style: Theme.of(context).textTheme.bodyMedium),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Blog',
                style: Theme.of(context).textTheme.bodyMedium),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Partenaires',
                style: Theme.of(context).textTheme.bodyMedium),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Réductions',
                style: Theme.of(context).textTheme.bodyMedium),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Contact',
                style: Theme.of(context).textTheme.bodyMedium),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('À propos',
                style: Theme.of(context).textTheme.bodyMedium),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Connexion',  // TODO changer position du bouton juste en dessous du logo et l'afficher seulement si pas connecté
                style: Theme.of(context).textTheme.bodyMedium), 
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
/*
Future check() async {
  try {
    final result = await InternetAddress.lookup('google.com');
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
      appBar: appBarEloquencia(),
      endDrawer: Drawer(  // Menu de navigation à droite
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            drawerHeaderEloquencia(),  // En-tête du menu de navigation
            ListTile(
              title: Text('Rejoindre',
                style: Theme.of(context).textTheme.bodyMedium),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const JoinPage())
                );
              },
            ),
            ListTile(
              title: Text('Blog',
                style: Theme.of(context).textTheme.bodyMedium),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Partenaires',
                style: Theme.of(context).textTheme.bodyMedium),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Réductions',
                style: Theme.of(context).textTheme.bodyMedium),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Contact',
                style: Theme.of(context).textTheme.bodyMedium),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('À propos',
                style: Theme.of(context).textTheme.bodyMedium),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Connexion',  // TODO changer position du bouton juste en dessous du logo et l'afficher seulement si pas connecté
                style: Theme.of(context).textTheme.bodyMedium), 
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
            ),
          ],
        ),
      ),
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

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarEloquencia(),
      endDrawer: Drawer(  // Menu de navigation à droite
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            drawerHeaderEloquencia(),  // En-tête du menu de navigation
            ListTile(
              title: Text('Rejoindre',
                style: Theme.of(context).textTheme.bodyMedium),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Blog',
                style: Theme.of(context).textTheme.bodyMedium),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Partenaires',
                style: Theme.of(context).textTheme.bodyMedium),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Réductions',
                style: Theme.of(context).textTheme.bodyMedium),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Contact',
                style: Theme.of(context).textTheme.bodyMedium),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('À propos',
                style: Theme.of(context).textTheme.bodyMedium),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Connexion',  // TODO changer position du bouton juste en dessous du logo et l'afficher seulement si pas connecté
                style: Theme.of(context).textTheme.bodyMedium), 
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: SizedBox(
          width: 350,
          child: Column(
            children: [
              const SizedBox(height: 60),  // Espace entre le haut de la page et le texte
              ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Column(
                  children: [
                    Container(
                      width: 300,
                      decoration: BoxDecoration(
                        color: white,
                        border: Border.all(color: yellow, width: 2),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 20),  // Espace entre le haut de la page et le texte
                          Image.asset(logo,
                            width: 50,
                          ),
                          const Text('Connexion',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            )
                          ),
                          const SizedBox(height: 20),  // Espace entre le haut de la page et le texte
                          Container(
                            width: 300,
                            decoration: const BoxDecoration(
                              color: white,
                            ),
                            child: TextField(  // Champ de texte pour la connexion
                              decoration: InputDecoration(
                                labelText: 'Nom d\'utilisateur',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: const BorderSide(color: yellow, width: 2),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: const BorderSide(color: yellow, width: 2),
                                ),
                              ),
                            ),
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
      ),
    );
  }
}