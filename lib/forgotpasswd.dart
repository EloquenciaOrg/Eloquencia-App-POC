import 'package:eloquencia/main.dart';
import 'package:flutter/material.dart';

class ForgotPasswdPage extends StatelessWidget {  // La page d'accueil
  const ForgotPasswdPage({super.key});
  final pageID = 'Réinitialisation';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarEloquencia(context, pageID, 0),  // Barre de navigation en haut
      endDrawer: endDrawerEloquencia(context, pageID),  // Menu de navigation à droite
      body:  Center(
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
                                              SizedBox(
                                                width: objectWidth(context) - 50,
                                                child: Text('Mot de Passe Oublié ?',
                                                  style: Theme.of(context).textTheme.titleLarge,
                                                ),
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
                                                Text('Un email sera envoyé à cette adresse pour confirmer la réinitialisation et passer à l\'étape suivante',
                                                  style: Theme.of(context).textTheme.bodySmall,
                                                  textAlign: TextAlign.justify
                                                ),
                                                SizedBox(height: largeHeight(context)),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: objectWidth(context),
                                            child: Column(
                                              children: [
                                                const SizedBox(width: 10),  // Espace horizontal entre les deux boutons
                                                ElevatedButton(  // Bouton de réinitialisation du mot de passe
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
                                                  ),
                                                  
                                                  onPressed: () {
                                                    
                                                  },
                                                  child: Text('Réinitialiser le mot de passe',
                                                    style: Theme.of(context).textTheme.bodyMedium
                                                  ),
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