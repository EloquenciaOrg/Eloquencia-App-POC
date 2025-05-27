import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:eloquencia/blog.dart';
import 'package:eloquencia/discount.dart';
import 'package:eloquencia/helloasso.dart';
import 'package:eloquencia/login.dart';
import 'package:eloquencia/main.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class HomePage extends StatefulWidget {  // La page d'accueil
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final pageID = 'Accueil';
  List<Widget> blogList = [];
  late StreamSubscription subscription;
  var isDeviceConnected = false;
  bool isAlertSet = false;

  @override
  void initState() {
    getConnectivity();
    _initBlogList();
    super.initState();
  }

  getConnectivity() {
    subscription = Connectivity().onConnectivityChanged.listen(
      (List<ConnectivityResult> result) async {
        isDeviceConnected = await InternetConnectionChecker.instance.hasConnection;
        if (!isDeviceConnected && isAlertSet == false) {
          showDialogBox();
          setState(() {
            isAlertSet = true;
          });
        }
      }
    );
  }

  Future<void> _initBlogList() async {
    try {
      blogList = await showBlog(context, 2);
      setState(() {
        blogList = blogList;
      });
    } catch (e) {
      blogList = [
        Text('Problème de connexion',
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
      ];
    }
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarEloquencia(context, pageID),  // Barre de navigation en haut
      endDrawer: endDrawerEloquencia(context, pageID),  // Menu de navigation à droite
      body: RefreshIndicator(
        color: yellow,
        onRefresh: () async {
          _initBlogList();
        },
        child: ListView(
          children: [
            Column(
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
                              padding: WidgetStatePropertyAll<EdgeInsetsGeometry>(
                                EdgeInsets.symmetric(horizontal: getWidth(context, 11)),
                              ),
                              minimumSize: WidgetStatePropertyAll<Size>(
                                Size(buttonWidth(context), 40),
                              ),
                              maximumSize: WidgetStatePropertyAll<Size>(
                                Size(buttonWidth(context), 40),
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
                              padding: WidgetStatePropertyAll<EdgeInsetsGeometry>(
                                EdgeInsets.symmetric(horizontal: getWidth(context, 11)),
                              ),
                              minimumSize: WidgetStatePropertyAll<Size>(
                                Size(buttonWidth(context), 40),
                              ),
                              maximumSize: WidgetStatePropertyAll<Size>(
                                Size(buttonWidth(context), 40),
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
                      SizedBox(height: largeHeight(context)),  // Espace entre le bouton de connexion et le texte de réduction
                      Text('Étudiant·e ou mineur·e ? Vous pouvez faire une demande de réduction ici.',
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(height: mediumHeight(context)),  // Espace entre le texte et le bouton de demande de réduction
                      ElevatedButton(  // Bouton de demande de réduction
                        style: ButtonStyle(
                          backgroundColor: const WidgetStatePropertyAll<Color>(yellow),
                          shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          padding: WidgetStatePropertyAll<EdgeInsetsGeometry>(
                            EdgeInsets.symmetric(horizontal: getWidth(context, 11)),
                          ),
                          minimumSize: WidgetStatePropertyAll<Size>(
                            Size(getWidth(context, 250), 40),
                          ),
                          maximumSize: WidgetStatePropertyAll<Size>(
                            Size(getWidth(context, 250), 40),
                          ),
                        ),
                        
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const DiscountPage()));
                        },
                        child: Text('Demander une réduction',
                          style: Theme.of(context).textTheme.bodyMedium
                        ),
                      ),
                    ],
                  )
                ),
                SizedBox(height: largeHeight(context)),  // Espace entre les boutons d'adhésion et de connexion et le carrousel
                CarouselSlider(  // Carrousel d'images
                  items: [
                    Image.asset('assets/images/carousel.jpg',
                    ),
                    Image.asset('assets/images/carousel1.jpg',
                    )
                  ],
                  options: CarouselOptions(
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 7),
                    enlargeCenterPage: true,
                    enlargeFactor: 2,
                    aspectRatio: 2.0,
                    viewportFraction: 1,
                    height: getWidth(context, 235)
                  )
                ),
                SizedBox(
                  width: objectWidth(context),
                  child: Column(
                    children: [
                      SizedBox(height: largeHeight(context)),
                      Text('Articles à la une',
                        style: Theme.of(context).textTheme.titleMedium,
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(height: largeHeight(context)),
                      ...blogList,
                      SizedBox(height: smallHeight(context)),
                      ElevatedButton(  // Bouton de réinitialisation du mot de passe
                        style: ButtonStyle(
                          backgroundColor: const WidgetStatePropertyAll<Color>(yellow),
                          shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          padding: WidgetStatePropertyAll<EdgeInsetsGeometry>(
                            EdgeInsets.symmetric(horizontal: getWidth(context, 11)),
                          ),
                          minimumSize: WidgetStatePropertyAll<Size>(
                            Size(buttonWidth(context) - getWidth(context, 40), 40),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const BlogPage()));
                        },
                        child: Text('Voir tous les articles',
                          style: Theme.of(context).textTheme.bodyMedium
                        ),
                      ),
                      SizedBox(height: largeHeight(context)),
                    ]
                  )
                ),
              ],
            )
          ]
        ),
      )
    );
  }

  showDialogBox() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Pas de connexion Internet'),
          content: const Text('Veuillez vérifier votre connexion Internet.'),
          actions: [
            TextButton(
              onPressed: () async {
                Navigator.pop(context, 'Cancel');
                setState(() {
                  isAlertSet = false;  // Réinitialiser l'état de l'alerte
                });
                isDeviceConnected = await InternetConnectionChecker.instance.hasConnection;
                if (!isDeviceConnected) {
                  showDialogBox();
                  setState(() {
                    isAlertSet = true;  // Réinitialiser l'état de l'alerte
                  });
                }
              },
              child: const Text('OK'),
            ),
          ],
        );
      }
    );
  }
}