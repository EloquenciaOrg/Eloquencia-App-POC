import 'package:eloquencia/main.dart';
import 'package:flutter/material.dart';

class LogoutPage extends StatelessWidget {
  final Map<String, dynamic> userInfo;
  const LogoutPage({super.key, required this.userInfo});
  final pageID = "Déconnexion";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarEloquencia(context, pageID, 0),
      endDrawer: endDrawerEloquencia(context, pageID, userInfo),
      body: ListView(
        children: [
          Column(
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
                                  color: yellow,
                                  child: Column(
                                    children: [
                                      SizedBox(height: mediumHeight(context)),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text('Déconnexion',
                                            style: Theme.of(context).textTheme.titleLarge,
                                          ),
                                        ]
                                      ),
                                      SizedBox(height: mediumHeight(context)),
                                    ]
                                  )
                                ),
                                const Divider(
                                  color: yellow3,
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
                                            Text('Bonjour ${userInfo['first_name']} ${userInfo['name']}',
                                              style: Theme.of(context).textTheme.titleSmall,
                                              textAlign: TextAlign.center
                                            ),
                                            SizedBox(height: mediumHeight(context)),
                                            Text('Voulez-vous vous déconnecter',
                                              style: Theme.of(context).textTheme.bodyLarge,
                                              textAlign: TextAlign.center
                                            ),
                                            SizedBox(height: mediumHeight(context))
                                          ],
                                        ),
                                      ),
                                      Column(
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
                                              minimumSize: WidgetStatePropertyAll<Size>(
                                                Size(buttonWidth(context) - getWidth(context, 40), 40),
                                              ),
                                            ),
                                            
                                            onPressed: () async {
                                              print(await storage.readAll());
                                              storage.deleteAll();  // TODO supprimer le token
                                            },
                                            child: Text('Se déconnecter',
                                              style: Theme.of(context).textTheme.bodyMedium
                                            ),
                                          ),
                                          const SizedBox(width: 10),  // Espace horizontal entre les deux boutons
                                          SizedBox(height: mediumHeight(context)),
                                        ],
                                      ),
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
        ]
      ),
    );
  }
}