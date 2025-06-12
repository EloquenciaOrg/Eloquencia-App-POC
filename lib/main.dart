// ignore_for_file: avoid_print, strict_top_level_inference
import 'dart:convert';
import 'dart:io';
import 'package:bcrypt/bcrypt.dart';
import 'package:eloquencia/about.dart';
import 'package:eloquencia/article.dart';
import 'package:eloquencia/blog.dart';
import 'package:eloquencia/chapter.dart';
import 'package:eloquencia/contact.dart';
import 'package:eloquencia/home.dart';
import 'package:eloquencia/logout.dart';
import 'package:eloquencia/services.dart';
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
  runApp(MyApp(userInfo: {}));
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

appBarEloquencia(BuildContext context, pageID, color, [double space = 16.0]) {  // Fonction pour créer la barre de navigation en haut de l'application
  return AppBar(
    backgroundColor: color,
    title: logoEloquencia(context, pageID, 22, ' - $pageID'),  // Logo et titre de l'application
    titleSpacing: getWidth(context, space),  // Espace entre le logo et le bord gauche de l'écran
  );
}

userMessage(context, userInfo) {
  if (userInfo.isEmpty) {
    return SizedBox();
  } else {
    return Column(
      children: [
        SizedBox(height: smallHeight(context)),
        Text('Bienvenue ${userInfo['first_name']} ${userInfo['name']}',
          style: Theme.of(context).textTheme.headlineMedium
        )
      ]
    );
  }
}

drawerHeaderEloquencia(BuildContext context, pageID, userInfo, color) {  // Fonction pour créer l'en-tête du menu de navigation
  return DrawerHeader(  // En-tête du menu de navigation
    decoration: BoxDecoration(color: color),  // Couleur du bouton
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,  // Alignement du logo le plus à gauche possible
      children: [
        logoEloquencia(context, pageID, 30),  // Logo de l'application à la taille 30
        userMessage(context, userInfo)
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
      else {  // Si je ne suis pas sur la page d'accueil...
        while (Navigator.canPop(context)) {  // Tant que je peux revenir en arrière...
          Navigator.pop(context);  // Je reviens en arrière
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

drawerBehavior(context, pageID, buttonID, userInfo) {  // Fonction pour gérer le comportement du menu de navigation
  /*Est-ce que le nom du bouton est le même que l'ID de la page sur laquelle je suis
  si oui, Navigator.pop(context)
  si non, Navigator.push(context, MaterialPageRoute(builder: (context) => const lapage)*/

  if (pageID == buttonID) {  // Si le nom du bouton est le même que l'ID de la page sur laquelle je suis
    Navigator.pop(context);  // Le menu se ferme
  }
  else {  // Sinon je vais sur la page correspondante
    if (buttonID == 'Services') {
      Navigator.pop(context);  // Ferme le menu de navigation
      Navigator.push(context, MaterialPageRoute(builder: (context) => ServicesPage(userInfo: userInfo)));
    }
    else if (buttonID == 'Blog') {
      Navigator.pop(context);  // Ferme le menu de navigation
      Navigator.push(context, MaterialPageRoute(builder: (context) => BlogPage(userInfo: userInfo)));
    }
    else if (buttonID == 'Partenaires') {
      Navigator.pop(context);  // Ferme le menu de navigation
      Navigator.push(context, MaterialPageRoute(builder: (context) => PartnersPage(userInfo: userInfo)));
    }
    else if (buttonID == 'Réductions') {
      Navigator.pop(context);  // Ferme le menu de navigation
      Navigator.push(context, MaterialPageRoute(builder: (context) => DiscountPage(userInfo: userInfo)));
    }
    else if (buttonID == 'Contact') {
      Navigator.pop(context);  // Ferme le menu de navigation
      Navigator.push(context, MaterialPageRoute(builder: (context) => ContactPage(userInfo: userInfo)));
    }
    else if (buttonID == 'À propos') {
      Navigator.pop(context);  // Ferme le menu de navigation
      Navigator.push(context, MaterialPageRoute(builder: (context) => AboutPage(userInfo: userInfo)));
    }
    else if (buttonID == 'Connexion') {
      Navigator.pop(context);  // Ferme le menu de navigation
      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(userInfo: userInfo)));
    }
    else if (buttonID == 'Déconnexion') {
      Navigator.pop(context);  // Ferme le menu de navigation
      Navigator.push(context, MaterialPageRoute(builder: (context) => LogoutPage(userInfo: userInfo)));
    }
  }
}

endDrawerEloquencia(BuildContext context, pageID, userInfo, color) {  // Fonction pour créer le menu de navigation à droite
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        drawerHeaderEloquencia(context, pageID, userInfo, color),  // En-tête du menu de navigation
        ListTile(  // Bouton Services
          title: Text('Services',
            style: Theme.of(context).textTheme.bodyMedium),
          onTap: () {
            drawerBehavior(context, pageID, 'Services', userInfo);
          },
        ),
        ListTile(  // Bouton Blog
          title: Text('Blog',
            style: Theme.of(context).textTheme.bodyMedium),
          onTap: () {
            drawerBehavior(context, pageID, 'Blog', userInfo);
          },
        ),
        ListTile(  // Bouton Partenaires
          title: Text('Partenaires',
            style: Theme.of(context).textTheme.bodyMedium),
          onTap: () {
            drawerBehavior(context, pageID, 'Partenaires', userInfo);
          },
        ),
        ListTile(  // Bouton Réductions
          title: Text('Réductions',
            style: Theme.of(context).textTheme.bodyMedium),
          onTap: () {
            drawerBehavior(context, pageID, 'Réductions', userInfo);
          },
        ),
        ListTile(  // Bouton Contact
          title: Text('Contact',
            style: Theme.of(context).textTheme.bodyMedium),
          onTap: () {
            drawerBehavior(context, pageID, 'Contact', userInfo);
          },
        ),
        ListTile(  // Bouton À propos
          title: Text('À propos',
            style: Theme.of(context).textTheme.bodyMedium),
          onTap: () {
            drawerBehavior(context, pageID, 'À propos', userInfo);
          },
        ),
        if (userInfo.isEmpty)
          ListTile(  // Bouton Connexion
            title: Text('Connexion',
              style: Theme.of(context).textTheme.bodyMedium), 
            onTap: () {
              drawerBehavior(context, pageID, 'Connexion', userInfo);
            },
          ),
        if (userInfo.isEmpty == false)
          ListTile(  // Bouton Déconnexion
            title: Text('Déconnexion',
              style: Theme.of(context).textTheme.bodyMedium), 
            onTap: () {
              drawerBehavior(context, pageID, 'Déconnexion', userInfo);
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
  var emailErr = '';
  // if (password.length == 0) {
  // } else {
  //   password = BCrypt.hashpw(password, BCrypt.gensalt());
  // }
  try {
    final apiLogin = await http.post(
      Uri.parse('https://dev.eloquencia.org/api/login'),
      body: {
        'email': email,
        'password': password
      }
    );
    
    if (apiLogin.statusCode == 200) {
      print('Connexion réussie');
    }
    if (apiLogin.statusCode == 201) {
      throw Exception('Les données ont été créées avec succès');
    }
    if (apiLogin.statusCode == 403) {
      throw Exception('Nécessite une authentification JWT');
    }
    if (apiLogin.statusCode == 404) {
      throw Exception('Rien n\'a été trouvé');
    }
    if (apiLogin.statusCode == 405) {
      throw Exception('Méthode incorrecte');
    }
    if (apiLogin.statusCode == 500) {
      throw Exception('Erreur interne du serveur');
    }
    if (apiLogin.statusCode == 502) {
      throw Exception('Bad Gateway');
    }
    if (apiLogin.statusCode == 503) {
      throw Exception('Serveur en maintenance');
    }
    if (apiLogin.body.isEmpty) {
      throw Exception('Aucune information reçue');
    }
    print(apiLogin.body);
    var login = jsonDecode(apiLogin.body) as Map<String, dynamic>;
    print(login);
    if (login['status'] == 'success') {
      var userInfo = login['user_info'];
      await storage.write(key: 'token', value: login['token']);
      print(await storage.read(key: 'token'));
      var firstName = userInfo['first_name'];
      var lastName = userInfo['name'];
      print(firstName);
      print(lastName);
      return userInfo;
    }
    if (login['status'] == 'error') {
      if (login['errors'] == null) {
        return Text(login['message'],
          style: TextStyle(
            color: Colors.red,
            fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize
          ),
          textAlign: TextAlign.center,
        );
      }
      if (login['errors']['email'] != null) {
        for (var i = 0; i < login['errors']['email'].length; i++) {
          if (emailErr == '') {
            emailErr = emailErr + login['errors']['email'][i];
          } else {
            emailErr = '$emailErr\n${login['errors']['email'][i]}';  // Concatène les erreurs d'email
          }
        }
      }
      if (login['errors']['password'] != null) {
        for (var i = 0; i < login['errors']['password'].length; i++) {
          if (emailErr == '') {
            emailErr = emailErr + login['errors']['password'][i];
          } else {
            emailErr = '$emailErr\n${login['errors']['password'][i]}';  // Concatène les erreurs de mot de passe
          }
        }
      }
      return Text(emailErr,
        style: TextStyle(
          color: Colors.red,
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
  } catch (e) {
    return Text('$e',
      style: TextStyle(
        color: Colors.red,
        fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize
      ),
      textAlign: TextAlign.center,
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

Widget blogArticleSummary(context, blogId, blogTitle, blogSummary, userInfo, [Image? blogPic]) {  // Fonction pour créer un article de blog
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
                    if (blogPic != null) 
                      blogPic,
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
              MaterialPageRoute(builder: (context) => ArticlePage(articleId: blogId, userInfo: userInfo))  // Ouvrir l'article de blog au touché
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
    print((await getBlogPage(context, 0))[blogNB]);
    blogInfo = BlogInfo.fromJson((await getBlogPage(context, 0))[blogNB]);
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
    print('Picture: ${Image.network(pic)}');
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

Future<List<dynamic>> getBlogHome(context) async {
  try {
    var apiBlog = await http.get(  // Récupérer la liste des blogs avec GET
      Uri.parse('https://dev.eloquencia.org/api/blog?featured')
    );

    if (apiBlog.body.isEmpty) {
      return [Text('Aucune information reçue')];
    } else {
      print(apiBlog.body);
      var info = json.decode(apiBlog.body);
      print(info);
      
      // If the request didn't succeed, throw an exception
      if (info['response_code'] == 200) {
        print('Connexion réussie');
      }
      if (info['response_code'] == 201) {
        throw Exception('Les données ont été créées avec succès');
      }
      if (info['response_code'] == 403) {
        throw Exception('Nécessite une authentification JWT');
      }
      if (info['response_code'] == 404) {
        throw Exception('Rien n\'a été trouvé');
      }
      if (info['response_code'] == 405) {
        throw Exception('Méthode incorrecte');
      }
      if (info['response_code'] == 500) {
        throw Exception('Erreur interne du serveur');
      }
      if (info['response_code'] == 503) {
        throw Exception('Serveur en maintenance');
      }
      if (apiBlog.body.isEmpty) {
        throw Exception('Aucune information reçue');
      }
      
      final List<dynamic> blogList = info['articles'];
      
      if (blogList.isEmpty) {
        throw Exception('Aucun blog à afficher');
      }

      print('Article List: $blogList');
      return blogList; //BlogInfo.fromJson(blogList[blogNb] as Map<String, dynamic>);
    }
    
  } catch (e) {
    print('Erreur lors de la récupération des blogs: $e');
    throw BlogRetrievalException(statusCode: e is http.Response ? e.statusCode : null);
  }
}

Future<int> getNbPages() async {
  try {
    var apiBlog = await http.get(  // Récupérer la liste des blogs avec GET
      Uri.parse('https://dev.eloquencia.org/api/blog?info')
    );
    var info = json.decode(apiBlog.body);
    print(apiBlog.body);
    print(info);
    
    // If the request didn't succeed, throw an exception
    if (info['response_code'] == 200) {
      print('Connexion réussie');
    }
    if (info['response_code'] == 201) {
      throw Exception('Les données ont été créées avec succès');
    }
    if (info['response_code'] == 403) {
      throw Exception('Nécessite une authentification JWT');
    }
    if (info['response_code'] == 404) {
      throw Exception('Rien n\'a été trouvé');
    }
    if (info['response_code'] == 405) {
      throw Exception('Méthode incorrecte');
    }
    if (info['response_code'] == 500) {
      throw Exception('Erreur interne du serveur');
    }
    if (info['response_code'] == 503) {
      throw Exception('Serveur en maintenance');
    }
    if (apiBlog.body.isEmpty) {
      throw Exception('Aucune information reçue');
    }
  return info['page'];
  } catch (e) {
    print('Erreur lors de la récupération des blogs: $e');
    throw BlogRetrievalException(statusCode: e is http.Response ? e.statusCode : null);
  }
}

Future<int> getNbArticles() async {
  try {
    var apiBlog = await http.get(  // Récupérer la liste des blogs avec GET
      Uri.parse('https://dev.eloquencia.org/api/blog?info')
    );
    var info = json.decode(apiBlog.body);
    print(apiBlog.body);
    print(info);
    
    // If the request didn't succeed, throw an exception
    if (info['response_code'] == 200) {
      print('Connexion réussie');
    }
    if (info['response_code'] == 201) {
      throw Exception('Les données ont été créées avec succès');
    }
    if (info['response_code'] == 403) {
      throw Exception('Nécessite une authentification JWT');
    }
    if (info['response_code'] == 404) {
      throw Exception('Rien n\'a été trouvé');
    }
    if (info['response_code'] == 405) {
      throw Exception('Méthode incorrecte');
    }
    if (info['response_code'] == 500) {
      throw Exception('Erreur interne du serveur');
    }
    if (info['response_code'] == 503) {
      throw Exception('Serveur en maintenance');
    }
    if (apiBlog.body.isEmpty) {
      throw Exception('Aucune information reçue');
    }
  return info['count'];
  } catch (e) {
    print('Erreur lors de la récupération des blogs: $e');
    throw BlogRetrievalException(statusCode: e is http.Response ? e.statusCode : null);
  }
}

Future<List<dynamic>> getBlogPage(context, nbPage) async {
  try {
    if (nbPage > 0) {
        var apiBlog = await http.get(  // Récupérer la liste des blogs avec GET
        Uri.parse('https://dev.eloquencia.org/api/blog?page=$nbPage')
      );
      
      final List<dynamic> blogList = json.decode(apiBlog.body);
      
      if (blogList.isEmpty) {
        throw Exception('Aucun blog à afficher');
      }

      print('Article List: $blogList');
      return blogList; //BlogInfo.fromJson(blogList[blogNb] as Map<String, dynamic>);
    } else {
      var nbArticles = await getNbArticles();
      var apiBlog = await http.get(
        Uri.parse('https://dev.eloquencia.org/api/blog?last=$nbArticles')
      );
      print(apiBlog.body);
      var infos = json.decode(apiBlog.body);
      final List<dynamic> blogList = infos['articles'];
      
      if (blogList.isEmpty) {
        throw Exception('Aucun blog à afficher');
      }

      print('Article List: $blogList');
      return blogList;
    }
    
  } catch (e) {
    print('Erreur lors de la récupération des blogs: $e');
    throw BlogRetrievalException(statusCode: e is http.Response ? e.statusCode : null);
  }
}

class BlogRetrievalException implements Exception {
  final int? statusCode;

  BlogRetrievalException({this.statusCode});
}

Future<List<Widget>> showBlogHome(context, userInfo) async {
  Image? blogPic;
  List<dynamic> blogList = await getBlogHome(context);
  List<Widget> blogWidgets = [];
  Map<String, dynamic> blogInfo;

  if (blogList.isEmpty) {
    return [Text('Aucun blog à afficher')];
  } else {
    for (var i = 0; i < blogList.length; i++) {
      if (blogList[i] is Map<String, dynamic>) {
        blogInfo = blogList[i];
        if (blogInfo['pic'] != null) {
          blogPic = Image.network(blogInfo['pic']);
          print(blogPic);
        } else {
          blogPic = null;
          print(null);
        }

        print('Blog $i Info: $blogInfo');
        blogWidgets.add(blogArticleSummary(context, blogInfo['id'], blogInfo['title'], blogInfo['summary'], userInfo, blogPic));
        print(blogWidgets);
      } else {
        return blogList as List<Widget>;
      }
    }
    return blogWidgets;
  }
}

Future<List<Widget>> showBlogPage(context, nbPage, userInfo) async {
  Image? blogPic;
  List<dynamic> blogList = await getBlogPage(context, nbPage);
  List<Widget> blogWidgets = [];
  Map<String, dynamic> blogInfo;

  if (blogList.isEmpty) {
    return [Text('Aucun blog à afficher')];
  } else {
    for (var i = 0; i < blogList.length; i++) {
      if (blogList[i] is Map<String, dynamic>) {
        blogInfo = blogList[i];
        if (blogInfo['pic'] != null) {
          blogPic = Image.network(blogInfo['pic']);
          print(blogPic);
        } else {
          blogPic = null;
          print(null);
        }

        print('Blog $i Info: $blogInfo');
        blogWidgets.add(blogArticleSummary(context, blogInfo['id'], blogInfo['title'], blogInfo['summary'], userInfo, blogPic));
        print(blogWidgets);
      } else {
        return blogList as List<Widget>;
      }
    }
    return blogWidgets;
  }
}

Future<Widget> showArticle(context, int articleId, nbPage, userInfo) async {
  List<dynamic> blogList = await getBlogPage(context, nbPage);
  Widget articleWidgets;
  Map<String, dynamic> blogInfo;

  if (blogList.isEmpty) {
    throw Exception('Aucun blog à afficher');
  } else {
    for (var i = 0; i < blogList.length; i++) {
      if (blogList[i]['id'] == articleId) {
        blogInfo = blogList[i];
        print(blogInfo);
        articleWidgets = Column(
          children: [
            Image.network(blogInfo['pic']),
            SizedBox(height: mediumHeight(context)),
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
              style: {
                'body': Style(
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
    }
  }
  return Scaffold(
    appBar: appBarEloquencia(context, 'Erreur', yellow, 0),
    endDrawer: endDrawerEloquencia(context, articleId, userInfo, yellow),
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
  var emailDomains = await loadAsset(context);
  print(emailDomains);
  var emailDomainList = emailDomains.split('\n');
  print(emailDomainList);
  if (email == null || email.isEmpty) {
    return Text('Veuillez entrer votre adresse e-mail',
      style: TextStyle(
        color: Colors.red,
        fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize
      ),
      textAlign: TextAlign.justify
    );
  } else {
    if (email.contains('@') && emailDomainList.contains(email.split('@').last)) {
      if (email.split('@').last == 'icloud.com' || email.split('@').last == 'sfr.fr') {
        return Text('L\'adresse e-mail ne peut pas être une adresse iCloud ou SFR',
          style: TextStyle(
            color: Colors.red,
            fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize
          ),
          textAlign: TextAlign.justify,
        );
      } else if (name == null || name.isEmpty) {
        return Text('Veuillez entrer votre nom',
          style: TextStyle(
            color: Colors.red,
            fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize
          ),
          textAlign: TextAlign.justify
        );
      } else {
        try {
          final apiContact = await http.post(
            Uri.parse('https://dev.eloquencia.org/api/contact'),
            body: {
              'name': name,
              'email': email,
              'message': message
            }
          );
          var contactRes = jsonDecode(apiContact.body) as Map<String, dynamic>;
          print(contactRes);
          if (contactRes['status'] == 'success') {
            return Text('Le message a été envoyé avec succès',
              style: TextStyle(
                color: Colors.green,
                fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize
              ),
              textAlign: TextAlign.justify
            );
          } else {
            if (contactRes['response_code'] == 200) {
              print('Connexion réussie');
            }
            if (contactRes['response_code'] == 201) {
              throw Exception('Le message a été envoyé avec succès');
            }
            if (contactRes['response_code'] == 403) {
              throw Exception('Nécessite une authentification JWT');
            }
            if (contactRes['response_code'] == 404) {
              throw Exception('Rien n\'a été trouvé');
            }
            if (contactRes['response_code'] == 405) {
              throw Exception('Méthode incorrecte');
            }
            if (contactRes['response_code'] == 412) {
              throw Exception('Veuillez remplir le champ "Message"');
            }
            if (contactRes['response_code'] == 500) {
              throw Exception('Erreur interne du serveur');
            }
            if (contactRes['response_code'] == 503) {
              throw Exception('Serveur en maintenance');
            }
            if (apiContact.body.isEmpty) {
              throw Exception('Aucune information reçue');
            }
            if (contactRes['status'] == 'error') {
              throw Exception('Erreur Inconnue');
            }
          }
        } catch (e) {
          return Text(e.toString().split(':').last,
            style: TextStyle(
              color: Colors.red,
              fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize
            ),
            textAlign: TextAlign.justify
          );
        }
      }
    } else {
      return Text('Veuillez entrer une adresse e-mail valide',
        style: TextStyle(
          color: Colors.red,
          fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize
        ),
        textAlign: TextAlign.justify
      );
    }
  }
}

Future pickFile() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles();
  if (result != null) {
    File file = File(result.files.single.path!);
    return file;
  }
}

Future<String> loadAsset(BuildContext context) async {
  return await DefaultAssetBundle.of(context).loadString('assets/all_email_provider_domains.txt');
}

Future apiDiscount(context, name, email, File? file, cgu) async {
  var emailDomains = await loadAsset(context);
  print(emailDomains);
  var emailDomainList = emailDomains.split('\n');
  print(emailDomainList);
  if (file == null) {
    return Text('Aucun fichier sélectionné',
      style: TextStyle(
        color: Colors.red,
        fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize
      ),
      textAlign: TextAlign.justify
    );
  } else if (email == null || email.isEmpty) {
    return Text('Veuillez entrer votre adresse e-mail',
      style: TextStyle(
        color: Colors.red,
        fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize
      ),
      textAlign: TextAlign.justify
    );
  } else {
    if (email.contains('@') && emailDomainList.contains(email.split('@').last)) {
      if (email.split('@').last == 'icloud.com' || email.split('@').last == 'sfr.fr') {
        return Text('L\'adresse e-mail ne peut pas être une adresse iCloud ou SFR',
          style: TextStyle(
            color: Colors.red,
            fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize
          ),
          textAlign: TextAlign.justify,
        );
      } else if (name == null || name.isEmpty) {
        return Text('Veuillez entrer votre nom',
          style: TextStyle(
            color: Colors.red,
            fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize
          ),
          textAlign: TextAlign.justify
        );
      } else {
        try {
          var uri = Uri.parse('https://dev.eloquencia.org/api/discount');
          var request = http.MultipartRequest('POST', uri);
          request.fields['name'] = name;
          request.fields['email'] = email;
          
          // get the mediatype of the file
          var mimeType = lookupMimeType(file.path);
          print(mimeType);
          var mimeTypeArray = mimeType?.split('/');
          print(mimeTypeArray);
          MediaType? mediaType;
          if (mimeTypeArray != null && mimeTypeArray.length == 2) {
            if (mimeTypeArray[1] != 'jpeg' && mimeTypeArray[1] != 'png' && mimeTypeArray[1] != 'pdf') {
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
              'file',
              file.path,
              contentType: mediaType,
            ),
          );
          if (cgu == true) {
            var streamedResponse = await request.send();
            var apiDiscount = await http.Response.fromStream(streamedResponse);
            print(apiDiscount.body);
            var discountRes = jsonDecode(apiDiscount.body) as Map<String, dynamic>;
            if (discountRes['status'] == 'created') {
              return Text('Les données ont été créées avec succès',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize
                ),
                textAlign: TextAlign.justify
              );
            } else {
              if (discountRes['response_code'] == 200) {
                print('Connexion réussie');
              }
              if (discountRes['response_code'] == 201) {
                throw Exception('Les données ont été créées avec succès');
              }
              if (discountRes['response_code'] == 403) {
                throw Exception('Nécessite une authentification JWT');
              }
              if (discountRes['response_code'] == 404) {
                throw Exception('Rien n\'a été trouvé');
              }
              if (discountRes['response_code'] == 405) {
                throw Exception('Méthode incorrecte');
              }
              if (discountRes['response_code'] == 412) {
                throw Exception('Le fichier n\'est pas supporté');
              }
              if (discountRes['response_code'] == 500) {
                throw Exception('Erreur interne du serveur');
              }
              if (discountRes['response_code'] == 503) {
                throw Exception('Serveur en maintenance');
              }
              if (apiDiscount.body.isEmpty) {
                throw Exception('Aucune information reçue');
              }
              if (discountRes['status'] == 'error') {
                throw Exception('Erreur Inconnue');
              }
            }
          } else {
            return Text('Veuillez accepter les Conditions Générales d\'Utilisation',
              style: TextStyle(
                color: Colors.red,
                fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize
              ),
              textAlign: TextAlign.justify
            );
          }
        } catch (e) {
          return Text(e.toString().split(':').last,
            style: TextStyle(
              color: Colors.red,
              fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize
            ),
            textAlign: TextAlign.justify
          );
        }
      }
    } else {
      return Text('Veuillez entrer une adresse e-mail valide',
        style: TextStyle(
          color: Colors.red,
          fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize
        ),
        textAlign: TextAlign.justify
      );
    }
  } 
}

apiLMS(context) async {
  try {
    final apiLMS = await http.get(
      Uri.parse('https://dev.eloquencia.org/api/lms?index')
    );
    print(apiLMS.body);
    var lmsRes = jsonDecode(apiLMS.body) as Map<String, dynamic>;
    print(lmsRes);
    if (lmsRes['status'] == 'success') {
      print('LMS connecté');
      return lmsRes;
    } else {
      if (lmsRes['response_code'] == 200) {
        print('Connexion réussie');
      }
      if (lmsRes['response_code'] == 201) {
        throw Exception('Le message a été envoyé avec succès');
      }
      if (lmsRes['response_code'] == 403) {
        throw Exception('Nécessite une authentification JWT');
      }
      if (lmsRes['response_code'] == 404) {
        throw Exception('Rien n\'a été trouvé');
      }
      if (lmsRes['response_code'] == 405) {
        throw Exception('Méthode incorrecte');
      }
      if (lmsRes['response_code'] == 412) {
        throw Exception('Veuillez remplir le champ "Message"');
      }
      if (lmsRes['response_code'] == 500) {
        throw Exception('Erreur interne du serveur');
      }
      if (lmsRes['response_code'] == 503) {
        throw Exception('Serveur en maintenance');
      }
      if (apiLMS.body.isEmpty) {
        throw Exception('Aucune information reçue');
      }
      if (lmsRes['status'] == 'error') {
        throw Exception('Erreur Inconnue');
      }
    }
  } catch (e) {
    return Text(e.toString().split(':').last,
      style: TextStyle(
        color: Colors.red,
        fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize
      ),
      textAlign: TextAlign.justify
    );
  }
}

lmsQuote(context) async {
  try {
    var lmsRes = await apiLMS(context);
    print(lmsRes);
    if (lmsRes.isEmpty) {
      throw Exception("Le LMS ne renvoie rien");  
    } else {
      return Column(
        children: [
          SizedBox(height: largeHeight(context)),
          Text(lmsRes['citation']['text'],
            style: TextStyle(
              fontSize: Theme.of(context).textTheme.headlineMedium?.fontSize,
              fontStyle: FontStyle.italic,
            ),
            textAlign: TextAlign.center
          ),
          SizedBox(height: smallHeight(context)),
          Text('- ${lmsRes['citation']['author']}',
            style: Theme.of(context).textTheme.headlineMedium
          ),
          SizedBox(height: largeHeight(context)),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: getWidth(context, 25), vertical: getWidth(context, 25)),
              color: yellow,
              child: Column(
                children: [
                  Text(lmsRes['annonce']['title'],
                    style: Theme.of(context).textTheme.titleSmall,
                    textAlign: TextAlign.center
                  ),
                  SizedBox(height: smallHeight(context)),
                  Text(lmsRes['annonce']['content'],
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.justify,
                  )
                ]
              )
            )
          )
        ],
      );
    }
  } catch (e) {
    return e;
  }
}

lmsChapters(context) async {
  try {
    var lmsRes = await apiLMS(context);
    print(lmsRes);
    var chapterList = lmsRes['chapitres'] as List<dynamic>;
    print(chapterList);
    return chapterList;
  } catch (e) {
    return e;
  }
}

// showChapter(context, chapterID) async {try{var chapter = await lmsChapters(context)[chapterID];return Column(children: [Text(data)],)}catch(e){}}

lmsDrawerBehavior(context, chapterID, chapList, userInfo) {  // Fonction pour gérer le comportement du menu de navigation
  /*Est-ce que le nom du bouton est le même que l'ID de la page sur laquelle je suis
  si oui, Navigator.pop(context)
  si non, Navigator.push(context, MaterialPageRoute(builder: (context) => const lapage)*/

  for (var i = 0; i < chapList.length; i++) {
    if (chapterID == chapList[i]['ID']) {
      Navigator.pop(context);  // Ferme le menu de navigation
      Navigator.push(context, MaterialPageRoute(builder: (context) => ChapterPage(chapterID: chapterID, userInfo: userInfo)));
    }
  }
}

endDrawerLMS(BuildContext context, pageID, userInfo, color, chapList) {  // Fonction pour créer le menu de navigation à droite
  print(userInfo);
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        drawerHeaderEloquencia(context, pageID, userInfo, color),  // En-tête du menu de navigation
        for (var i = 0; i < chapList.length; i++)
          ListTile(  // Bouton Services
            title: Text(chapList[i]['name'],
              style: Theme.of(context).textTheme.bodyMedium),
            onTap: () {
              lmsDrawerBehavior(context, chapList[i]['ID'], chapList, userInfo);
            },
          ),
        copyrightEloquencia(context)  // Copyright
      ],
    ),
  );
}

showChapter(context, chapterID) async {
  List<dynamic> chapList = await lmsChapters(context);
  Widget chapterWidgets;
  Map<String,dynamic> chapterInfo;

  if (chapList.isEmpty) {
    throw Exception('Aucun blog à afficher');
  } else {
    for (var i = 0; i < chapList.length; i++) {
      if (chapList[i]['ID'] == chapterID) {
        chapterInfo = chapList[i];
        print(chapterInfo);
        chapterWidgets = Column(
          children: [
            SizedBox(height: mediumHeight(context)),
            Text(chapterInfo['name'],
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: mediumHeight(context)),
            Text(chapterInfo['description'],
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: mediumHeight(context)),
          ]
        );
        print('Blog $i Info: $chapterInfo');
        print(chapterWidgets);
        return chapterWidgets;
      }
    }
  }
}

class MyApp extends StatefulWidget {  // L'application
  final Map<String, dynamic> userInfo;
  const MyApp({super.key, required this.userInfo});

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
      home: HomePage(userInfo: widget.userInfo),
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
          bodyLarge: TextStyle(
            fontSize: 22
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