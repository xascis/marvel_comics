import 'dart:async';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:marvel_comics/character_model.dart';
import 'package:marvel_comics/comic_model.dart';
import 'package:marvel_comics/detail_controller.dart';

// TODO: pasar a un widgetless y ordenar mejor los widgets

//class DetailPage extends StatefulWidget {
//  final Character character;
//
//  DetailPage({Key key, this.character}) : super (key: key);
//
//  @override
//  _DetailPageState createState() => new _DetailPageState();
//}

class DetailPage extends StatelessWidget {
  DetailPage({Key key, @required this.character}) : super (key: key);
  final Character character;

  final DetailController detailController = new DetailController();

  @override
  Widget build(BuildContext context){
    Map availableComics = character.availableComics;
    Map urls = character.urls;
    int numberComics = availableComics['comics'];
    int numberEvents = availableComics['events'];

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
            onPressed: (urls['detail'] != null) ? () {_launchUrl(urls['detail']);} : null,
            child: new Text(
              'Detalles', 
              style: new TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),
          new RaisedButton(
            onPressed: (urls['wiki'] != null) ? () {_launchUrl(urls['wiki']);} : null,
            child: new Text(
              'Wiki', 
              style: new TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),
          new RaisedButton(
            onPressed: (urls['comiclink'] != null) ? () {_launchUrl(urls['comiclink']);} : null,
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
            'Recursos',
            style: new TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );

    Column loadingIndicator = new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        new CircularProgressIndicator()
      ],
    );

    Column textResults(String textError) {
      return new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Text(
            '$textError',
            style: new TextStyle(
              fontSize: 20.0,
              color: Colors.grey,
            ),
          ),
        ],
      );
    }

    ListView listViewComics(List<Comic> comics) {
      return new ListView.builder(
        itemCount: comics == null ? 0 : comics.length,
        itemBuilder: (BuildContext context, int index) {
          return new Column(
            children: <Widget>[
              new Container(
                padding: new EdgeInsets.all(5.0),
                child: new ListTile(
                  onTap: null,
                  leading: new Image.network(
                    comics[index].thumbnail,
                  ),
                  title: new Text(
                    comics[index].title,
                    style: new TextStyle(
                      fontSize: 20.0,
                    ),
                    maxLines: 1,
                  ),
                  subtitle: new Text(
                    comics[index].description,
                    style: new TextStyle(fontSize: 15.0),
                    maxLines: 3,
                  ),
                ),
              ),
              new Divider(
                height: 2.0,
              ),
            ],
          );
        }
      );
    }

    FutureBuilder tabBarView (String type) {
      return new FutureBuilder(
        future: detailController.getComics(character, type),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return loadingIndicator;
            default:
              if (snapshot.hasError) {
                return textResults('Error en la conexión');
              } else if (character.availableComics[type] != 0) {
                return listViewComics(snapshot.data);
              } else {
                return textResults('No existen resultados');
              }
//              switch (type) {
//                case 'comics':
//                  if (snapshot.hasError) {
//                    return textResults('Error en la conexión');
//                  } else if (character.availableComics[type] != 0) {
//                    // print(snapshot.data);
//                    return listViewComics(snapshot.data);
//                  } else {
//                    return textResults('No existen resultados');
//                  }
//                  break;
//                default:
//                  if (snapshot.hasError) {
//                    return textResults('Error en la conexión');
//                  } else if (character.numberEvents != 0) {
//                    // print(snapshot.data);
//                    return listViewComics(snapshot.data);
//                  } else {
//                    return textResults('No existen resultados');
//                  }
//              }
          }
        }
      );
    }

    Widget tabBar = new Expanded(
      child: new Container(
        padding: const EdgeInsets.all(5.0),
        child: new DefaultTabController(
          length: 2,
          child: new Column(
            children: <Widget>[
              new TabBar(
                labelColor: Colors.red[900],
                labelStyle: new TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                tabs: [
                  new Tab(text: '($numberComics) Comics'),
                  new Tab(text: '($numberEvents) Eventos'),
                ]
              ),
              new Expanded(
                child: new TabBarView(
                  children: [
                    tabBarView('comics'),
                    tabBarView('events'),
                  ]
                ),
              ),
            ],
          )
        ),
      )
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
          ],
        ),
      ),
    );
  }
}