import 'package:flutter/material.dart';
import 'package:news/main.dart';

class NoInternet extends StatelessWidget {
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
      body:Center(child: Column(
        children: <Widget>[
            
           Container(
             height: MediaQuery.of(context).size.height*0.4,
           ),
            Icon(
        Icons.signal_cellular_connected_no_internet_4_bar,
        size: 30.0,
        color: Colors.blue,
        ), 
         Text('Oops!',
        style: TextStyle(
          fontSize: 20.0,
           fontWeight: FontWeight.w400
        ),
        ),
        Text('Please Check your internet connection',
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w300

        ),),

        SizedBox(height:10.0),
        FlatButton.icon(onPressed: ()=>MyApp(), 
        icon: Icon(Icons.refresh), label: Text("Refresh"))

        ],
        ),), 
    );
  }
}