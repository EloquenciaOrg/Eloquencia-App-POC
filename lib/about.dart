import 'package:eloquencia/main.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});
  final pageID = 'À propos';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarEloquencia(context, pageID, 0),  // Barre de navigation en haut
      endDrawer: endDrawerEloquencia(context, pageID),
      body: Center(
        child: ListView(
          children: [
            Column(
              children: [
                SizedBox(
                  width: objectWidth(context),
                  child: Column(
                    children: [
                      SizedBox(height: appBarHeight(context)),
                      Text('Eloquéncia',
                        style: Theme.of(context).textTheme.titleLarge
                      ),
                      SizedBox(height: mediumHeight(context)),
                      Text('L\'art de convaincre,\nle plaisir de parler !',
                        style: Theme.of(context).textTheme.headlineLarge
                      ),
                      SizedBox(height: largeHeight(context)),
                      RichText(
                        textAlign: TextAlign.justify,
                        text: TextSpan(
                          style: Theme.of(context).textTheme.bodyMedium,
                          children: const <TextSpan>[
                            TextSpan(text: 'L’Association '),
                            TextSpan(
                              text: 'Eloquéncia',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: yellow3
                              )
                            ),
                            TextSpan(text: ' (loi 1901) est une jeune association fondée par '),
                            TextSpan(
                              text: 'Marouan Jlassi',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: yellow3
                              )
                            ),
                            TextSpan(text: ' à '),
                            TextSpan(
                              text: 'Berre l’Étang',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: yellow3
                              )
                            ),
                            TextSpan(text: ' qui a pour but d\'enseigner l\''),
                            TextSpan(
                              text: 'art oratoire',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: yellow3
                              )
                            ),
                            TextSpan(text: ' dans le milieu local. Elle a pour conviction d\''),
                            TextSpan(
                              text: 'aider',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: yellow3
                              )
                            ),
                            TextSpan(text: ' les personnes qui souhaitent développer et perfectionner leur '),
                            TextSpan(
                              text: 'expression orale quotidienne',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: yellow3
                              )
                            ),
                            TextSpan(text: ', '),
                            TextSpan(
                              text: 'professionnelle',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: yellow3
                              )
                            ),
                            TextSpan(text: ' ou '),
                            TextSpan(
                              text: 'scolaire',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: yellow3
                              )
                            ),
                            TextSpan(text: ', notamment pour la préparation d\''),
                            TextSpan(
                              text: 'entretiens d\'embauche',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: yellow3
                              )
                            ),
                            TextSpan(text: ' ou d\''),
                            TextSpan(
                              text: 'examens oraux',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: yellow3
                              )
                            ),
                            TextSpan(text: '.'),
                          ]
                        )
                      ),
                      SizedBox(height: largeHeight(context)),
                      Text('Notre Histoire',
                        style: Theme.of(context).textTheme.titleMedium
                      ),
                      SizedBox(height: largeHeight(context)),
                      RichText(
                        textAlign: TextAlign.justify,
                        text: TextSpan(
                          style: Theme.of(context).textTheme.bodyMedium,
                          children: const <TextSpan>[
                            TextSpan(text: 'Souhaitant préparer sa participation à un concours d’éloquence, Marouan s’est entretenu au cours d’une conversation téléphonique avec le Maître de l’Éloquence, Bill François, qui lui a suggéré que la création d’une association consacrée à l’art oratoire serait une aventure enrichissante et instructive. C’est ainsi que Marouan a proposé à son ami Gaëtan, actuel vice-président de l’association de l’aider à mettre en place ce projet ambitieux.')
                          ]
                        )
                      ),
                      SizedBox(height: largeHeight(context)),
                      Text('Notre Parcours',
                        style: Theme.of(context).textTheme.titleMedium
                      ),
                      SizedBox(height: largeHeight(context)),
                      IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const VerticalDivider(
                              color: yellow,
                              thickness: 3,
                              width: 0,
                            ),
                            SizedBox(width: getWidth(context, 16)),
                            SizedBox(
                              width: objectWidth(context) - 30,
                              child: RichText(
                                textAlign: TextAlign.left,
                                text: TextSpan(
                                  style: Theme.of(context).textTheme.bodyMedium,
                                  children: const <TextSpan>[
                                    TextSpan(text: 'Septembre 2023',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: yellow3
                                      ),
                                    ),
                                    TextSpan(text: '\nPremières réflexions sur l\'association\n'
                                    ),
                                    TextSpan(text: '\nFévrier 2024',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: yellow3
                                      ),
                                    ),
                                    TextSpan(text: '\nDéclaration en préfecture\n'
                                    ),
                                    TextSpan(text: '\nSeptembre 2024',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: yellow3
                                      ),
                                    ),
                                    TextSpan(text: '\nLancement officiel\n'
                                    ),
                                    TextSpan(text: '\nNovembre 2024',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: yellow3
                                      ),
                                    ),
                                    TextSpan(text: '\nSignature du premier partenariat avec EVA\n'
                                    ),
                                    TextSpan(text: '\nFévrier 2025',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: yellow3
                                      ),
                                    ),
                                    TextSpan(text: '\nPremier anniversaire de l\'association\n'
                                    ),
                                    TextSpan(text: '\nMars 2025',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: yellow3
                                      ),
                                    ),
                                    TextSpan(text: '\nPremière participation d\'Eloquéncia en tant que présentatrice de concours d\'éloquence'
                                    ),
                                  ]
                                )
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: largeHeight(context)),
                      Text('Notre Logo',
                        style: Theme.of(context).textTheme.titleMedium
                      ),
                      SizedBox(height: mediumHeight(context)),
                      Text('La belle histoire du logo d\'Eloquéncia\n',
                        style: Theme.of(context).textTheme.headlineSmall,
                        textAlign: TextAlign.center,
                      ),
                      Image.asset(logo, width: getWidth(context, 100)),
                      SizedBox(height: largeHeight(context)),
                      const Text('Le logo d\'Eloquéncia a tout d\'abord été "Eloquéncia, première Edition" car le but premier était seulement d\'accompagner les élèves de collèges et lycées à un concours de fin d\'année. Cependant, le président a par la suite préféré que l\'association soit plus accessible et qu\'elle puisse proposer des activités plus diverses et concerner un plus large public.',
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(height: largeHeight(context)),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: getWidth(context, 35), vertical: getWidth(context, 35)),
                          color: yellow,
                          child: Column(
                            children: [
                              Text('Signification d\'Eloquéncia',
                                style: Theme.of(context).textTheme.headlineMedium,
                              ),
                              SizedBox(height: mediumHeight(context)),
                              RichText(
                                textAlign: TextAlign.justify,
                                text: TextSpan(
                                  style: Theme.of(context).textTheme.bodyMedium,
                                  children: const <TextSpan>[
                                    TextSpan(
                                      text: 'Le nom '
                                    ),
                                    TextSpan(
                                      text: 'Eloquéncia',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold
                                      )
                                    ),
                                    TextSpan(
                                      text: ' est inspiré du provençal dans le but de rendre hommage à notre culture locale que nous avons à cœur de préserver.'
                                    ),
                                  ]
                                )
                              ),
                            ],
                          )
                        ),
                      )
                    ],
                  ),
                ),          
              ],
            )
          ],
        ),
      )
    );
  }
}