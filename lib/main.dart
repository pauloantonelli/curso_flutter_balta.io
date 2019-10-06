import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello Flutter App',
      debugShowCheckedModeBanner: true,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        // primaryColor: Colors.purple,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /*return Container(
      child: Text('Olá Mundo lol'),
    );*/
    return Scaffold(
      appBar: AppBar(
        leading: Text('Inicio'),
        title: Text('Meu Primeiro Flutter App'),
        centerTitle: true,
        actions: <Widget>[
          Icon(Icons.arrow_right),
        ],
      ),
      body: Container(
        child: Center(
          child: Text('Olá Mundo Flutter App'),
        ),
      ),
    );
  }
}
