import 'package:flutter/material.dart';
import 'package:marvel_comics/character_model.dart';
import 'package:marvel_comics/detail.dart';
import 'package:marvel_comics/main_controller.dart';

class _TextAttributionMarvel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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

class _LoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return new Center(
        child: new CircularProgressIndicator()
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
  MainController _mainController = new MainController();
  List<Character> _characters;
  bool _itsBusy = false;
  String _textError;
  String _oldText = '';
  final FocusNode _focusNode = new FocusNode();

  void _pushAboutDialog(BuildContext context) async {
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

  void _checkTextField(String text) async {
    _oldText = text;
    await new Future.delayed(new Duration(seconds: 2));
    if (text.length >= 3 && _oldText == text) {
      _focusNode.unfocus();
      setState((){
        _itsBusy = true;
      });
      await _mainController.getData(text);
      setState(() {
        _characters;
        _itsBusy = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    _characters = _mainController.characters;
    _textError = _mainController.textError;

    Widget _textFieldSuperHero = new Container(
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
          _checkTextField(text);
        },
        style: TextStyle(fontSize: 22.0, color: Colors.black),
      ),
    );

    Widget _textResults = new Center(
      child: new Text(
        '$_textError',
        style: new TextStyle(
          fontSize: 20.0,
          color: Colors.grey,
        ),
      ),
    );

    Widget _listViewCharacter = new ListView.builder(
      itemCount: _characters.length ?? 0 ,
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
                      builder: (BuildContext context) => new DetailPage(character: _characters[index]),
                    ),
                  );
                },
                leading: new Image.network(
                  _characters[index].thumbnail,
                ),
                title: new Text(
                  _characters[index].name,
                  style: new TextStyle(fontSize: 20.0),
                  maxLines: 1,
                ),
                subtitle: new Text(
                  _characters[index].description,
                  style: new TextStyle(fontSize: 15.0),
                  maxLines: 3,
                ),
              ),
            ),
            new Divider(height: 2.0),
          ],
        );
      }
    );

    Widget _listViewHandler () {
      if (_itsBusy) return _LoadingIndicator();
      if (_textError.isNotEmpty) return _textResults;
      return _listViewCharacter;
    }

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
        actions: <Widget>[
          new IconButton(
            icon: const Icon(Icons.chat),
            onPressed: () { _pushAboutDialog(context); },
          ),
        ],
      ),
      body: new Column(
        children: <Widget>[
          _textFieldSuperHero,
          Expanded(
            child: _listViewHandler(),
          ),
          _TextAttributionMarvel(),
        ],
      ),
    );
  }

}