import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testapp/Screen1.dart';
import 'package:testapp/routes.dart';

GlobalKey globalKey = GlobalKey();
GlobalKey globalKey1 = GlobalKey();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Nunito"),
      debugShowCheckedModeBanner: false,
      home: Screen1(),
      routes: routes,
    );
  }
}
