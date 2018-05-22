import 'package:flutter/material.dart';
import 'package:marvel_comics/character_model.dart';
import 'dart:async';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatefulWidget {
  final Character character;

  DetailPage({Key key, this.character}) : super (key: key);

  @override
  _DetailPageState createState() => new _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {



  @override
  Widget build(BuildContext context){
    Character character = widget.character;

    Widget imageHero =  new Image.network(
      character.thumbnail,
      height: 100.0,
      width: 100.0,
    );

    Widget nameHero = new Text(
      character.name, 
      style: new TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold), 
      maxLines: 2,
    );

    Widget descriptionHero = new Text (
      character.description,
      style: new TextStyle(fontSize: 15.0),
      maxLines: 3,
    );

    Widget heroDetails = new Container(
      padding: const EdgeInsets.all(5.0),
      child: new Row(
        children: <Widget>[
          new Column(
            children: <Widget>[
              imageHero,
            ],
          ),
          new Expanded(
            child: new Container(
              padding: const EdgeInsets.only(left: 5.0, right: 5.0),
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Container(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: nameHero,
                  ),
                  descriptionHero,
                ],
              ),
            ),
          )
        ],
      ),
    );

    Widget linksHero = new Row(
      children: <Widget>[
        new Container(
          padding: const EdgeInsets.all(5.0),
          child: new Text(
            'Links',
            style: new TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );

    Future _launchUrl(String url) async {
      if (await canLaunch(url)) {
        await launch(url, forceWebView: true);
      }
    }

    Widget buttonsHero = new Container(
      padding: const EdgeInsets.all(5.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          new RaisedButton(
            onPressed: (character.urlDetail != null) ? () {_launchUrl(character.urlDetail);} : null,
            child: new Text(
              'Detalles', 
              style: new TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),
          new RaisedButton(
            onPressed: (character.urlWiki != null) ? () {_launchUrl(character.urlWiki);} : null,
            child: new Text(
              'Wiki', 
              style: new TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),
          new RaisedButton(
            onPressed: (character.urlComics != null) ? () {_launchUrl(character.urlComics);} : null,
            child: new Text(
              'Comics', 
              style: new TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );

    Widget resourcesHero = new Row(
      children: <Widget>[
        new Container(
          padding: const EdgeInsets.all(5.0),
          child: new Text(
            'Resources',
            style: new TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );

    Widget tabBar = new DefaultTabController(
      length: 2,
      child: new TabBar(
        tabs: [
          new Tab(text: 'Comics',),
          new Tab(text: 'Eventos')
        ]
      )
    );

    Widget tabBarView = new TabBarView(
      children: [
        new Text('Comics'),
        new Text('Eventos')
      ]
    );

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(character.name),
      ),
      body: new Container(
        padding: const EdgeInsets.all(5.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            heroDetails,
            linksHero,
            buttonsHero,
            resourcesHero,
            tabBar,
            tabBarView,
          ],
        ),
      ),
    );
  }
}

// class DetailPage extends StatelessWidget {
//   final Character character;

//   DetailPage({Key key, this.character}) : super(key: key);
  
//   @override
//   Widget build(BuildContext context){
//     String characterName = character.name;
//     return new Scaffold(
//       appBar: new AppBar(
//         title: new Text('Hello'),
//       ),
//       body: new Column(
//         children: <Widget>[
//           new Text('$characterName')
//         ],
//       ),
//     );
//   }
// }