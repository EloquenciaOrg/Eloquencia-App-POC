// ignore_for_file: avoid_print

import 'dart:io';
import 'package:eloquencia/main.dart';
import 'package:flutter/material.dart';

class DiscountPage extends StatefulWidget {
  final Map<String, dynamic> userInfo;
  const DiscountPage({super.key, required this.userInfo});

  @override
  State<DiscountPage> createState() => _DiscountPageState();
}

class _DiscountPageState extends State<DiscountPage> {
  final pageID = 'Réductions';
  String fileName = '5Mo max (PNG, JPG ou PDF)';
  File? file;
  final name = TextEditingController();
  final email = TextEditingController();
  Widget? errorMessage;
  bool cgu = false;  // Statut de la case à cocher

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
      else if (cgu == true) {
        return yellow;  // Couleur de la case à cocher si elle est cochée
      }
      return white;
    }
    return Scaffold(
      appBar: appBarEloquencia(context, pageID, yellow, 0),  // Barre de navigation en haut
      endDrawer: endDrawerEloquencia(context, pageID, widget.userInfo, yellow),
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
                                              style: Theme.of(context).textTheme.bodySmall,
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
                                                      minimumSize: WidgetStatePropertyAll(
                                                        Size(buttonWidth(context) - 35, 55)
                                                      ),
                                                      maximumSize: WidgetStatePropertyAll(
                                                        Size(buttonWidth(context) - 35, 55)
                                                      )
                                                    ),
                                                    
                                                    onPressed: () async {
                                                      file = await pickFile();
                                                      if (file == null) {
                                                        fileName = '5Mo max (PNG, JPG ou PDF)';
                                                      } else {
                                                        fileName = (file.toString().split(r'/',).last).split('\'').first;
                                                      }
                                                      setState(() {
                                                        fileName = fileName;
                                                      });
                                                    },
                                                    child: Text('Parcourir...',
                                                      style: Theme.of(context).textTheme.bodyMedium)
                                                  ),
                                                  const SizedBox(width: 5),  // Espace horizontal entre le bouton et le texte
                                                  GestureDetector(
                                                    child: SizedBox(
                                                      width: getWidth(context, 175),
                                                      child: Text(fileName,
                                                        style: Theme.of(context).textTheme.bodyMedium,
                                                      ),
                                                    ),
                                                    onTap: () async{
                                                      file = await pickFile();
                                                      print(file);
                                                      if (file == null) {
                                                        fileName = '5Mo max (PNG, JPG ou PDF)';
                                                      } else {
                                                        fileName = (file.toString().split(r'/',).last).split('\'').first;
                                                      }
                                                      setState(() {
                                                        fileName = fileName;
                                                      });
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Text('En soumettant ce formulaire, vous acceptez que vos données soient utilisées pour traiter votre demande de réduction. Une fois la demande traitée, vos données seront supprimées.',
                                              style: Theme.of(context).textTheme.bodySmall,
                                              textAlign: TextAlign.justify
                                            ),
                                            SizedBox(height: smallHeight(context)),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Checkbox(
                                                  checkColor: white,
                                                  fillColor: WidgetStateProperty.resolveWith(getColor),
                                                  value: cgu,
                                                  onChanged: (bool? value) {
                                                    setState(() {
                                                      cgu = value!;  // Mettre à jour le statut de la case à cocher
                                                    });
                                                  },
                                                ),
                                                GestureDetector(
                                                  child: SizedBox(
                                                    width: getWidth(context, 250),
                                                    child: Text('Accepter les conditions générales d\'utilisation',
                                                      style: Theme.of(context).textTheme.bodyMedium,
                                                    ),
                                                  ),
                                                  onTap: () {
                                                    setState(() {
                                                      cgu = !cgu;  // Inverser le statut de la case à cocher
                                                    });
                                                  },
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: smallHeight(context)),
                                            if (errorMessage != null) 
                                              errorMessage!,
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
                                              
                                              onPressed: () async{
                                                errorMessage = await apiDiscount(context, name.text, email.text, file, cgu);
                                                if (!mounted) return;
                                                setState(() {
                                                  errorMessage = errorMessage;
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
      ),
    );
  }
}