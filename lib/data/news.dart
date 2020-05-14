
import 'dart:convert';

import 'package:news/models/articles_model.dart';
import 'package:http/http.dart' as http;

class News{

  List <ArticleModel> news =[];
  
  Future getNews()async{
    String url ="https://newsapi.org/v2/top-headlines?country=us&apiKey=400f43141d2740ae99dd40e90a695498";
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);

    if(jsonData['status']=="ok"){
      for(news.length=0;news.length<=10; news.length++ ){
      jsonData["articles"].forEach((element){
        if(element["urlToImage"]!=null && element["description"] !=null){
          
          ArticleModel articleModel =ArticleModel(
            title: element['title'],
            author: element['author'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            content: element['content'],
            description: element['description'],
          );
          news.add(articleModel);
        }
        
      });
      }
    }
  }
}
class CategotyNews{

  List <ArticleModel> news =[];
  
  Future getNews()async{
    String url ="https://newsapi.org/v2/top-headlines?country=us&apiKey=400f43141d2740ae99dd40e90a695498";
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);

    if(jsonData['status']=="ok"){
      for(news.length=0;news.length<=10; news.length++ ){
      jsonData["articles"].forEach((element){
        if(element["urlToImage"]!=null && element["description"] !=null){
          
          ArticleModel articleModel =ArticleModel(
            title: element['title'],
            author: element['author'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            content: element['content'],
            description: element['description'],
          );
          news.add(articleModel);
        }
        
      });
      }
    }
  }
}

 
 class KenyaNews{

  List <ArticleModel> news =[];
  
  Future getNews()async{
    String url ="https://api.breakingapi.com/news?type=headlines&locale=en-KE&api_key=32D99BEFD1AD443B808F9E4CFDD908D9";
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);

    //if(jsonData['status']=="ok"){
      for(int index = 0;index<=10; index++ ){
      jsonData["articles"].forEach((element){
        //if(element["urlToImage"]!=null && element["description"] !=null){
          
          ArticleModel articleModel =ArticleModel(
            title: element['title'],
            author: element['date_published'],
            url: element['link'],
            urlToImage: element['primary_image_link'],
            content: element['snippet'],
            description: element['snippet'],
            
          );
          news.add(articleModel);
        //}
        
      });
      }
    //}
  }
}


class KenyaNewsCategory{
  String category;
  KenyaNewsCategory({this.category});

  List <ArticleModel> news =[];
  
  Future getNews()async{
    String url ="https://api.breakingapi.com/news?type=headlines&category=$category&locale=en-KE&api_key=32D99BEFD1AD443B808F9E4CFDD908D9";
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);

    //if(jsonData['status']=="ok"){
      for(int index = 0;index<=10; index++ ){
      jsonData["articles"].forEach((element){
        //if(element["urlToImage"]!=null && element["description"] !=null){
          
          ArticleModel articleModel =ArticleModel(
            title: element['title'],
            author: element['date_published'],
            url: element['link'],
            urlToImage: element['primary_image_link'],
            content: element['snippet'],
            description: element['snippet'],
            
          );
          news.add(articleModel);
        //}
        
      });
      }
    //}
  }
}