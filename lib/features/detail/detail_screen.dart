import 'package:flutter/material.dart';
import 'package:marvel_comics/common/theme.dart';
import 'package:marvel_comics/domain/models/character.dart';

class DetailScreen extends StatelessWidget {
  final Character character;
  
  DetailScreen(this.character);

  static void open(BuildContext context, {@required Character character}) {
    Navigator.push(
      context, 
      MaterialPageRoute(builder: (BuildContext context) => DetailScreen(character))
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.6,
            child: Stack(
              children: <Widget>[
                Image(
                  image: NetworkImage("${character.thumbnail.path}.${character.thumbnail.extension}"),
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fitWidth,
                ),
                Positioned(
                  left: 1.0,
                  top: 1.0,
                  child: SafeArea(
                    child: IconButton(
                      icon: Icon(Icons.arrow_back),
                      color: Colors.grey[300],
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 1.0,
                  right: 1.0,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                    child: Text(
                      "${character.name}", 
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: bigText.copyWith(
                        fontWeight: FontWeight.bold, 
                        color: Colors.grey[100], 
                        shadows: [Shadow(offset: Offset.fromDirection(0.0, 2.0)), Shadow(offset: Offset.fromDirection(1.0, 2.0))]
                      ), 
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: SafeArea(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                  child: Text("${character.description}", style: regularText.copyWith(color: Colors.white),),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}