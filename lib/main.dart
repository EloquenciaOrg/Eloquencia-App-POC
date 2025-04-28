import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(const MyApp());
}

const double largebuttonwidth = 250;  // Hauteur des gros boutons
const double buttonwidth = 150;  // Hauteur des boutons normaux
const double buttonheight = 10;  // Largeur des boutons normaux

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

class EventPage extends StatelessWidget {
  const EventPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class HomePage extends StatelessWidget {  // La page d'accueil
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(  // Barre de navigation en haut
        backgroundColor: const Color(0xFFFFC107),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset('assets/images/eloquencia_round.png',
              width: 45,
            ),
            const SizedBox(width: 10),
            const Text('Eloquéncia'),
          ],
        ),
      ),
      endDrawer: Drawer(  // Menu de navigation à droite
        child:ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(  // En-tête du menu de navigation
              decoration: const BoxDecoration(color: Color(0xFFFFC107)), // quand bouton cliqué : 0xFFFFCA2C
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset('assets/images/eloquencia_round.png',
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
            ),
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
                      const Text('Eloquéncia',  // Titre de la page d'accueil
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 45,
                        ),
                      ),
                      const SizedBox(height: 40),  // Espace entre le titre et le texte
                      Text('La plateforme de cours en ligne pour apprendre à parler en public.',  // Slogan de la page d'accueil
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),  // Espace entre le slogan et les boutons d'adhésion et de connexion
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(  // Bouton d'adhésion
                            style: ButtonStyle(
                              backgroundColor: const WidgetStatePropertyAll<Color>(Color(0xFFFFC107)),
                              foregroundColor: const WidgetStatePropertyAll<Color>(Colors.black),
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
                              const ButtonStyle(
                                backgroundColor: WidgetStatePropertyAll<Color>(Color(0xFFFFCA2C)),
                                foregroundColor: WidgetStatePropertyAll<Color>(Colors.black),
                              );
                            },
                            child:  Text('Adhérer',
                              style: Theme.of(context).textTheme.bodyMedium
                            ),
                          ),
                          const SizedBox(width: 10),  // Espace horizontal entre les deux boutons
                          ElevatedButton(  // Bouton de connexion
                            style: ButtonStyle(
                              backgroundColor: const WidgetStatePropertyAll<Color>(Color(0xFFFFC107)),
                              foregroundColor: const WidgetStatePropertyAll<Color>(Colors.black),
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
                              const ButtonStyle(
                                backgroundColor: WidgetStatePropertyAll<Color>(Color(0xFFFFCA2C)),
                                foregroundColor: WidgetStatePropertyAll<Color>(Colors.black),
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
                          foregroundColor: const WidgetStatePropertyAll<Color>(Colors.black),
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
                            backgroundColor: WidgetStatePropertyAll<Color>(Color(0xFFFFCA2C)),
                            foregroundColor: WidgetStatePropertyAll<Color>(Colors.black),
                          );
                        },
                        child: Text('Demander une réduction',
                          style: Theme.of(context).textTheme.bodyMedium
                        ),
                      ),
                    ]
                  )
                )
              ],
            ),
          ]
        )
      ),
    );
  }
}