import 'package:flutter/material.dart';
import 'package:flutter_app/my_home.dart';

// import 'alert_box.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner:  false,
      theme: ThemeData(
        primarySwatch: Colors.blue,

      ),
      home: MyHomePage(title: "Flutter App",),
    );
  }
}

