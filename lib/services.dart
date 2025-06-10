import 'package:eloquencia/discount.dart';
import 'package:mailto/mailto.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:eloquencia/main.dart';
import 'package:flutter/material.dart';

class ServicesPage extends StatelessWidget {
  final Map<String, dynamic> userInfo;
  const ServicesPage({super.key, required this.userInfo});
  final pageID = 'Services';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarEloquencia(context, pageID, yellow, 0),
      endDrawer: endDrawerEloquencia(context, pageID, userInfo, yellow),
      body: ListView(
        children: [
          Center(
            child: SizedBox(
              width: objectWidth(context),
              child: Column(
                children: [
                  SizedBox(height: appBarHeight(context)),
                  Text('Nos services',
                    style: Theme.of(context).textTheme.titleMedium,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: mediumHeight(context)),
                  Text('Découvrez les valeurs, les engagements et les avantages de l\'association Eloquéncia.',
                    style: Theme.of(context).textTheme.headlineSmall,
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: mediumHeight(context)),
                  const Divider(
                    color: black,
                    thickness: 3,
                    height: 0,
                  ),
                  SizedBox(height: largeHeight(context)),
                  Text('Devenir adhérant',
                    style: Theme.of(context).textTheme.titleSmall,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: largeHeight(context)),
                  Text('Rejoignez l\'aventure Eloquéncia !',
                    style: Theme.of(context).textTheme.headlineSmall,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: mediumHeight(context)),
                  RichText(
                    textAlign: TextAlign.justify,
                    text: TextSpan(
                      style: Theme.of(context).textTheme.bodyMedium,
                      children: const <TextSpan>[
                        TextSpan(
                          text: 'Notre association propose régulièrement des ateliers à '
                        ),
                        TextSpan(
                          text: 'Berre l\'Étang',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: yellow3
                          )
                        ),
                        TextSpan(
                          text: ', ainsi que des '
                        ),
                        TextSpan(
                          text: 'ressources exclusives',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: yellow3
                          )
                        ),
                        TextSpan(
                          text: ' sur notre plateforme en ligne.'
                        ),
                      ]
                    ),
                  ),
                  SizedBox(height: mediumHeight(context)),
                  Text('En devenant adhérent, vous bénéficiez :',
                    style: Theme.of(context).textTheme.titleSmall,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: smallHeight(context)),
                  Text('✅ D\'un accès aux ateliers en présentiel\n✅ D\'un accompagnement personnalisé\n✅ D\'une plateforme d’apprentissage (cours, vidéos, exercices)\n✅ D\'une carte d’adhérent pour tarifs réduits événements*',
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: mediumHeight(context)),
                  Text('*Réductions valables uniquement pour les événements organisés par Eloquéncia.',
                    style: Theme.of(context).textTheme.labelLarge,
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: largeHeight(context)),
                  Container(
                    width: objectWidth(context) - 40,
                    decoration: BoxDecoration(
                      color: yellow2,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.all(getWidth(context, 11)),
                    child: Column(
                      children: [
                        RichText(
                          textAlign: TextAlign.justify,
                          text: TextSpan(
                            style: Theme.of(context).textTheme.bodyMedium,
                            children: const <TextSpan>[
                              TextSpan(
                                text: 'Étudiants',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                )
                              ),
                              TextSpan(
                                text: ' :\nBénéficiez automatiquement de '
                              ),
                              TextSpan(
                                text: '-50%',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                )
                              ),
                              TextSpan(
                                text: ' sur votre adhésion (10€/an)'
                              ),
                            ]
                          )
                        ),
                        SizedBox(height: smallHeight(context)),
                        ElevatedButton(
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
                              MaterialPageRoute(builder: (context) => DiscountPage(userInfo: userInfo))  
                            );
                          },
                          child: Text('Faire une demande de réduction',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: largeHeight(context)),
                  const Divider(
                    color: black,
                    thickness: 3,
                    height: 0,
                  ),
                  SizedBox(height: largeHeight(context)),
                  Text('Le Club Eloquéncia\n(13-20 ans)',
                    style: Theme.of(context).textTheme.titleSmall,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: largeHeight(context)),
                  RichText(
                    textAlign: TextAlign.justify,
                    text: TextSpan(
                      style: Theme.of(context).textTheme.bodyMedium,
                      children: const <TextSpan>[
                        TextSpan(
                          text: 'Un espace '
                        ),
                        TextSpan(
                          text: 'réservé aux jeunes',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: yellow3
                          )
                        ),
                        TextSpan(
                          text: ' pour apprendre à s\'exprimer avec confiance.'
                        ),
                      ]
                    ),
                  ),
                  SizedBox(height: mediumHeight(context)),
                  Text('Grâce à ce club, vous aurez l\'occasion de :',
                    style: Theme.of(context).textTheme.titleSmall,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: smallHeight(context)),
                  Text('✅ Vaincre la timidité\n✅ Participer à des concours régionaux\n✅ Créer des liens avec d’autres jeunes\n✅ Disposer d\'un accompagnement à l’oral',
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: mediumHeight(context)),
                  RichText(
                    textAlign: TextAlign.justify,
                    text: TextSpan(
                      style: Theme.of(context).textTheme.bodyMedium,
                      children: const <TextSpan>[
                        TextSpan(
                          text: 'Comment rejoindre le club ?',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: yellow3
                          )
                        ),
                        TextSpan(
                          text: '\nIl suffit d\'être adhérent et de faire une demande via votre espace personnel.'
                        ),
                      ]
                    ),
                  ),
                  SizedBox(height: largeHeight(context)),
                  const Divider(
                    color: black,
                    thickness: 3,
                    height: 0,
                  ),
                  SizedBox(height: largeHeight(context)),
                  Text('Formations professionnelles',
                    style: Theme.of(context).textTheme.titleSmall,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: largeHeight(context)),
                  RichText(
                    textAlign: TextAlign.justify,
                    text: TextSpan(
                      style: Theme.of(context).textTheme.bodyMedium,
                      children: const <TextSpan>[
                        TextSpan(
                          text: 'Pour '
                        ),
                        TextSpan(
                          text: 'entreprises ou collectivités',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: yellow3
                          )
                        ),
                        TextSpan(
                          text: ' : formations sur-mesure autour de la prise de parole.'
                        ),
                      ]
                    ),
                  ),
                  SizedBox(height: mediumHeight(context)),
                  Text('Thématiques proposées :',
                    style: Theme.of(context).textTheme.titleSmall,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: smallHeight(context)),
                  Text('✅ Gérer son stress en entreprise\n✅ Améliorer son aisance face aux clients\n✅ Améliorer son élocution, articulation et clarté',
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: mediumHeight(context)),
                  Text('Formations sur devis : ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: yellow3
                    )
                  ),
                  Linkify(
                    onOpen: (link) async {
                      // if (!await launchUrl(Mailto(to: ['contact@eloquencia.org'], subject: 'mailto example subject', body: 'mailto example body'))) {
                      //   throw Exception('Could not launch ${Mailto(to: ['contact@eloquencia.org'], subject: 'mailto example subject', body: 'mailto example body')}');
                      // }
                    },
                    text: "contact@eloquencia.org",
                  ),
                  SizedBox(height: smallHeight(context)),
                  Text('Tous les fonds sont réinvestis dans nos actions (association à but non lucratif).',
                    style: Theme.of(context).textTheme.labelLarge,
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: largeHeight(context)),
                  const Divider(
                    color: black,
                    thickness: 3,
                    height: 0,
                  ),
                  SizedBox(height: largeHeight(context)),
                  Text('Présentateur pour vos événements',
                    style: Theme.of(context).textTheme.titleSmall,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: largeHeight(context)),
                  RichText(
                    textAlign: TextAlign.justify,
                    text: TextSpan(
                      style: Theme.of(context).textTheme.bodyMedium,
                      children: const <TextSpan>[
                        TextSpan(
                          text: 'Vous organisez un concours, une remise de prix ou une cérémonie ?',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: yellow3
                          )
                        ),
                        TextSpan(
                          text: ' Nous avons le présentateur qu\'il vous faut !\nSpécialisé en ',
                        ),
                        TextSpan(
                          text: 'arts oratoires',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: yellow3
                          )
                        ),
                        TextSpan(
                          text: ', il saura captiver votre public et dynamiser votre événement.',
                        ),
                      ]
                    ),
                  ),
                  SizedBox(height: mediumHeight(context)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Contact : ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: yellow3
                        )
                      ),
                      // LinkifyText('contact@eloquencia.org',  //TODO utiliser mailto pour envoyer sur appli de mail
                      //   linkTypes: [LinkType.url],
                      //   linkStyle: TextStyle(
                      //     color: Colors.green
                      //   ),
                      //   textStyle: Theme.of(context).textTheme.bodyMedium,
                      //   onTap: (link) {
                      //     Mailto(
                      //       to: ['contact@eloquencia.org'],
                      //       subject: 'mailto example subject',
                      //       body: 'mailto example body',
                      //     );
                      //   },
                      // ),
                    ],
                  ),
                  SizedBox(height: largeHeight(context)),
                ]
              ),
            ),
          ),
        ]
      ),
    );
  }
}

// class JoinPage extends StatelessWidget {
//   const JoinPage({super.key});
//   final pageID = 'Rejoindre';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: appBarEloquencia(context, pageID, yellow, 0),
//       endDrawer: endDrawerEloquencia(context, pageID, widget.userInfo, yellow),
//       body: ListView(
//         children: [
//           Center(
//             child: SizedBox(
//               width: objectWidth(context),
//               child: Column(
//                 children: [
//                   SizedBox(height: appBarHeight(context)),
//                   Text('Pourquoi nous rejoindre ?',
//                     style: Theme.of(context).textTheme.titleMedium,
//                     textAlign: TextAlign.center,
//                   ),
//                   SizedBox(height: mediumHeight(context)),
//                   Text('Découvrez les valeurs, les engagements et les avantages de l\'association Eloquéncia.',
//                     style: Theme.of(context).textTheme.headlineSmall,
//                     textAlign: TextAlign.justify,
//                   ),
//                   SizedBox(height: mediumHeight(context)),
//                   const Divider(
//                     color: black,
//                     thickness: 3,
//                     height: 0,
//                   ),
//                   SizedBox(height: mediumHeight(context)),
//                   Text('Une équipe de bénévoles passionnés',
//                     style: Theme.of(context).textTheme.titleSmall,
//                     textAlign: TextAlign.center,
//                   ),
//                   SizedBox(height: mediumHeight(context)),
//                   Image.asset('assets/images/recrutement_1.png',
//                   width: objectWidth(context) - 50,
//                   ),
//                   SizedBox(height: largeHeight(context)),
//                   RichText(
//                     textAlign: TextAlign.justify,
//                     text: TextSpan(
//                       style: Theme.of(context).textTheme.bodyMedium,
//                       children: const <TextSpan>[
//                         TextSpan(
//                           text: 'Eloquéncia',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: yellow3
//                           )
//                         ),
//                         TextSpan(
//                           text: ', fondée par Marouan JLASSI, un lycéen passionné, est bien plus qu\'une simple association. C\'est un '
//                         ),
//                         TextSpan(
//                           text: 'projet dynamique',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: yellow3
//                           )
//                         ),
//                         TextSpan(
//                           text: ' et '
//                         ),
//                         TextSpan(
//                           text: 'social',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: yellow3
//                           )
//                         ),
//                         TextSpan(
//                           text: ' ouvert à toutes les personnes motivées, quels que soient leurs parcours. En nous rejoignant, vous aurez l\'opportunité d\''
//                         ),
//                         TextSpan(
//                           text: 'enrichir vos compétences',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: yellow3
//                           )
//                         ),
//                         TextSpan(
//                           text: ' dans des domaines variés : '
//                         ),
//                         TextSpan(
//                           text: 'maîtrise',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: yellow3
//                           )
//                         ),
//                         TextSpan(
//                           text: ' de la '
//                         ),
//                         TextSpan(
//                           text: 'prise de parole',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: yellow3
//                           )
//                         ),
//                         TextSpan(
//                           text: ' en public, '
//                         ),
//                         TextSpan(
//                           text: 'développement',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: yellow3
//                           )
//                         ),
//                         TextSpan(
//                           text: ' de vos '
//                         ),
//                         TextSpan(
//                           text: 'aptitudes sociales',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: yellow3
//                           )
//                         ),
//                         TextSpan(
//                           text: ', '
//                         ),
//                         TextSpan(
//                           text: 'approfondissement',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: yellow3
//                           )
//                         ),
//                         TextSpan(
//                           text: ' de vos '
//                         ),
//                         TextSpan(
//                           text: 'connaissances',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: yellow3
//                           )
//                         ),
//                         TextSpan(
//                           text: ' dans le domaine qui vous '
//                         ),
//                         TextSpan(
//                           text: 'passionne',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: yellow3
//                           )
//                         ),
//                         TextSpan(
//                           text: ', et bien plus encore. Vous participerez à un projet '
//                         ),
//                         TextSpan(
//                           text: 'ambitieux',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: yellow3
//                           )
//                         ),
//                         TextSpan(
//                           text: ', porteur de '
//                         ),
//                         TextSpan(
//                           text: 'sens',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: yellow3
//                           )
//                         ),
//                         TextSpan(
//                           text: ' et rempli de '
//                         ),
//                         TextSpan(
//                           text: 'défis',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: yellow3
//                           )
//                         ),
//                         TextSpan(
//                           text: ' ! Venez vivre une aventure humaine unique, tissez des liens forts et devenez un acteur actif de la vie associative !'
//                         )
//                       ]
//                     ),
//                   ),
//                   SizedBox(height: largeHeight(context)),
//                   const Divider(
//                     color: black,
//                     thickness: 3,
//                     height: 0,
//                   ),
//                   SizedBox(height: mediumHeight(context)),
//                   Text('Les avantages du monde associatif',
//                     style: Theme.of(context).textTheme.titleSmall,
//                     textAlign: TextAlign.center,
//                   ),
//                   SizedBox(height: mediumHeight(context)),
//                   Image.asset('assets/images/recrutement_2.png',
//                   width: objectWidth(context) - 50,
//                   ),
//                   SizedBox(height: largeHeight(context)),
//                   RichText(
//                     textAlign: TextAlign.justify,
//                     text: TextSpan(
//                       style: Theme.of(context).textTheme.bodyMedium,
//                       children: const <TextSpan>[
//                         TextSpan(
//                           text: 'Rejoindre notre association, c\'est l\'opportunité d\''
//                         ),
//                         TextSpan(
//                           text: 'acquérir',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: yellow3
//                           )
//                         ),
//                         TextSpan(
//                           text: ' des compétences '
//                         ),
//                         TextSpan(
//                           text: 'pratiques',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: yellow3
//                           )
//                         ),
//                         TextSpan(
//                           text: ' et '
//                         ),
//                         TextSpan(
//                           text: 'valorisées',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: yellow3
//                           )
//                         ),
//                         TextSpan(
//                           text: ', d\''
//                         ),
//                         TextSpan(
//                           text: 'élargir',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: yellow3
//                           )
//                         ),
//                         TextSpan(
//                           text: ' ton '
//                         ),
//                         TextSpan(
//                           text: 'réseau',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: yellow3
//                           )
//                         ),
//                         TextSpan(
//                           text: ', et de t\''
//                         ),
//                         TextSpan(
//                           text: 'épanouir personnellement',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: yellow3
//                           )
//                         ),
//                         TextSpan(
//                           text: ' en t\'engageant pour des '
//                         ),
//                         TextSpan(
//                           text: 'causes importantes',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: yellow3
//                           )
//                         ),
//                         TextSpan(
//                           text: '. C\'est une expérience '
//                         ),
//                         TextSpan(
//                           text: 'enrichissante',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: yellow3
//                           )
//                         ),
//                         TextSpan(
//                           text: ' qui te permet non seulement de te '
//                         ),
//                         TextSpan(
//                           text: 'préparer',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: yellow3
//                           )
//                         ),
//                         TextSpan(
//                           text: ' pour ton '
//                         ),
//                         TextSpan(
//                           text: 'avenir professionnel',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: yellow3
//                           )
//                         ),
//                         TextSpan(
//                           text: ', mais aussi de '
//                         ),
//                         TextSpan(
//                           text: 'contribuer positivement',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: yellow3
//                           )
//                         ),
//                         TextSpan(
//                           text: ' à la société. En plus, cela te donnera l\'occasion de faire des '
//                         ),
//                         TextSpan(
//                           text: 'rencontres',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: yellow3
//                           )
//                         ),
//                         TextSpan(
//                           text: ', de développer ta '
//                         ),
//                         TextSpan(
//                           text: 'conscience sociale',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: yellow3
//                           )
//                         ),
//                         TextSpan(
//                           text: ', et de vivre des expériences '
//                         ),
//                         TextSpan(
//                           text: 'concrètes',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: yellow3
//                           )
//                         ),
//                         TextSpan(
//                           text: ' que tu pourras '
//                         ),
//                         TextSpan(
//                           text: 'valoriser',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: yellow3
//                           )
//                         ),
//                         TextSpan(
//                           text: ' dans ton parcours. Alors, pourquoi ne pas faire le premier pas et nous rejoindre ?',
//                         ),
//                       ]
//                     ),
//                   ),
//                   SizedBox(height: largeHeight(context)),
//                   const Divider(
//                     color: black,
//                     thickness: 3,
//                     height: 0,
//                   ),
//                   SizedBox(height: mediumHeight(context)),
//                   Text('Nous avons besoin de vous !',
//                     style: Theme.of(context).textTheme.titleSmall,
//                     textAlign: TextAlign.center,
//                   ),
//                   SizedBox(height: mediumHeight(context)),
//                   Image.asset('assets/images/recrutement_3.png',
//                   width: objectWidth(context) - 50,
//                   ),
//                   SizedBox(height: largeHeight(context)),
//                   RichText(
//                     textAlign: TextAlign.justify,
//                     text: TextSpan(
//                       style: Theme.of(context).textTheme.bodyMedium,
//                       children: const <TextSpan>[
//                         TextSpan(
//                           text: 'Nous recherchons des personnes de '
//                         ),
//                         TextSpan(
//                           text: 'tout horizon',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: yellow3
//                           )
//                         ),
//                         TextSpan(
//                           text: ' pour former une équipe '
//                         ),
//                         TextSpan(
//                           text: 'dynamique',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: yellow3
//                           )
//                         ),
//                         TextSpan(
//                           text: ', composée de jeunes et d\'adultes '
//                         ),
//                         TextSpan(
//                           text: 'motivés',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: yellow3
//                           )
//                         ),
//                         TextSpan(
//                           text: ', afin de rendre notre association encore plus '
//                         ),
//                         TextSpan(
//                           text: 'active',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: yellow3
//                           )
//                         ),
//                         TextSpan(
//                           text: '. Plusieurs '
//                         ),
//                         TextSpan(
//                           text: 'missions',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: yellow3
//                           )
//                         ),
//                         TextSpan(
//                           text: ' sont disponibles, et seront '
//                         ),
//                         TextSpan(
//                           text: 'proposées',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: yellow3
//                           )
//                         ),
//                         TextSpan(
//                           text: ' en fonction de vos '
//                         ),
//                         TextSpan(
//                           text: 'compétences',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: yellow3
//                           )
//                         ),
//                         TextSpan(
//                           text: ' et de vos '
//                         ),
//                         TextSpan(
//                           text: 'intérêts',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: yellow3
//                           )
//                         ),
//                         TextSpan(
//                           text: '. Vous pourrez '
//                         ),
//                         TextSpan(
//                           text: 'adapter',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: yellow3
//                           )
//                         ),
//                         TextSpan(
//                           text: ' votre engagement selon vos '
//                         ),
//                         TextSpan(
//                           text: 'disponibilités',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: yellow3
//                           )
//                         ),
//                         TextSpan(
//                           text: ', que ce soit pour un '
//                         ),
//                         TextSpan(
//                           text: 'soutien régulier',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: yellow3
//                           )
//                         ),
//                         TextSpan(
//                           text: ' à mi-temps ou une '
//                         ),
//                         TextSpan(
//                           text: 'aide ponctuelle',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: yellow3
//                           )
//                         ),
//                         TextSpan(
//                           text: '. Chaque contribution est '
//                         ),
//                         TextSpan(
//                           text: 'précieuse',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: yellow3
//                           )
//                         ),
//                         TextSpan(
//                           text: ' et nous avons besoin de toutes les '
//                         ),
//                         TextSpan(
//                           text: 'bonnes volontés',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: yellow3
//                           )
//                         ),
//                         TextSpan(
//                           text: ' !'
//                         )
//                       ]
//                     ),
//                   ),
//                   SizedBox(height: largeHeight(context)),
//                 ]
//               ),
//             ),
//           ),
//         ]
//       ),
//     );
//   }
// }