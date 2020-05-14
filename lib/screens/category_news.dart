import 'package:flutter/material.dart';
import 'package:news/data/news.dart';
import 'package:news/models/articles_model.dart';
import 'article_screen.dart';
class CategoryNews extends StatefulWidget {
final String category;
CategoryNews({this.category});
  @override
  _CategoryNewsState createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  List <ArticleModel> articles =List<ArticleModel>();
  bool loading=true;
  @override
  void initState() {
    
    super.initState();
    getNews();

  }

  getNews() async{
    KenyaNewsCategory newsClass = KenyaNewsCategory(
      category: widget.category,
    );
    await newsClass.getNews();
    articles = newsClass.news;
    setState(() {
      loading=false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.blue),
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Nish ", style: TextStyle(
              color: Colors.black
            ), ),
            Text(widget.category+" News" ,
            style: TextStyle(
              color: Colors.blue
            ),
            
            ),
          ],
        ),
      ),
      body: loading ? Center(
        child: CircularProgressIndicator(),
      ) : SingleChildScrollView(
        child:Container(
                      child: ListView.builder(
                        physics: ClampingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: articles.length,
                        itemBuilder: (context,index){
                          return BlogTile(
                            imageUrl: articles[index].urlToImage ?? "",
                            title: articles[index].title ?? "",
                            description: articles[index].description ?? "",
                            url: articles[index].url,
                          );
                        }),
                    ),
      ),      
    );
  }
}

class BlogTile extends StatelessWidget {
  final String imageUrl, title , description,url;
  BlogTile({this.imageUrl,this.title,this.description,this.url});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ArticleWebView(blogurl: url,)));
      },
          child: Container(
         padding: EdgeInsets.only(top: 16.0),
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: <Widget>[
            Image.network(imageUrl),
            Text(title, style: TextStyle(
              fontSize: 20.0,
              fontWeight:FontWeight.bold 
            ),),
            SizedBox(height: 8.0,),
            Text(description, style: TextStyle(
              fontSize: 12.0
            ), ),
          ],
        ),
      ),
    );
  }
}