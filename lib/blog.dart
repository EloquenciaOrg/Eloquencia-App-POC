import 'package:eloquencia/main.dart';
import 'package:flutter/material.dart';

class BlogPage extends StatefulWidget {
  const BlogPage({super.key});

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  final pageID = 'Blog';
  late Map<String, dynamic> blogInfo;
  String blogTitle = '';
  Image? blogPic;
  List<Widget> blogList = [];

  @override
  void initState() {
    super.initState();
    _initBlogList();
      // try {
      //   blogInfo = (await getBlog())[0];
      // } on BlogRetrievalException catch (e) {
      //   print(e);
      //   return;
      // }
      // setState(() {
      //   if (blogInfo.pic != null) {
      //     blogPic = Image.memory(base64Decode(blogInfo.pic!));
      //   }
      //   blogTitle = blogInfo.title;
      //   showBlogInfo();
      // });
  }

  Future<void> _initBlogList() async {
    blogList = await showBlog(context, 20);
    setState(() {
      blogList = blogList;
    });
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
                    _initBlogList();
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
                ...blogList,
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