import 'package:flutter/material.dart';
import 'package:todo_app/models/item.dart';

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

class HomePage extends StatefulWidget {
  var items = new List<Item>();

  HomePage() {
    items = [];
    items.add(Item(titulo: 'Item 1', done: false));
    items.add(Item(titulo: 'Item 2', done: true));
    items.add(Item(titulo: 'Item 3', done: false));
  }
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Text('Inicio'),
          title: Text('Meu Primeiro Flutter App'),
          centerTitle: true,
          actions: <Widget>[
            Icon(Icons.arrow_right),
          ],
        ),
        body: ListView.builder(
          itemCount: widget.items.length,
          itemBuilder: (BuildContext buildContext, int index) {
            final item = widget.items[index];
            return CheckboxListTile(
              title: Text(item.titulo),
              key: Key(item.titulo),
              value: item.done,
              onChanged: (value) {
                print(value);
                setState(() {
                  item.done = value;
                });
              },
            ); // Center(child: Text(item.titulo));
          },
        ));
  }
}
