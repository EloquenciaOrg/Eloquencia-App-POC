import 'package:eloquencia/main.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class JoinPage extends StatefulWidget {  // Page de HelloAsso
  final Map<String, dynamic> userInfo;
  const JoinPage({super.key, required this.userInfo});

  @override
  State<JoinPage> createState() => _JoinPageState();
}

class _JoinPageState extends State<JoinPage> {

  late WebViewController controller;  // Contrôleur de la WebView
  var loadingPercentage = 0;  // Pourcentage de chargement de la page
  final pageID = 'Adhésion';

  @override
  void initState() {
    super.initState();
    
    // WidgetsBinding.instance.addPostFrameCallback((_) async {
    //   bool isConnected = await checkConnection();
    // if (checkConnection() == true) {
    controller = WebViewController()
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (url) {
          setState(() {
            loadingPercentage = 0;  // Réinitialiser le pourcentage de chargement
          });
        },
        onProgress: (progress) {
          setState(() {
            loadingPercentage = progress;  // Mettre à jour le pourcentage de chargement
          });
        },
        onPageFinished: (url) {
          setState(() {
            loadingPercentage = 100;  // Charger la page à 100%
          });
        },
      ))
      ..setJavaScriptMode(JavaScriptMode.unrestricted)  // Autoriser JavaScript
      ..loadRequest(Uri.parse(helloassoUrl));  // Charger l'URL de HelloAsso
      // } else {
      //   Navigator.push(
      //     context,
      //     MaterialPageRoute(builder: (context) => const NoConnectionPage()),
      //   );
      // }
      /*if (connectionStatus == true) {
        controller.loadRequest(Uri.parse(helloassoUrl));  // Charger l'URL de HelloAsso
      } else if (connectionStatus == false) {
      }*/
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarEloquencia(context, pageID, yellow, 0),
      endDrawer: endDrawerEloquencia(context, pageID, widget.userInfo, yellow),
      body: Stack(
        children: [
          WebViewWidget(
            controller: controller,  // Afficher la WebView avec le contrôleur
          ),
          loadingPercentage < 100  // Afficher la barre de chargement si la page n'est pas complètement chargée
            ? LinearProgressIndicator(
                value: loadingPercentage / 100,
                backgroundColor: null,
                color: yellow3,
              )
            : Container(),  // Sinon, afficher un conteneur vide
        ]
      ),
    );
  }
}