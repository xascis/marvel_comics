import 'package:bloc_provider/bloc_provider.dart';
import 'package:flutter/material.dart';
import 'package:marvel_comics/bloc/character_bloc.dart';
import 'package:marvel_comics/common/theme.dart';
import 'package:marvel_comics/domain/models/character.dart';
import 'package:marvel_comics/features/detail/detail_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<CharacterBloc>(context);
    
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: <Widget>[
              buildSearchBar(bloc),
              buildCharacterList(bloc),
            ],
          ),
          // bottomNavigationBar: buildAttributeText(context),
        ),
      ),
    );
  }

  Container buildSearchBar(CharacterBloc bloc) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: TextField(
        textAlign: TextAlign.center,
        style: biggerText.copyWith(color: Colors.black),
        decoration: InputDecoration(
          hintText: 'Search your Hero',
          filled: false,
          border: UnderlineInputBorder(),
        ),
        onChanged: bloc.searchName,
      ),
    );
  }
  Expanded buildCharacterList(CharacterBloc bloc) {
    return Expanded(
      child: StreamBuilder(
        initialData: [],
        stream: bloc.characterList, 
        builder: (BuildContext context, AsyncSnapshot<List> asyncSnapshot) { 
          return ListView.builder(
            itemCount: asyncSnapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              Character character = asyncSnapshot.data[index];
              return buildCharacterTile(context, character: character);
            }
          );
        }
      ),
    );
  }
  Widget buildCharacterTile(BuildContext context, {@required Character character}) {
    return InkWell(
      onTap: () => DetailScreen.open(context, character: character),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.3,
        child: Stack(
          children: <Widget>[
            Image(
              image: NetworkImage("${character.thumbnail.path}.${character.thumbnail.extension}"),
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fitWidth,
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
    );
  }
  BottomAppBar buildAttributeText(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 5.0,
      child: Container(
        padding: EdgeInsets.all(5.0),
        child: Text(
          'Data provided by Marvel. © 2018 Marvel',
          textAlign: TextAlign.center,
          style: smallText.copyWith(fontStyle: FontStyle.italic),
        ),
      ),
    );
  }
}