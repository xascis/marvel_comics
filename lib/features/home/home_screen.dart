import 'package:flutter/material.dart';
import 'package:marvel_comics/bloc/bloc_provider.dart';
import 'package:marvel_comics/bloc/character_bloc.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<CharacterBloc>(context);
    
    return Scaffold(
      appBar: buildAppBar(),
      body: Column(
        children: <Widget>[
          buildSearchBar(),
          buildCharacterList(),
          buildAttributeText(),
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text("Marvel Comics"),
    );
  }
  Container buildSearchBar() {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: TextField(
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 22.0, color: Colors.black),
        decoration: InputDecoration(
          labelText: 'Busca a tu Súper-Héroe',
          labelStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
          filled: true,
        ),
        onChanged: (text) {print(text);},
      ),
    );
  }
  Expanded buildCharacterList() {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return buildCharacterTile();
        }
      ),
    );
  }
  Column buildCharacterTile() {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(5.0),
          child: ListTile(
            onTap: () {},
            leading: Icon(Icons.ac_unit),
            title: Text(
              "Hero name",
              style: TextStyle(fontSize: 20.0),
              maxLines: 1,
            ),
            subtitle: Text(
              "Hero description",
              style: TextStyle(fontSize: 15.0),
              maxLines: 3,
            ),
          ),
        ),
        Divider(height: 2.0),
      ],
    );
  }
  Center buildAttributeText() {
    return Center(
      child: Container(
        padding: EdgeInsets.all(5.0),
        child: Text(
          'Data provided by Marvel. © 2018 Marvel',
          style: TextStyle(fontSize: 10.0, fontStyle: FontStyle.italic),
        ),
      ),
    );
  }
}