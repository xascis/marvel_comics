import 'package:flutter/material.dart';
import 'package:marvel_comics/character_model.dart';
import 'package:marvel_comics/comic_model.dart';
import 'package:marvel_comics/detail_controller.dart';
import 'dart:async';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatefulWidget {
  final Character character;

  DetailPage({Key key, this.character}) : super (key: key);

  @override
  _DetailPageState createState() => new _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  DetailController detailController = new DetailController();
  List<Comic> comics;
  List<Comic> events;
  bool itsBusyComics;
  bool itsBusyEvents;
  bool showErrorComics;
  bool showErrorEvents;
  String textErrorComics;
  String textErrorEvents;



  @override
  Widget build(BuildContext context){
    Character character = widget.character;
    comics = detailController.comics;
    events = detailController.events;
    showErrorComics = detailController.showErrorComics;
    showErrorEvents = detailController.showErrorEvents;
    itsBusyComics = detailController.itsBusyComics;
    itsBusyEvents = detailController.itsBusyEvents;
    int numberComics = character.numberComics;
    int numberEvents = character.numberEvents;
    textErrorComics = detailController.textErrorComics;
    textErrorEvents = detailController.textErrorEvents;

    void getData() async{
//      setState((){
//        itsBusyComics;
//        showErrorComics;
//      });

      await detailController.getComics(character);
//      await detailController.getEvents(character);

//      setState(() {
//        comics;
//        itsBusyComics;
//        showErrorComics;
//      });
    }

    getData();


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

    Widget loadingIndicator = new Expanded(
        child : new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new CircularProgressIndicator()
          ],
        )
    );

    Expanded labelResults(String textError) {
      return new Expanded(
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
    }

    Expanded listViewComics(List<Comic> comics) {
      new Expanded(
          child: new ListView.builder(
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
//                    trailing: const Icon(Icons.favorite),
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
          )
      );
    }

    showComics() {

    }

    Widget tabBar = new Expanded(
      child: new Container(
        padding: const EdgeInsets.all(5.0),
        child: new DefaultTabController(
          length: 2,
          child: new Column(
//          crossAxisAlignment: CrossAxisAlignment.start,
//          mainAxisAlignment: MainAxisAlignment.start,
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
//                      new Column(
//                        children: <Widget>[
//                          listViewComics(comics),
////                          !itsBusyComics && !showErrorComics ? listViewComics(comics) : new Container(),
////                          itsBusyComics ? loadingIndicator : new Container(),
////                          showErrorComics ? labelResults(textErrorComics) : new Container(),
//                        ],
//                      ),
                      listViewComics(comics),
                      new Text('Los eventos van aquí'),
                    ]
                ),
              ),
            ],
          )
        ),
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