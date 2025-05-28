//import 'dart:nativewrappers/_internal/vm/lib/internal_patch.dart';
// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';
import 'package:bcrypt/bcrypt.dart';
import 'package:eloquencia/about.dart';
import 'package:eloquencia/article.dart';
import 'package:eloquencia/blog.dart';
import 'package:eloquencia/contact.dart';
import 'package:eloquencia/home.dart';
import 'package:eloquencia/join.dart';
import 'package:eloquencia/login.dart';
import 'package:eloquencia/partners.dart';
import 'package:eloquencia/discount.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html_iframe/flutter_html_iframe.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

// Variables globales

// Sécurité
final storage = FlutterSecureStorage();

// Constantes globales

// Constantes pour les images
const String logo = 'assets/images/eloquencia_round.png';  // Logo d'Eloquéncia

// Constantes pour la connexion Internet
const String helloassoUrl = 'https://www.helloasso.com/associations/eloquencia/adhesions/adhesion';  // URL de HelloAsso
bool connectionStatus = false;  // Statut de la connexion à Internet

// Constantes pour les couleurs
const Color yellow = Color(0xFFFFC107);  // Couleur principale de l'application
const Color yellow2 = Color.fromARGB(255, 255, 227, 44);  // Couleur secondaire de l'application
const Color yellow3 = Color(0xFFD9A407);  // Couleur tertiaire de l'application
const Color black = Colors.black;  // Couleur noire
const Color white = Color(0xFFF1EBF2);  // Couleur blanche

// Fonctions globales

// Fonctions pour les dimensions de l'application
getWidth(context, [double width = 0]) {  // Fonction pour obtenir la largeur voulue par rapport à la largeur de l'écran
  if (width != 0) {  // Si la largeur est spécifiée
    double modifier = 411.42857142857144/width;  // Calcule le modificateur en divisant la largeur de l'écran de test par la largeur voulue
    double displayWidth = MediaQuery.sizeOf(context).width;  //initialise la largeur de l'écran
    
    print(displayWidth);  // Affiche la largeur de l'écran
    return displayWidth/modifier;  // Calcule la largeur voulue par rapport à la largeur de l'écran actuel

  } else {  // Sinon la largeur est de 0
    return 0.0;
  }
}

getHeight(context, [double height = 0]) {  // Fonction pour obtenir la hauteur voulue par rapport à la hauteur de l'écran
  if (height != 0) {  // Si la hauteur est spécifiée
    double modifier = 891.4285714285714/height;  // Calcule le modificateur en divisant la hauteur de l'écran de test par la hauteur voulue
    double displayHeight = MediaQuery.sizeOf(context).height;  //initialise la hauteur de l'écran

    print(displayHeight);  // Affiche la hauteur de l'écran
    return displayHeight/modifier;  // Calcule la hauteur voulue par rapport à la hauteur de l'écran actuel

  } else {  // Sinon la hauteur est de 0
    return 0.0;
  }
}

appBarHeight(context) {  // Hauteur de la barre de navigation
  return getHeight(context, 60);  // Hauteur de 60 pixels
}

objectWidth(context) {  // Largeur des objets
  return getWidth(context, 350);  // Largeur de 350 pixels
}

largeHeight(context) {
  return getHeight(context, 30);  // Hauteur de 30 pixels
}

mediumHeight(context) {
  return getHeight(context, 20);  // Hauteur de 20 pixels
}

smallHeight(context) {
  return getHeight(context, 10);  // Hauteur de 10 pixels
}

largeWidth(context) {
  return getWidth(context, 350);  // Largeur de 350 pixels
}

mediumWidth(context) {
  return getWidth(context, 350);  // Largeur de 350 pixels
}

smallWidth(context) {
  return getWidth(context, 350);  // Largeur de 350 pixels
}

buttonWidth(context) {  // Largeur des boutons normaux
  return getWidth(context, 150);  // Largeur de 150 pixels
}

buttonHeight(context)  {  // Hauteur des boutons normaux
  return getWidth(context, 40);  // Hauteur de 40 pixels
}

// Fonctions pour les éléments de l'application

appBarEloquencia(BuildContext context, pageID, [double space = 16.0]) {  // Fonction pour créer la barre de navigation en haut de l'application
  return AppBar(
    backgroundColor: yellow,
    title: logoEloquencia(context, pageID, 22, ' - $pageID'),  // Logo et titre de l'application
    titleSpacing: getWidth(context, space),  // Espace entre le logo et le bord gauche de l'écran
  );
}

drawerHeaderEloquencia(BuildContext context, pageID) {  // Fonction pour créer l'en-tête du menu de navigation
  return DrawerHeader(  // En-tête du menu de navigation
    decoration: const BoxDecoration(color: yellow),  // Couleur du bouton
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,  // Alignement du logo le plus à gauche possible
      children: [
        logoEloquencia(context, pageID, 30)  // Logo de l'application à la taille 30
      ],
    ),
  );
}

logoEloquencia(BuildContext context, pageID, double fontSize, [String suffix = '']) {  // Fonction pour créer le logo de l'application
  return GestureDetector(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,  // Alignement du logo le plus à gauche possible
      children: [
        Image.asset(logo,  // Logo de l'application à la largeur de la taille de la police multipliée par 2
          width: fontSize * 2
        ),
        const SizedBox(width: 10),
        Text('Eloquéncia',  // Nom de l'application dont la taille de police est choisie en paramètre
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold
          ),
        ),
        Text(suffix,  // Nom de la page actuelle dont la taille de police est celle choisie en paramètre multipliée par 0.85
          style: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: fontSize*0.85
          ),
        )
      ],
    ),
    onTap: () {  // Au touché du logo
      if (pageID == 'Accueil') {  // Si je suis sur la page d'accueil rien ne se passe
      }
      else {
        while (Navigator.canPop(context)) {  // Si je ne suis pas sur la page d'accueil, je retourne à la page d'accueil
          Navigator.pop(context);  // Ferme le menu de navigation
        }
      }
    },
  );
}

copyrightEloquencia(BuildContext context) {  // Fonction pour créer le texte de copyright
  return SizedBox(
    child: Text('©Eloquéncia 2024-2025 |\nFait avec 💙 et hébergé à Marseille',  // Texte de copyright
      style: Theme.of(context).textTheme.labelMedium,
      textAlign: TextAlign.center,
    ),
  );
}

drawerBehavior(context, pageID, buttonID) {  // Fonction pour gérer le comportement du menu de navigation
  /*Est-ce que le nom du bouton est le même que l'ID de la page sur laquelle je suis
  si oui, Navigator.pop(context)
  si non, Navigator.push(context, MaterialPageRoute(builder: (context) => const lapage)*/

  if (pageID == buttonID) {  // Si le nom du bouton est le même que l'ID de la page sur laquelle je suis
    Navigator.pop(context);  // Le menu se ferme
  }
  else {  // Sinon je vais sur la page correspondante
    if (buttonID == 'Rejoindre') {
      Navigator.pop(context);  // Ferme le menu de navigation
      Navigator.push(context, MaterialPageRoute(builder: (context) => const JoinPage()));
    }
    else if (buttonID == 'Blog') {
      Navigator.pop(context);  // Ferme le menu de navigation
      Navigator.push(context, MaterialPageRoute(builder: (context) => const BlogPage()));
    }
    else if (buttonID == 'Partenaires') {
      Navigator.pop(context);  // Ferme le menu de navigation
      Navigator.push(context, MaterialPageRoute(builder: (context) => const PartnersPage()));
    }
    else if (buttonID == 'Réductions') {
      Navigator.pop(context);  // Ferme le menu de navigation
      Navigator.push(context, MaterialPageRoute(builder: (context) => const DiscountPage()));
    }
    else if (buttonID == 'Contact') {
      Navigator.pop(context);  // Ferme le menu de navigation
      Navigator.push(context, MaterialPageRoute(builder: (context) => const ContactPage()));
    }
    else if (buttonID == 'À propos') {
      Navigator.pop(context);  // Ferme le menu de navigation
      Navigator.push(context, MaterialPageRoute(builder: (context) => const AboutPage()));
    }
    else if (buttonID == 'Connexion') {
      Navigator.pop(context);  // Ferme le menu de navigation
      Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
    }
  }
}

endDrawerEloquencia(BuildContext context, pageID) {  // Fonction pour créer le menu de navigation à droite
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        drawerHeaderEloquencia(context, pageID),  // En-tête du menu de navigation
        ListTile(  // Bouton Rejoindre
          title: Text('Rejoindre',
            style: Theme.of(context).textTheme.bodyMedium),
          onTap: () {
            drawerBehavior(context, pageID, 'Rejoindre');
          },
        ),
        ListTile(  // Bouton Blog
          title: Text('Blog',
            style: Theme.of(context).textTheme.bodyMedium),
          onTap: () {
            drawerBehavior(context, pageID, 'Blog');
          },
        ),
        ListTile(  // Bouton Partenaires
          title: Text('Partenaires',
            style: Theme.of(context).textTheme.bodyMedium),
          onTap: () {
            drawerBehavior(context, pageID, 'Partenaires');
          },
        ),
        ListTile(  // Bouton Réductions
          title: Text('Réductions',
            style: Theme.of(context).textTheme.bodyMedium),
          onTap: () {
            drawerBehavior(context, pageID, 'Réductions');
          },
        ),
        ListTile(  // Bouton Contact
          title: Text('Contact',
            style: Theme.of(context).textTheme.bodyMedium),
          onTap: () {
            drawerBehavior(context, pageID, 'Contact');
          },
        ),
        ListTile(  // Bouton À propos
          title: Text('À propos',
            style: Theme.of(context).textTheme.bodyMedium),
          onTap: () {
            drawerBehavior(context, pageID, 'À propos');
          },
        ),
        ListTile(  // Bouton Connexion
          title: Text('Connexion',  // TODO changer position du bouton juste en dessous du logo et l'afficher seulement si pas connecté
            style: Theme.of(context).textTheme.bodyMedium), 
          onTap: () {
            drawerBehavior(context, pageID, 'Connexion');
          },
        ),
        copyrightEloquencia(context)  // Copyright
      ],
    ),
  );
}

Future<bool> checkConnection() async {  //TODO : custom "connexion perdue" page
  try {
    final result = await InternetAddress.lookup(helloassoUrl);  // Vérifier la connexion à Internet
    print('Résultat : $result');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  } on SocketException catch (_) {
    return false;
  }
}

Future apiLogin(context, email, password) async {
  final apiLogin = await http.post(
    Uri.parse('https://dev.eloquencia.org/api/login'),
    body: {
      'username': email,
      'password': BCrypt.hashpw(password, BCrypt.gensalt())
    }
  );
  if (apiLogin.statusCode != 200) {
    print('Failed to retrieve the http package!');
  }
  if (apiLogin.body.isEmpty) {
    throw Exception('Aucune information reçue');
  }
  print(apiLogin.body);
  var login = jsonDecode(apiLogin.body) as Map<String, dynamic>;
  print(login['success']);
  if (login['success'] == false) {
    return Text(login['message'],
      style: TextStyle(
        color: Colors.red,
        fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize
      ),
      textAlign: TextAlign.center,
    );
  } else if (login['success'] == true) {
    return Text(login['message'],
      style: TextStyle(
        color: Colors.green,
        fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize
      ),
      textAlign: TextAlign.center,
    );
  } else {
    return Text('Erreur inconnue',
      style: TextStyle(
        color: Colors.red,
        fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize
      ),
    );
  }
}

class BlogInfo {  // Classe pour stocker les informations du blog
  final int id;  // Identifiant du blog
  final String title;  // Titre du blog
  final String content;  // Contenu du blog
  final String? pic;  // Image du blog
  final String? publishdate;  // Date de publication du blog
  final int? featured;  // Indicateur de mise en avant du blog
  final String summary;  // Résumé du blog

  BlogInfo({
    required this.id,
    required this.title,
    required this.content,
    required this.summary,
    this.pic,
    this.publishdate,
    this.featured
  });

  factory BlogInfo.fromJson(Map<String, dynamic> json) {
    final pic = json['pic'] as String?;
    final publishdate = json['publishdate'] as String?;
    final featured = json['featured'] as int?;

    return BlogInfo(
      id: json['id'] as int,
      title: json['title'] as String,
      content: json['content'] as String,
      summary: json['summary'] as String,
      pic: pic,
      publishdate: publishdate,
      featured: featured
    );
  }
}

Widget blogArticleSummary(context, blogId, blogTitle, blogSummary, [Image? blogPic]) {  // Fonction pour créer un article de blog
  return Column(
    children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: GestureDetector(
          child: Column(
            children: [
              Container(
                width: objectWidth(context),
                decoration: BoxDecoration(
                  color: white,
                  //border: Border.all(color: black, width: 3),
                ),
                child: Column(
                  children: [
                    // blogPic!,
                    SizedBox(height: mediumHeight(context)),
                    SizedBox(
                      width: objectWidth(context) - getWidth(context, 50),
                      child: Column(
                        children: [
                          Text(blogTitle,
                            style: Theme.of(context).textTheme.titleSmall,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: mediumHeight(context)),
                          Text(blogSummary,
                            style: Theme.of(context).textTheme.bodyMedium,
                            textAlign: TextAlign.justify,
                          ),
                        ]
                      )
                    ),
                    SizedBox(height: mediumHeight(context))
                  ]
                )
              ),
              Divider(
                color: yellow3,
                thickness: 3,
                height: 0,
              ),
              Container(
                width: objectWidth(context),
                decoration: BoxDecoration(
                  color: yellow,
                  //border: Border.all(color: black, width: 3),
                ),
                child: Column(
                  children: [
                    SizedBox(height: smallHeight(context)),
                    Text('Cliquer pour lire la suite',
                      style: Theme.of(context).textTheme.labelLarge
                    ),
                    SizedBox(height: smallHeight(context))
                  ],
                )
              ),
            ],
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ArticlePage(articleId: blogId))  // Ouvrir l'article de blog au touché
            );
          },
        ),
      ),
      SizedBox(height: mediumHeight(context))
    ],
  );
}

Future<void> showBlogInfo(context, int blogNB) async {  // Fonction pour afficher les informations du blog
  final BlogInfo blogInfo;

  try {
    print((await getBlog(context))[blogNB]);
    blogInfo = BlogInfo.fromJson((await getBlog(context))[blogNB]);
  } on BlogRetrievalException catch (e) {
    print(e);
    return;
  }

  print('Information about the blog:');
  print('id: ${blogInfo.id}');
  print('title: ${blogInfo.title}');
  print('content: ${blogInfo.content}');

  final pic = blogInfo.pic;
  if (pic != null) {
    print('Picture: ${Image.asset(pic)}');
  } else {
    print('No picture');
  }

  final publishdate = blogInfo.publishdate;
  if (publishdate != null) {
    print('Publish date: $publishdate');
  }

  final featured = blogInfo.featured;
  if (featured != null) {
    print('Featured: $featured');
  } else {
    print('Not featured');
  }

  print('summary: ${blogInfo.summary}');
}

Future<List<dynamic>> getBlog(context) async {
  final apiBlog = await http.get(  // Récupérer la liste des blogs avec GET
    Uri.parse('https://dev.eloquencia.org/api/blog')
  );

  // If the request didn't succeed, throw an exception
  if (apiBlog.statusCode != 200) {
    print(apiBlog.statusCode);
    throw BlogRetrievalException(
      statusCode: apiBlog.statusCode,
    );
  }
  
  if (apiBlog.body.isEmpty) {
    throw Exception('Aucune information reçue');
  } final List<dynamic> blogList = json.decode(apiBlog.body);
  
  if (blogList.isEmpty) {
    throw Exception('Aucun blog à afficher');
  }

  print('Blog List: $blogList');
  return blogList; //BlogInfo.fromJson(blogList[blogNb] as Map<String, dynamic>);

}

class BlogRetrievalException implements Exception {
  final int? statusCode;

  BlogRetrievalException({this.statusCode});
}

Future<List<Widget>> showBlog(context, int showNb) async {
  Image? blogPic;  //TODO récupérer correctement les images des blogs
  List<dynamic> blogList = await getBlog(context);
  List<Widget> blogWidgets = [];
  Map<String, dynamic> blogInfo;

  if (blogList.isEmpty) {
    return [Text('Aucun blog à afficher')];
  } else if (showNb < blogList.length){
    for (var i = 0; i < showNb; i++) {
      if (blogList[i] is Map<String, dynamic>) {
        blogInfo = blogList[i];
        // if (blogInfo['pic'] != null) {
        //   print(blogPic);
        //   blogPic = Image.asset(blogInfo['pic']);
        // } else {
        //   blogPic = null;
        //   print(null);
        // }

        print('Blog $i Info: $blogInfo');
        blogWidgets.add(blogArticleSummary(context, blogInfo['id'], blogInfo['title'], blogInfo['summary']));
        print(blogWidgets);
      } else {
        return blogList as List<Widget>;
      }
    }
    return blogWidgets;

  } else {
    for (var i = 0; i < blogList.length; i++) {
      if (blogList[i] is Map<String, dynamic>) {
        blogInfo = blogList[i];
        // if (blogInfo['pic'] != null) {
        //   blogPic = Image.asset(blogInfo['pic']);
        // } else {
        //   blogPic = null;
        // }

        print('Blog $i Info: $blogInfo');
        blogWidgets.add(blogArticleSummary(context, blogInfo['id'], blogInfo['title'], blogInfo['summary']));
      } else {
        return blogList as List<Widget>;
      }
    }
    return blogWidgets;
  }
}

Future<Widget> showArticle(context, int articleId) async {
  List<dynamic> blogList = await getBlog(context);
  Widget articleWidgets;
  Map<String, dynamic> blogInfo;

  if (blogList.isEmpty) {
    throw Exception('Aucun blog à afficher');
  } else {
    for (var i = 0; i < blogList.length; i++) {
      if (blogList[i]['id'] == articleId) {
        blogInfo = blogList[i];
        articleWidgets = Column(
          children: [
            // Image.asset(blogInfo['pic']),
            Text(blogInfo['title'],
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: mediumHeight(context)),
            Text('Publié le ${blogInfo['publishdate']}',
              style: Theme.of(context).textTheme.labelLarge,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: mediumHeight(context)),
            // Text(blogInfo['content']),
            Html(data: blogInfo['content'].replaceAllMapped(RegExp(r'src="\/\/'), (match) => 'src="https://'),
              extensions: [
                IframeHtmlExtension()
              ],
              style: {'body': Style(
                fontSize: FontSize(Theme.of(context).textTheme.bodyMedium!.fontSize!),
                textAlign: TextAlign.justify,
              ),
              'img': Style(
                width: Width(objectWidth(context))
              )
              },
            ),
            SizedBox(height: mediumHeight(context)),
          ]
        );
        print('Blog $i Info: $blogInfo');
        print(articleWidgets);
        return articleWidgets;
      }
      // if (blogInfo['pic'] != null) {
      //   print(blogPic);
      //   blogPic = Image.asset(blogInfo['pic']);
      // } else {
      //   blogPic = null;
      //   print(null);
      // }

    }
  // } else {
  //   for (var i = 0; i < blogList.length; i++) {
  //     blogInfo = blogList[i];
  //     // if (blogInfo['pic'] != null) {
  //     //   blogPic = Image.asset(blogInfo['pic']);
  //     // } else {
  //     //   blogPic = null;
  //     // }

  //     blogTitle = blogInfo['title'];
  //     blogSummary = blogInfo['summary'];
  //     print('Blog $i Info: $blogInfo');
  //     blogWidgets.add(blogArticleSummary(context, blogTitle, blogSummary));
  //   }
  //   return blogWidgets;
  }
  return Scaffold(
    appBar: appBarEloquencia(context, 'Erreur', 0),
    endDrawer: endDrawerEloquencia(context, articleId),
    body: ListView(
      children: [
        Center(
          child: SizedBox(
            width: objectWidth(context),
            child: Column(
              children: [
                SizedBox(height: appBarHeight(context)),
                Text('Article non trouvé',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: Theme.of(context).textTheme.titleLarge?.fontSize
                  ),
                  textAlign: TextAlign.center,
                )
              ]
            )
          )
        )
      ]
    )
  );
}

Future apiContact(context, name, email, message) async {
  final apiContact = await http.post(
    Uri.parse('https://dev.eloquencia.org/api/contact'),
    body: {
      'name': name,
      'email': email,
      'message': message
    }
  );
  if (apiContact.statusCode != 200) {
    print('Une erreur est survenue');
    return 'Une erreur est survenue';
  }
  print(apiContact.body);
  var contact = jsonDecode(apiContact.body) as Map<String, dynamic>;
  print(contact);
  if (contact['status'] == 'error') {
    return Text(contact['message'],
      style: TextStyle(
        color: Colors.red,
        fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize
      ),
    );
  } else if (contact['status'] == 'success') {
    return Text(contact['message'],
      style: TextStyle(
        color: Colors.green,
        fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize
      ),
    );
  } else {
    return Text('Erreur inconnue',
      style: TextStyle(
        color: Colors.red,
        fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize
      ),
    );
  }
}

Future pickFile() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles();
  if (result != null) {
    File file = File(result.files.single.path!);
    return file;
  }
}

Future apiDiscount(context, name, email, File? proof) async {
  if (proof == null) {
    return Text('Aucun fichier sélectionné',
      style: TextStyle(
        color: Colors.red,
        fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize
      ),
    );
  } else if (email.split('@').last == 'icloud.com' || email.split('@').last == 'sfr.fr') {
    return Text('L\'adresse e-mail ne peut pas être une adresse iCloud ou SFR',
      style: TextStyle(
        color: Colors.red,
        fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize
      ),
      textAlign: TextAlign.justify,
    );
  } else {
    try {
      var uri = Uri.parse('https://dev.eloquencia.org/api/discount');
      var request = http.MultipartRequest('POST', uri);
      request.fields['name'] = name;
      request.fields['email'] = email;
      // get the mediatype of the file
      var mimeType = lookupMimeType(proof.path);
      print(mimeType);
      var mimeTypeArray = mimeType?.split('/');
      print(mimeTypeArray);
      MediaType? mediaType;
      if (mimeTypeArray != null && mimeTypeArray.length == 2) {
        if (mimeTypeArray[1] != 'jpeg' && mimeTypeArray[1] != 'png' && mimeTypeArray[1] != 'pdf'){
          return Text('Le fichier doit être au format JPEG, PNG ou PDF',
            style: TextStyle(
              color: Colors.red,
              fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize
            ),
          );
        }
        mediaType = MediaType(mimeTypeArray[0], mimeTypeArray[1]);
      }
      request.files.add(
        await http.MultipartFile.fromPath(
          'proof',
          proof.path,
          contentType: mediaType, // or 'image/png', adjust as needed
        ),
      );
    
      var streamedResponse = await request.send();
      var apiDiscount = await http.Response.fromStream(streamedResponse);
    

      if (apiDiscount.statusCode != 200) {
        print('Une erreur est survenue');
        return 'Une erreur est survenue';
      }
      print(apiDiscount.body.split(r'>').last);
      var discount = apiDiscount.body.split(r'>').last;
      var discountRes = jsonDecode(discount) as Map<String, dynamic>;
      print(discountRes);
      if (discountRes['status'] == 'error') {
        return Text(discountRes['message'],
          style: TextStyle(
            color: Colors.red,
            fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize
          ),
        );
      } else if (discountRes['status'] == 'success') {
        return Text(discountRes['message'],
          style: TextStyle(
            color: Colors.green,
            fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize
          ),
        );
      } else {
        return Text('Erreur inconnue',
          style: TextStyle(
            color: Colors.red,
            fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize
          ),
        );
      }
    } catch (e) {
      return Text('Erreur',
        style: TextStyle(
          color: Colors.red,
          fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize
        ),
      );
    }
  }
}

class MyApp extends StatefulWidget {  // L'application
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
    // Hides the bottom navigation bar and the status bar
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
      theme: ThemeData(
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: yellow,
          selectionColor: yellow2,
          selectionHandleColor: yellow
        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 45
          ),
          titleMedium: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 35
          ),
          titleSmall: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25
          ),
          headlineMedium: TextStyle(
            fontStyle: FontStyle.italic,
            fontSize: 22
          ),
          headlineSmall: TextStyle(
            fontStyle: FontStyle.italic,
            fontSize: 20
          ),
          bodyMedium: TextStyle(
            fontSize: 18
          ),
          bodySmall: TextStyle(
            fontSize: 14
          ),
          labelMedium: TextStyle(
            fontSize: 12
          ),
        ),
      )
    );
  }
}