import 'package:marvel_comics/character_model.dart';
import 'package:marvel_comics/comic_model.dart';

import 'package:http/http.dart' as http;

import 'dart:convert';
import 'dart:async';

// simplificar, pasar a map

class DetailController {
  
  Future<List<Comic>> getComics(Character character, String type) async {
    switch (type){
      case 'comics':
        if (character.numberComics == 0) return;
        break;
      default:
        if (character.numberEvents == 0) return;
        break;
    }

    try {
      List<Comic> comics = new List<Comic>();
      comics.clear();

      var response = await http.get(
          "https://gateway.marvel.com/v1/public/" + type +
              "?apikey=2c8c7e04677efe9a1a8625342ae2bac8&ts=10&hash=f8a89c483b2f946c754fc7262c34db1a" +
              "&limit=20" + "&characters=" + character.id.toString());
      final responseJson = jsonDecode(response.body);
      var data = responseJson['data']['results'];

      for (var item in data) {
        Comic comic = new Comic();
        comic.title = item['title'];
        (item['description'] == null)
            ? comic.description = ''
            : comic.description = item['description'];
        comic.thumbnail = item['thumbnail']['path'] + '.' +
            item['thumbnail']['extension'].toString().toLowerCase();

        comics.add(comic);
      }

      return comics;
    } catch (ex) {
      return ex;
    }
  }
}