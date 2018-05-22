import 'package:flutter/material.dart';
import 'package:marvel_comics/character_model.dart';

class DetailPage extends StatefulWidget {
  final Character character;

  DetailPage({Key key, this.character}) : super (key: key);

  @override
  _DetailPageState createState() => new _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  
  @override
  Widget build(BuildContext context){
    String characterName = widget.character.name;
    String characterDescription = widget.character.description;
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('$characterName'),
      ),
      body: new Column(
        children: <Widget>[
          new Text('$characterDescription',
            style: new TextStyle(fontSize: 20.0),
          )
        ],
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