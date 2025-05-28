import 'package:eloquencia/main.dart';
import 'package:flutter/material.dart';

class JoinPage extends StatelessWidget {
  const JoinPage({super.key});
  final pageID = 'Rejoindre';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarEloquencia(context, pageID, 0),
      endDrawer: endDrawerEloquencia(context, pageID),
      body: ListView(
        children: [
          Center(
            child: SizedBox(
              width: objectWidth(context),
              child: Column(
                children: [
                  SizedBox(height: appBarHeight(context)),
                  Text('Pourquoi nous rejoindre ?',
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
                  SizedBox(height: mediumHeight(context)),
                  Text('Une équipe de bénévoles passionnés',
                    style: Theme.of(context).textTheme.titleSmall,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: mediumHeight(context)),
                  Image.asset('assets/images/recrutement_1.png',
                  width: objectWidth(context) - 50,
                  ),
                  SizedBox(height: largeHeight(context)),
                  RichText(
                    textAlign: TextAlign.justify,
                    text: TextSpan(
                      style: Theme.of(context).textTheme.bodyMedium,
                      children: const <TextSpan>[
                        TextSpan(
                          text: 'Eloquéncia',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: yellow3
                          )
                        ),
                        TextSpan(
                          text: ', fondée par Marouan JLASSI, un lycéen passionné, est bien plus qu\'une simple association. C\'est un '
                        ),
                        TextSpan(
                          text: 'projet dynamique',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: yellow3
                          )
                        ),
                        TextSpan(
                          text: ' et '
                        ),
                        TextSpan(
                          text: 'social',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: yellow3
                          )
                        ),
                        TextSpan(
                          text: ' ouvert à toutes les personnes motivées, quels que soient leurs parcours. En nous rejoignant, vous aurez l\'opportunité d\''
                        ),
                        TextSpan(
                          text: 'enrichir vos compétences',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: yellow3
                          )
                        ),
                        TextSpan(
                          text: ' dans des domaines variés : '
                        ),
                        TextSpan(
                          text: 'maîtrise',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: yellow3
                          )
                        ),
                        TextSpan(
                          text: ' de la '
                        ),
                        TextSpan(
                          text: 'prise de parole',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: yellow3
                          )
                        ),
                        TextSpan(
                          text: ' en public, '
                        ),
                        TextSpan(
                          text: 'développement',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: yellow3
                          )
                        ),
                        TextSpan(
                          text: ' de vos '
                        ),
                        TextSpan(
                          text: 'aptitudes sociales',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: yellow3
                          )
                        ),
                        TextSpan(
                          text: ', '
                        ),
                        TextSpan(
                          text: 'approfondissement',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: yellow3
                          )
                        ),
                        TextSpan(
                          text: ' de vos '
                        ),
                        TextSpan(
                          text: 'connaissances',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: yellow3
                          )
                        ),
                        TextSpan(
                          text: ' dans le domaine qui vous '
                        ),
                        TextSpan(
                          text: 'passionne',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: yellow3
                          )
                        ),
                        TextSpan(
                          text: ', et bien plus encore. Vous participerez à un projet '
                        ),
                        TextSpan(
                          text: 'ambitieux',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: yellow3
                          )
                        ),
                        TextSpan(
                          text: ', porteur de '
                        ),
                        TextSpan(
                          text: 'sens',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: yellow3
                          )
                        ),
                        TextSpan(
                          text: ' et rempli de '
                        ),
                        TextSpan(
                          text: 'défis',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: yellow3
                          )
                        ),
                        TextSpan(
                          text: ' ! Venez vivre une aventure humaine unique, tissez des liens forts et devenez un acteur actif de la vie associative !'
                        )
                      ]
                    ),
                  ),
                  SizedBox(height: largeHeight(context)),
                  const Divider(
                    color: black,
                    thickness: 3,
                    height: 0,
                  ),
                  SizedBox(height: mediumHeight(context)),
                  Text('Les avantages du monde associatif',
                    style: Theme.of(context).textTheme.titleSmall,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: mediumHeight(context)),
                  Image.asset('assets/images/recrutement_2.png',
                  width: objectWidth(context) - 50,
                  ),
                  SizedBox(height: largeHeight(context)),
                  RichText(
                    textAlign: TextAlign.justify,
                    text: TextSpan(
                      style: Theme.of(context).textTheme.bodyMedium,
                      children: const <TextSpan>[
                        TextSpan(
                          text: 'Rejoindre notre association, c\'est l\'opportunité d\''
                        ),
                        TextSpan(
                          text: 'acquérir',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: yellow3
                          )
                        ),
                        TextSpan(
                          text: ' des compétences '
                        ),
                        TextSpan(
                          text: 'pratiques',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: yellow3
                          )
                        ),
                        TextSpan(
                          text: ' et '
                        ),
                        TextSpan(
                          text: 'valorisées',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: yellow3
                          )
                        ),
                        TextSpan(
                          text: ', d\''
                        ),
                        TextSpan(
                          text: 'élargir',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: yellow3
                          )
                        ),
                        TextSpan(
                          text: ' ton '
                        ),
                        TextSpan(
                          text: 'réseau',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: yellow3
                          )
                        ),
                        TextSpan(
                          text: ', et de t\''
                        ),
                        TextSpan(
                          text: 'épanouir personnellement',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: yellow3
                          )
                        ),
                        TextSpan(
                          text: ' en t\'engageant pour des '
                        ),
                        TextSpan(
                          text: 'causes importantes',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: yellow3
                          )
                        ),
                        TextSpan(
                          text: '. C\'est une expérience '
                        ),
                        TextSpan(
                          text: 'enrichissante',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: yellow3
                          )
                        ),
                        TextSpan(
                          text: ' qui te permet non seulement de te '
                        ),
                        TextSpan(
                          text: 'préparer',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: yellow3
                          )
                        ),
                        TextSpan(
                          text: ' pour ton '
                        ),
                        TextSpan(
                          text: 'avenir professionnel',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: yellow3
                          )
                        ),
                        TextSpan(
                          text: ', mais aussi de '
                        ),
                        TextSpan(
                          text: 'contribuer positivement',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: yellow3
                          )
                        ),
                        TextSpan(
                          text: ' à la société. En plus, cela te donnera l\'occasion de faire des '
                        ),
                        TextSpan(
                          text: 'rencontres',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: yellow3
                          )
                        ),
                        TextSpan(
                          text: ', de développer ta '
                        ),
                        TextSpan(
                          text: 'conscience sociale',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: yellow3
                          )
                        ),
                        TextSpan(
                          text: ', et de vivre des expériences '
                        ),
                        TextSpan(
                          text: 'concrètes',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: yellow3
                          )
                        ),
                        TextSpan(
                          text: ' que tu pourras '
                        ),
                        TextSpan(
                          text: 'valoriser',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: yellow3
                          )
                        ),
                        TextSpan(
                          text: ' dans ton parcours. Alors, pourquoi ne pas faire le premier pas et nous rejoindre ?',
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
                  SizedBox(height: mediumHeight(context)),
                  Text('Nous avons besoin de vous !',
                    style: Theme.of(context).textTheme.titleSmall,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: mediumHeight(context)),
                  Image.asset('assets/images/recrutement_3.png',
                  width: objectWidth(context) - 50,
                  ),
                  SizedBox(height: largeHeight(context)),
                  RichText(
                    textAlign: TextAlign.justify,
                    text: TextSpan(
                      style: Theme.of(context).textTheme.bodyMedium,
                      children: const <TextSpan>[
                        TextSpan(
                          text: 'Nous recherchons des personnes de '
                        ),
                        TextSpan(
                          text: 'tout horizon',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: yellow3
                          )
                        ),
                        TextSpan(
                          text: ' pour former une équipe '
                        ),
                        TextSpan(
                          text: 'dynamique',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: yellow3
                          )
                        ),
                        TextSpan(
                          text: ', composée de jeunes et d\'adultes '
                        ),
                        TextSpan(
                          text: 'motivés',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: yellow3
                          )
                        ),
                        TextSpan(
                          text: ', afin de rendre notre association encore plus '
                        ),
                        TextSpan(
                          text: 'active',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: yellow3
                          )
                        ),
                        TextSpan(
                          text: '. Plusieurs '
                        ),
                        TextSpan(
                          text: 'missions',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: yellow3
                          )
                        ),
                        TextSpan(
                          text: ' sont disponibles, et seront '
                        ),
                        TextSpan(
                          text: 'proposées',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: yellow3
                          )
                        ),
                        TextSpan(
                          text: ' en fonction de vos '
                        ),
                        TextSpan(
                          text: 'compétences',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: yellow3
                          )
                        ),
                        TextSpan(
                          text: ' et de vos '
                        ),
                        TextSpan(
                          text: 'intérêts',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: yellow3
                          )
                        ),
                        TextSpan(
                          text: '. Vous pourrez '
                        ),
                        TextSpan(
                          text: 'adapter',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: yellow3
                          )
                        ),
                        TextSpan(
                          text: ' votre engagement selon vos '
                        ),
                        TextSpan(
                          text: 'disponibilités',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: yellow3
                          )
                        ),
                        TextSpan(
                          text: ', que ce soit pour un '
                        ),
                        TextSpan(
                          text: 'soutien régulier',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: yellow3
                          )
                        ),
                        TextSpan(
                          text: ' à mi-temps ou une '
                        ),
                        TextSpan(
                          text: 'aide ponctuelle',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: yellow3
                          )
                        ),
                        TextSpan(
                          text: '. Chaque contribution est '
                        ),
                        TextSpan(
                          text: 'précieuse',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: yellow3
                          )
                        ),
                        TextSpan(
                          text: ' et nous avons besoin de toutes les '
                        ),
                        TextSpan(
                          text: 'bonnes volontés',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: yellow3
                          )
                        ),
                        TextSpan(
                          text: ' !'
                        )
                      ]
                    ),
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