import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class ArticleWebView extends StatefulWidget {
  final String blogurl;
  @override 
  
  ArticleWebView({this.blogurl});
  _ArticleWebViewState createState() => _ArticleWebViewState();
}

class _ArticleWebViewState extends State<ArticleWebView> {
  final Completer <WebViewController> _completer = Completer<WebViewController>();
  bool loading=false;

 _loader(){
  setState(() {
    loading =false;
  });
}
_start(){
  setState(() {
    loading =true;
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
         color: Colors.blue   
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Nish", style: TextStyle(
              color: Colors.black
            ), ),
            Text("News",
            style: TextStyle(
              color: Colors.blue
            ),
            
            ),
          ],
        ),
      ),
body:loading ? Center(
  child: CircularProgressIndicator(),
) :Container(
  height: MediaQuery.of(context).size.height,
  width: MediaQuery.of(context).size.height,
  margin: EdgeInsets.symmetric(horizontal: 10.0),
      child: WebView(
        initialUrl: widget.blogurl,
        onPageStarted: _start(),
        javascriptMode: JavascriptMode.unrestricted,
        onPageFinished: _loader(),
        onWebViewCreated: ((WebViewController webViewController){
          _completer.complete(webViewController);
                     
        } ),
      ),
    ) ,
    ); 
    
  }
}