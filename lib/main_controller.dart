import 'character_model.dart';

import 'dart:io';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

Future<List<Character>> getData(String textFieldName) async{
  try {
    var response =  await http.get('https://gateway.marvel.com/v1/public/characters?apikey=2c8c7e04677efe9a1a8625342ae2bac8&ts=10&hash=f8a89c483b2f946c754fc7262c34db1a&orderBy=name' + '&nameStartsWith=' + textFieldName);
    final responseJson = jsonDecode(response.body);
//    print(responseJson['data']['results']);
    var data = responseJson['data']['results'];

    List<Character> characters = new List<Character>();
    for (var item in data){
      Character character = new Character();
      character.name = item['name'];
      character.description = item['description'];
      character.id = item['id'];
      character.thumbnail = item['thumbnail']['path'] + '.' + item['thumbnail']['extension'].toString().toLowerCase();
      characters.add(character);
    };

    print(characters[0].thumbnail);

    return characters;

  } catch (Exception){
    print("Error");
  }
}