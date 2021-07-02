import 'package:flutter/material.dart';
import 'package:flutter_ejerciciobloc/src/pages/inicio_page.dart';
import 'package:flutter_ejerciciobloc/src/pages/suma_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplicaciones bloc',
      initialRoute: '/',
      routes: <String,WidgetBuilder>{
        '/'         : (BuildContext context) => InicioPage(),
        'suma'      : (BuildContext context) => SumaPage()
      },

    );
  }
}