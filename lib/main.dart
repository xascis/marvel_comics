import 'package:flutter/material.dart';
import 'package:marvel_comics/character_model.dart';
import 'package:marvel_comics/main_controller.dart';

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
  List<Character> characters = new List<Character>();

  @override
  Widget build(BuildContext context) {
    Widget titleSection = new Center(
      child: new Container(
        margin: const EdgeInsets.only(top: 10.0),
        padding: const EdgeInsets.all(5.0),
        child: new Text(
          'Busca tu Súper-Héroe',
          style: new TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );

    Widget textFieldSuperHero = new Center(
      child: new Container(
        margin: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
        child: new TextField(
          textAlign: TextAlign.center,
          onChanged: textFieldChanged(),
          style: new TextStyle(fontSize: 22.0, color: Colors.black),
//          decoration: new InputDecoration(hintText: 'Busca tu Súper-Héroe'),
        ),
      ),
    );

    Widget createListView(BuildContext context, AsyncSnapshot snapshot) {
      List<Character> characters = snapshot.data;
      return new Expanded(
        child: new ListView.builder(
            itemCount: characters.length,
            itemBuilder: (BuildContext context, int index) {
              return new Column(
                children: <Widget>[
                  new ListTile(
                    onTap: null,
                    leading: new Image.network(
                      characters[index].thumbnail,
                    ),
                    title: new Text(
                      characters[index].name,
                      style: new TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    trailing: const Icon(Icons.favorite),
                    subtitle: new Text(
                      characters[index].description,
                      style: new TextStyle(fontSize: 15.0),
                    ),
                  ),
                  new Divider(
                    height: 2.0,
                  ),
                ],
              );
            }),
      );
    }

    var listViewCharacter = new Expanded(
      child: new ListView.builder(
          itemCount: characters.length,
          itemBuilder: (BuildContext context, int index) {
            return new Column(
              children: <Widget>[
                new ListTile(
                  onTap: null,
                  leading: new Image.network(
                    characters[index].thumbnail,
                  ),
                  title: new Text(
                    characters[index].name,
                    style: new TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  trailing: const Icon(Icons.favorite),
                  subtitle: new Text(
                    characters[index].description,
                    style: new TextStyle(fontSize: 15.0),
                  ),
                ),
                new Divider(
                  height: 2.0,
                ),
              ],
            );
          }),
    );

    var listViewTest = new FutureBuilder(
//        future: getData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      switch (snapshot.connectionState) {
        case ConnectionState.none:
          return new Text('');
        case ConnectionState.waiting:
          return new CircularProgressIndicator();
        default:
          if (snapshot.hasError) {
            return new Text('Error en la conexión.');
          } else {
            return createListView(context, snapshot);
          }
      }
    });

//    Widget listViewSuperHeroes = new Expanded(
//        child: new ListView.builder(
//            padding: new EdgeInsets.all(5.0),
//            itemBuilder: (BuildContext context, int index) {
//              return new ListTile(
//                onTap: null,
//                leading: new Image.network(
//                    'http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784.jpg',
//                    width: 80.0,
//                    height: 80.0),
//                title: new Text(
//                  'Esta es la entrada $index',
//                  style: new TextStyle(
//                    fontSize: 20.0,
//                  ),
//                ),
//                trailing: const Icon(Icons.favorite),
//                subtitle: new Text(
//                  'Esta es la descripción del super heroe de Marvel desde la página web de la la API.',
//                  style: new TextStyle(fontSize: 15.0),
//                ),
//              );
//            }));

    Widget buttonGetData = new RaisedButton(
      onPressed: getData,
      child: new Text(
        'Buscar',
        style: new TextStyle(fontWeight: FontWeight.bold),
      ),
    );

//    Widget addItemListView(int index) {
//      return new ListTile(
//        title: new Text(
//          'Esta es la entrada $index',
//          style: new TextStyle(
//            fontSize: 20.0,
//          ),
//        ),
//      );
//    }

//    Widget itemListView = new Row(
//      children: <Widget>[
//        new Column(
//          children: <Widget>[
//            new Container(
//              width: 100.0,
//              height: 100.0,
//            )
//          ],
//        ),
//        new Column(
//          children: <Widget>[
//            new Text(
//              'Nombre del súper héroe',
//              style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
//            ),
//            new Text(
//              'Esta será la descripción del super heroe donde indicará todo lo realacionado con el mismo.',
//              style: new TextStyle(
//                fontSize: 15.0,
//              ),
//            )
//          ],
//        )
//      ],
//    );

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
          buttonGetData,
          listViewCharacter,
          new Container(
            margin: const EdgeInsets.all(10.0),
            child: new Text(
              'Data provided by Marvel. © 2014 Marvel',
              style: new TextStyle(fontSize: 10.0, fontStyle: FontStyle.italic),
            ),
          )
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
