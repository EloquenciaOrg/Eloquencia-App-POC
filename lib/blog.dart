import 'package:eloquencia/main.dart';
import 'package:flutter/material.dart';

class BlogPage extends StatefulWidget {
  final Map<String, dynamic> userInfo;
  const BlogPage({super.key, required this.userInfo});

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  final pageID = 'Blog';
  List<Widget> blogList = [];
  int nbPages = 1;  // Nombre de pages du blog

  @override
  void initState() {
    super.initState();
    _initBlogList(1);
    setNbPages();
  }

  Future<void> _initBlogList(nbPage) async {
    blogList = await showBlogPage(context, nbPage, widget.userInfo);
    setState(() {
      blogList = blogList;
    });
  }
  
  Future<void> setNbPages() async {
    nbPages = await getNbPages();
    setState(() {
      nbPages = nbPages;
    });
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarEloquencia(context, pageID, yellow, 0),  // Barre de navigation en haut
      endDrawer: endDrawerEloquencia(context, pageID, widget.userInfo, yellow),
      body: ListView(
        children: [
          Center(
            child: SizedBox(
              width: objectWidth(context),
              child: Column(
                children: [
                  SizedBox(height: appBarHeight(context)),  // Espace entre le haut de la page et le texte
                  Text('Blog',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  SizedBox(height: mediumHeight(context)),
                  ElevatedButton(
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
                        Size(buttonWidth(context), 40),
                      ),
                      maximumSize: WidgetStatePropertyAll<Size>(
                        Size(buttonWidth(context), 40),
                      ),
                    ),
                    onPressed: () async {
                      _initBlogList(1);
                      setNbPages();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.refresh,
                          color: black,
                          size: 23
                        ),
                        SizedBox(width: getWidth(context, 5)),
                        Text('Actualiser',
                          style: Theme.of(context).textTheme.bodyMedium),
                      ],
                    )
                  ),
                  SizedBox(height: mediumHeight(context)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (var i = 1; i <= nbPages; i++)
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: const WidgetStatePropertyAll<Color>(yellow),
                            shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            padding: WidgetStatePropertyAll<EdgeInsetsGeometry>(
                                EdgeInsets.symmetric(horizontal: getWidth(context, 1)),
                              ),
                            minimumSize: WidgetStatePropertyAll<Size>(
                              Size(30, 40),
                            ),
                            maximumSize: WidgetStatePropertyAll<Size>(
                              Size(30, 40),
                            ),
                          ),
                          onPressed: () {
                            _initBlogList(i);
                          },
                          child: Text('$i',
                            style: Theme.of(context).textTheme.bodyMedium,
                          )
                        )
                    ],
                  ),
                  SizedBox(height: mediumHeight(context)),
                  ...blogList
                ]
              )
            )
          )
        ]
      )
    );
  }
}