import 'package:flutter/material.dart';
import 'package:news/data/data.dart';
import 'package:news/data/news.dart';
import 'package:news/models/articles_model.dart';
import 'package:news/models/categories.dart';
import 'package:news/screens/article_screen.dart';
import 'category_news.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = new List<CategoryModel>();
  List<ArticleModel> articles = new List<ArticleModel>();
  bool loading = true;
  @override
  void initState() {
    super.initState();
    categories = getCategories();
    getNews();
  }

  getNews() async {
    KenyaNews newsClass = KenyaNews();
    await newsClass.getNews();
    articles = newsClass.news;
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Nish",
              style: TextStyle(color: Colors.black),
            ),
            Text(
              "News",
              style: TextStyle(color: Colors.blue),
            ),
          ],
        ),
      ),
      body: loading
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              child: Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 70.0,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: categories.length,
                          itemBuilder: (context, index) {
                            return CategoryTile(
                              //imageUrl: categories[index].categoryUrl,
                              categoryName: categories[index].categoryName,
                            );
                          }),
                    ),
                    Container(
                      child: ListView.builder(
                          physics: ClampingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: articles.length,
                          itemBuilder: (context, index) {
                            return BlogTile(
                              imageUrl: articles[index].urlToImage ?? "",
                              title: articles[index].title ?? "",
                              description: articles[index].description ?? "",
                              url: articles[index].url,
                            );
                          }),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  //final imageUrl,
  final categoryName;
  CategoryTile({this.categoryName});
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CategoryNews(
                        category: categoryName,
                      )));
        },
        child: Container(
          margin: EdgeInsets.only(left: 10.0, bottom: 8.0),
          height: 60.0,
          width: 120,
          color: Colors.black,
          child: Stack(
            children: <Widget>[
              // Image.network(imageUrl, fit: BoxFit.cover,height: 60.0,
              //width: 120,),
              Center(
                child: Text(
                  categoryName,
                  style: TextStyle(color: Colors.white, fontSize: 15.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BlogTile extends StatelessWidget {
  final String imageUrl, title, description, url;
  BlogTile({this.imageUrl, this.title, this.description, this.url});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ArticleWebView(
                      blogurl: url,
                    )));
      },
      child: Container(
        padding: EdgeInsets.only(top: 16.0),
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: <Widget>[
            Image.network(imageUrl),
            Text(
              title,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              description,
              style: TextStyle(fontSize: 12.0),
            ),
          ],
        ),
      ),
    );
  }
}
