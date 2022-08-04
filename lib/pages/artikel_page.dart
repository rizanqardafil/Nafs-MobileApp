import 'package:flutter/material.dart';
import 'package:nafs/models/Articles.dart';
import 'package:nafs/components/web_view.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// class ArtikelPage extends StatelessWidget {
//   const ArtikelPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     List<Article> _articles = sample_data
//         .map((article) => Article(
//             title: article['title'],
//             imgUrl: article['imgUrl'],
//             articleUrl: article['articleUrl']))
//         .toList();

//     return Column(
//       children: [
//         DefaultTabController(
//           length: 5,
//           child: TabBar(
//             indicatorColor: Colors.purple,
//             labelColor: Colors.purple,
//             unselectedLabelColor: Colors.grey,
//             tabs: <Widget>[
//               new Tab(
//                 text: "Semua",
//               ),
//               new Tab(
//                 text: "Depresi",
//               ),
//               new Tab(
//                 text: "Cemas",
//               ),
//               new Tab(
//                 text: "Stress",
//               ),
//               new Tab(
//                 text: "Insomnia",
//               ),
//             ],
//           ),
//         ),
//         TabBarView(children: <Widget>[
//           Container(color: Colors.amber),
//         ])
//       ],
//     );
//     // new StaggeredGridView.countBuilder(
//     //   crossAxisCount: 4,
//     //   itemCount: _articles.length,
//     //   itemBuilder: (BuildContext context, int index) =>
//     //       ArticleCard(article: _articles[index]),
//     //   staggeredTileBuilder: (int index) =>
//     //       new StaggeredTile.count(2, index.isEven ? 2.75 : 2),
//     //   mainAxisSpacing: 4.0,
//     //   crossAxisSpacing: 4.0,
//     // );
//     // GridView.builder(
//     //   gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//     //       maxCrossAxisExtent: 300,
//     //       childAspectRatio: 3 / 2,
//     //       crossAxisSpacing: 20,
//     //       mainAxisSpacing: 20),
//     //   itemCount: _articles.length,
//     //   itemBuilder: (context, index) => ArticleCard(article: _articles[index]),
//     // );
//   }
// }

// class ArticleCard extends StatelessWidget {
//   const ArticleCard({
//     Key? key,
//     required this.article,
//   }) : super(key: key);
//   final Article article;

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () => Get.to(() => ArticleWebView(url: article.articleUrl)),
//       child: Stack(
//         children: <Widget>[
//           Container(
//             margin: EdgeInsets.all(20),
//             padding: EdgeInsets.all(20),
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: NetworkImage(article.imgUrl),
//                 fit: BoxFit.cover,
//               ),
//               boxShadow: [
//                 BoxShadow(
//                   offset: Offset(1, 1),
//                   blurRadius: 5,
//                   // color: Colors.purple,
//                 )
//               ],
//               borderRadius: BorderRadius.circular(10),
//             ),
//           ),
//           Container(
//             margin: EdgeInsets.all(20),
//             padding: EdgeInsets.all(20),
//             decoration: BoxDecoration(
//               color: Colors.black.withOpacity(0.5),
//               borderRadius: BorderRadius.circular(10),
//             ),
//             child: Align(
//               alignment: Alignment.bottomCenter,
//               child: Text(
//                 article.title,
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontFamily: "Baloo Da",
//                   fontWeight: FontWeight.bold,
//                   fontSize: 14,
//                 ),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

class ArtikelPage extends StatefulWidget {
  const ArtikelPage({Key? key}) : super(key: key);

  @override
  _ArtikelPageState createState() => _ArtikelPageState();
}

class _ArtikelPageState extends State<ArtikelPage> with SingleTickerProviderStateMixin {
  List<Article> _articles = sample_data
      .map((article) =>
          Article(title: article['title'], imgUrl: article['imgUrl'], kategori: article['kategori'], articleUrl: article['articleUrl']))
      .toList();
  late TabController controller;
  List<Article> cemas = [];
  List<Article> depresi = [];
  List<Article> stress = [];
  List<Article> insomnia = [];

  @override
  void initState() {
    controller = new TabController(vsync: this, length: 5);
    super.initState();
    for (int i = 0; i < _articles.length; i++) {
      if (_articles[i].kategori == "Cemas") {
        cemas.add(_articles[i]);
      } else if (_articles[i].kategori == "Depresi") {
        depresi.add(_articles[i]);
      } else if (_articles[i].kategori == "Stress") {
        stress.add(_articles[i]);
      } else if (_articles[i].kategori == "Insomnia") {
        insomnia.add(_articles[i]);
      }
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: TabBar(
          controller: controller,
          indicatorColor: Colors.purple,
          labelColor: Colors.purple,
          unselectedLabelColor: Colors.grey,
          tabs: <Widget>[
            new Tab(
              text: "Semua",
            ),
            new Tab(
              text: "Depresi",
            ),
            new Tab(
              text: "Cemas",
            ),
            new Tab(
              text: "Stres",
            ),
            new Tab(
              text: "Insomnia",
            ),
          ],
        ),
      ),
      body: TabBarView(
        children: <Widget>[
          ListView.builder(
            itemCount: _articles.length,
            itemBuilder: (context, index) {
              return CardArtikel(
                article: _articles[index],
              );
            },
          ),
          ListView.builder(
            itemCount: depresi.length,
            itemBuilder: (context, index) {
              return CardArtikel(
                article: depresi[index],
              );
            },
          ),
          ListView.builder(
            itemCount: cemas.length,
            itemBuilder: (context, index) {
              return CardArtikel(
                article: cemas[index],
              );
            },
          ),
          ListView.builder(
            itemCount: stress.length,
            itemBuilder: (context, index) {
              return CardArtikel(
                article: stress[index],
              );
            },
          ),
          ListView.builder(
            itemCount: insomnia.length,
            itemBuilder: (context, index) {
              return CardArtikel(
                article: insomnia[index],
              );
            },
          ),
        ],
        controller: controller,
      ),
    );
  }
}

class CardArtikel extends StatelessWidget {
  const CardArtikel({required this.article});

  final Article article;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      leading: Image.network(
        article.imgUrl,
        width: 100,
      ),
      title: Text(
        article.title,
        style: TextStyle(fontSize: 14, fontFamily: "Baloo Da"),
      ),
      subtitle: Text(
        article.kategori,
        style: TextStyle(fontFamily: "Baloo Da"),
      ),
      onTap: () {
        Get.to(
          () => ArticleWebView(
            url: article.articleUrl,
          ),
        );
      },
    );
  }
}
