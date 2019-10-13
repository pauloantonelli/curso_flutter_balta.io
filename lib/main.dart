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
  var newTaskCtrl = TextEditingController();

  void addNewItemList() {
    if (newTaskCtrl.text.isEmpty) return;
    setState(() {
      widget.items.add(Item(titulo: newTaskCtrl.text, done: false));
      newTaskCtrl.text = '';
      // newTaskCtrl.clear(); // limpa o texto do input
    });
  }

  void removeItemList(int index) {
    setState(() {
      widget.items.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Text('Inicio'),
        title: TextFormField(
          controller: newTaskCtrl,
          keyboardType: TextInputType.text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
          decoration: InputDecoration(
            labelText: 'Digite sua nova tarefa',
            labelStyle: TextStyle(color: Colors.white),
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          Icon(Icons.arrow_right),
        ],
      ),
      body: ListView.builder(
        itemCount: widget.items.length,
        itemBuilder: (BuildContext buildContext, int index) {
          final item = widget.items[index];
          return Dismissible(
            child: CheckboxListTile(
              title: Text(item.titulo),
              value: item.done,
              onChanged: (value) {
                print(value);
                setState(() {
                  item.done = value;
                });
              },
            ),
            key: Key(item.titulo),
            onDismissed: (direction) {
              print(direction);
              if (direction == DismissDirection.startToEnd) {
                removeItemList(index);
              } else if (direction == DismissDirection.endToStart) {
                removeItemList(index);
              }
            },
            background: Container(
              color: Colors.red.withOpacity(0.3),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('Botao pressionado');
          addNewItemList();
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
      ),
    );
  }
}
