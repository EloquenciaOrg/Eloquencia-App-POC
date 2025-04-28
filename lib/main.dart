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
                      const SizedBox(height: 70),
                      const Text('Eloquéncia',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 45,
                        ),
                      ),
                      const SizedBox(height: 30),
                      Text('La plateforme de cours en ligne pour apprendre à parler en public',
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
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
                            child:  Text('Adhérer',
                              style: Theme.of(context).textTheme.bodyMedium
                            ),
                          ),
                          const SizedBox(width: 10),
                          ElevatedButton(
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
                            ),
                            
                            onPressed: () {
                              const ButtonStyle(
                                backgroundColor: WidgetStatePropertyAll<Color>(Color(0xFFFFCA2C)),
                                foregroundColor: WidgetStatePropertyAll<Color>(Colors.black),
                              );
                            },
                            child: Text('Connexion',
                              style: Theme.of(context).textTheme.bodyMedium
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Text('Étudiant·e ou mineur·e ? Vous pouvez faire une demande de réduction ici.',
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlign: TextAlign.center,
                      ),
                    ],
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