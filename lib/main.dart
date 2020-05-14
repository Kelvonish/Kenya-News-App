import 'package:flutter/material.dart';
import 'package:news/screens/home.dart';
import 'package:connectivity/connectivity.dart';
import 'package:news/screens/noConnection.dart';
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool internet = false;
  
  @override
  void initState(){
    super.initState();
    checkInternet();
  } 
  checkInternet() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
      setState(() {
        internet = true;
      });
    }else{
      setState((){
        internet = false;
      });
    }
  } 
  Widget build(BuildContext context) {
    

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  internet ? Home() : NoInternet(),
    );
  }
}


