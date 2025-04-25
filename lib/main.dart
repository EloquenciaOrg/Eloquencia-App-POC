import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
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
        )
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

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      endDrawer: Drawer(
        child:ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
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
              title: const Text('Rejoindre'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Blog'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Partenaires'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Réductions'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Contact'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('À propos'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Connexion'), // TODO changer position du bouton juste en dessous du logo et l'afficher seulement si pas connecté
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
                const SizedBox(height: 50),
                const Text('Eloquéncia',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 45,
                  ),
                ),
                const Text('La plateforme de cours en ligne pour apprendre à parler en public',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: const WidgetStatePropertyAll<Color>(Color(0xFFFFC107)),
                    foregroundColor: const WidgetStatePropertyAll<Color>(Colors.black),
                    shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                  
                  onPressed: () {
                    const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll<Color>(Color(0xFFFFCA2C)),
                      foregroundColor: WidgetStatePropertyAll<Color>(Colors.black),
                    );
                  },
                  child: const Text('Adhérer',
                    style: TextStyle(
                      fontSize: 18
                    ),
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