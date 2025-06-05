import 'package:eloquencia/main.dart';
import 'package:flutter/material.dart';

class ContactPage extends StatefulWidget {
  final Map<String, dynamic> userInfo;
  const ContactPage({super.key, required this.userInfo});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final pageID = 'Contact';
  final name = TextEditingController();
  final email = TextEditingController();
  final message = TextEditingController();
  Widget? loginResult;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarEloquencia(context, pageID, 0),  // Barre de navigation en haut
      endDrawer: endDrawerEloquencia(context, pageID, widget.userInfo),
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
                                      color: yellow3,
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
                                              controller: name,
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
                                              controller: email,
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
                                            SizedBox(
                                              height: getHeight(context, 250),
                                              child: TextField(  // Champ de texte pour la connexion
                                                controller: message,
                                                onTapOutside: (event) {
                                                  FocusScope.of(context).unfocus();
                                                },
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
                                              ),
                                            ),
                                            SizedBox(height: smallHeight(context)),
                                            if (loginResult != null) 
                                              loginResult!,
                                            SizedBox(height: smallHeight(context)),
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
                                                maximumSize: WidgetStatePropertyAll<Size>(
                                                  Size(buttonWidth(context) - getWidth(context, 40), 40),
                                                ),
                                              ),
                                              
                                              onPressed: () async {
                                                loginResult = await apiContact(context, name.text, email.text, message.text);
                                                setState(() {
                                                  loginResult = loginResult;
                                                });
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