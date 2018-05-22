import 'package:flutter/material.dart';
import 'package:marvel_comics/character_model.dart';

class DetailPage extends StatefulWidget {
  Character character;

  DetailPage(Character character){
    this.character = character;
  }

  @override
  _DetailPageState createState() => new _DetailPageState(character);
}

class _DetailPageState extends State<DetailPage> {
  Character character;

  _DetailPageState (Character character){
    this.character = character;
  }
  
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Detalles'),
      ),
      body: new Column(
        children: <Widget>[
          new Text('Aquí van los datos de la página')
        ],
      ),
    );
  }
}