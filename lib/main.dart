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
        margin: const EdgeInsets.all(5.0),
        padding: const EdgeInsets.all(10.0),
        child: new TextField(
          textAlign: TextAlign.start,
          onChanged: textFieldChanged(),
          style: new TextStyle(fontSize: 22.0, color: Colors.black),
          decoration: new InputDecoration(
            hintText: 'Busca tu Súper-Héroe'
          ),
        ),
      ),
    );

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
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

  textFieldChanged(){}
}
