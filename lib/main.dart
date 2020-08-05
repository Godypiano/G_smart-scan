
import 'package:flutter/material.dart';
 import 'package:splashscreen/splashscreen.dart';
import 'package:g2_scan/splash.dart';

void main(){
  runApp(
    new MaterialApp(
      debugShowCheckedModeBanner: false,
      
    home: new MyApp(),
  ));
}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      
      seconds: 5,
      navigateAfterSeconds: new MyApp1(),
      title: new Text('Welcome In G_smart Scan',
      style: new TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20.0
      ),),
      image: new Image.network('https://i.imgur.com/TyCSG9A.png'),
      backgroundColor: Colors.white,
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 100.0,
      onClick: ()=>print("gody here"),
      loaderColor: Colors.red
    );
  }
}
