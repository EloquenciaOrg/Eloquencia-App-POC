import 'package:eloquencia/main.dart';
import 'package:flutter/material.dart';

class BlogPage extends StatefulWidget {
  const BlogPage({super.key});

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  final pageID = 'Blog';
  late BlogInfo blogInfo;
  String blogTitle = '';
  String blogContent = '';
  Image? blogPic;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    () async {
      try {
        blogInfo = await getBlog(0);
      } on BlogRetrievalException catch (e) {
        print(e);
        return;
      }
      setState(() {
        blogTitle = blogInfo.title;
        blogContent = blogInfo.content;
        // blogPic = blogInfo.pic;
        showBlogInfo();
      });
    };
  }
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
                SizedBox(height: appBarHeight(context)),  // Espace entre le haut de la page et le contenu
                ClipRRect(
                  child: Column(
                    children: [
                      Text('Blog',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
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
                            Text(blogTitle,
                              style: Theme.of(context).textTheme.titleSmall
                            ),
                            Text(blogContent,
                              style: Theme.of(context).textTheme.bodyLarge
                            ),
                          ],
                        ),
                      ),
                    ]
                  )
                ),
                ElevatedButton(
                  onPressed: () async {
                    try {
                      blogInfo = await getBlog(0);  // TODO Savoir combien d'articles il y a et tous les afficher
                    } on BlogRetrievalException catch (e) {
                      print(e);
                      return;
                    }
                    setState(() {
                      blogTitle = blogInfo.title;
                      blogContent = blogInfo.content;
                      // blogPic = blogInfo.pic;
                      showBlogInfo();
                    });
                  },
                  child: const Text('data')
                ),
                Divider(
                  color: yellow
                ),
              ],
            ),
          ],
        )
      )
    );
  }
}