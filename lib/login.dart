// ignore_for_file: use_build_context_synchronously

import 'package:eloquencia/forgotpasswd.dart';
import 'package:eloquencia/main.dart';
import 'package:eloquencia/welcome.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final Map<String, dynamic> userInfo;
  const LoginPage({super.key, required this.userInfo});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final pageID = "Connexion";
  bool isChecked = false;  // Statut de la case à cocher
  final email = TextEditingController();
  final password = TextEditingController();
  // ignore: prefer_typing_uninitialized_variables
  var loginResult;

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
      appBar: appBarEloquencia(context, pageID, yellow, 0),
      endDrawer: endDrawerEloquencia(context, pageID, widget.userInfo, yellow),
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
                                              controller: email,
                                              onTapOutside: (event) {
                                                FocusScope.of(context).unfocus();
                                              },
                                              style: Theme.of(context).textTheme.bodySmall,
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
                                            controller: password,
                                              onTapOutside: (event) {
                                                FocusScope.of(context).unfocus();
                                              },
                                              style: Theme.of(context).textTheme.bodySmall,
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
                                            if (loginResult != null && loginResult is Widget) 
                                              loginResult!,
                                            SizedBox(height: smallHeight(context))
                                          ],
                                        ),
                                      ),
                                      Column(
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
                                                  minimumSize: WidgetStatePropertyAll<Size>(
                                                    Size(buttonWidth(context) - getWidth(context, 40), 40),
                                                  ),
                                                ),
                                                
                                                onPressed: () async {
                                                  loginResult = await apiLogin(context, email.text, password.text);
                                                  if (loginResult is Widget) {
                                                    setState(() {
                                                      loginResult = loginResult;
                                                    });  // TODO Connexion renvoie à une page comme le lms
                                                  } else {
                                                    runApp(MyApp(userInfo: loginResult));
                                                    while (Navigator.canPop(context)) {  // Je retourne à la page d'accueil
                                                      Navigator.pop(context);
                                                    }
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(builder: (context) => WelcomePage(userInfo: widget.userInfo))
                                                    );
                                                  }
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
                                                  minimumSize: WidgetStatePropertyAll<Size>(
                                                    Size(buttonWidth(context) + getWidth(context, 40), 40),
                                                  ),
                                                ),
                                                
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(builder: (context) => ForgotPasswdPage(userInfo: widget.userInfo)),
                                                  );
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