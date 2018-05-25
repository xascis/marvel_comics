import 'dart:async';

import 'package:flutter/material.dart';
import 'package:marvel_comics/character_model.dart';
import 'package:marvel_comics/main_controller.dart';
import 'package:marvel_comics/detail.dart';

// TODO: pasar a widgetless, implementar controlador textfield, cambiar apariencia textfield, eliminar text inicial

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Marvel Comic',
      theme: new ThemeData(
          primarySwatch: Colors.red,
          primaryColorDark: Colors.red[800],
          accentColor: Colors.orangeAccent,
      ),
      home: new MyHomePage(title: 'Marvel'),
    );
  }
}

Future _pushAboutDialog(BuildContext context) async {
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
      }
  );
}

class _TextAttributionMarvel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Center(
      child: new Container(
        padding: EdgeInsets.all(5.0),
        child: new Text(
          'Data provided by Marvel. © 2014 Marvel',
          style: new TextStyle(fontSize: 10.0, fontStyle: FontStyle.italic),
        ),
      ),
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
  String textFieldName;
  MainController mainController = new MainController();
  List<Character> characters;
  bool itsBusy;
  bool showError;
  String textError;
  String oldText;
  final FocusNode _focusNode = new FocusNode();

  @override
  Widget build(BuildContext context) {
    characters = mainController.characters;
    itsBusy = mainController.itsBusy;
    showError = mainController.showError;
    textError = mainController.textError;

    Future checkTextField(String text) async {
      oldText = text;
      await new Future.delayed(new Duration(seconds: 2));
      if (text.length >= 3 && oldText == text) {
        _focusNode.unfocus();
        await mainController.getData(text);
        setState(() {
          characters;
          itsBusy;
          showError;
        });
      }
    }

//    Widget titleSection = new Center(
//      child: new Container(
//        margin: const EdgeInsets.only(top: 10.0),
//        padding: const EdgeInsets.all(5.0),
//        child: new Text(
//          'Busca tu Súper-Héroe',
//          style: new TextStyle(
//            fontSize: 20.0,
//            fontWeight: FontWeight.bold,
//          ),
//        ),
//      ),
//    );

    Widget textFieldSuperHero = new Container(
      margin: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0, top: 10.0),
      child: TextField(
        focusNode: _focusNode,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          labelText: 'Busca a tu Súper-Héroe',
          labelStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
          filled: true,
        ),
        onChanged: (text) {
          checkTextField(text);
        },
        style: TextStyle(fontSize: 22.0, color: Colors.black),
      ),
    );

    Widget loadingIndicator = new Expanded(
      child : new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new CircularProgressIndicator()
        ],
      )
    );

    Widget labelResults = new Expanded(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Container(
            child: new Text(
              '$textError',
              style: new TextStyle(
                fontSize: 20.0,
                color: Colors.grey,
              ),
            ),
          )
        ],
      ),
    );

    Widget listViewCharacter = new Expanded(
      child: new ListView.builder(
        itemCount: characters == null ? 0 : characters.length,
        itemBuilder: (BuildContext context, int index) {
          return new Column(
            children: <Widget>[
              new Container(
                padding: new EdgeInsets.all(5.0),
                child: new ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      new MaterialPageRoute(
                        builder: (BuildContext context) => new DetailPage(character: characters[index]),
                      ), 
                    );
                  },
                  leading: new Image.network(
                    characters[index].thumbnail,
                  ),
                  title: new Text(
                    characters[index].name,
                    style: new TextStyle(fontSize: 20.0),
                    maxLines: 1,
                  ),
                  subtitle: new Text(
                    characters[index].description,
                    style: new TextStyle(fontSize: 15.0),
                    maxLines: 3,
                  ),
                ),
              ),
              new Divider(height: 2.0),
            ],
          );
        }
      )
    );

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
        actions: <Widget>[
          new IconButton(
            icon: const Icon(Icons.chat),
            onPressed: () {_pushAboutDialog(context);},
          ),
        ],
      ),
      body: new Column(
        children: <Widget>[
          textFieldSuperHero,
          // TODO: cambiar esto de ahí abajo
          !itsBusy && !showError ? listViewCharacter : new Container(),
          itsBusy ? loadingIndicator : new Container(),
          showError ? labelResults : new Container(),
          _TextAttributionMarvel(),
        ],
      ),
    );
  }

}