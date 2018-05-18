import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
          primarySwatch: Colors.red, primaryColorDark: Colors.red[800]),
      home: new MyHomePage(title: 'Marvel'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Widget titleSection = new Center(
      child: new Container(
        margin: const EdgeInsets.only(top: 10.0),
        padding: const EdgeInsets.all(5.0),
        child: new Text(
          'Busca tu Súper-Héroe',
          style: new TextStyle(
            fontSize: 23.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );

    Widget textFieldSuperHero = new Center(
      child: new Container(
        margin: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: new TextField(
          textAlign: TextAlign.center,
          onChanged: textFieldChanged(),
          style: new TextStyle(fontSize: 22.0, color: Colors.black),
          decoration: new InputDecoration(hintText: 'Busca tu Súper-Héroe'),
        ),
      ),
    );

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
        actions: <Widget>[
          new IconButton(
            icon: const Icon(Icons.chat),
            onPressed: _pushAboutDialog,
          ),
        ],
      ),
      body: new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          titleSection,
          textFieldSuperHero,
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _pushAboutDialog() async {
    await showDialog(
        context: context,
        builder: (BuildContext context) {
      return new SimpleDialog(
        title: const Text('Aplicación creada con Flutter'),
        children: <Widget>[
          new SimpleDialogOption(
            child: const Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      );
    });
  }

  textFieldChanged() {}
}
