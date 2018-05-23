import 'package:marvel_comics/character_model.dart';
import 'package:marvel_comics/comic_model.dart';

import 'package:http/http.dart' as http;

import 'dart:convert';
import 'dart:async';

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
    // if (character.numberComics == 0){
    //   // textErrorComics = 'No existen resultados.';
    //   // showErrorComics = true;
    //   return;
    // }

    try {
      // if (itsBusyComics) return;
      // itsBusyComics = true;
      // showErrorComics = false;

      // if (itsBusy) return;
      // itsBusy = true;

      List<Comic> comics = new List<Comic>();
      comics.clear();

      var response = await http.get(
          "https://gateway.marvel.com/v1/public/" + type +
              "?apikey=2c8c7e04677efe9a1a8625342ae2bac8&ts=10&hash=f8a89c483b2f946c754fc7262c34db1a" +
              "&limit=20" + "&characters=" + character.id.toString());
      final responseJson = jsonDecode(response.body);
      var data = responseJson['data']['results'];

      // if (responseJson['data']['count'] == 0) {
      //   textErrorComics = 'No se han encontrado resultados';
      //   showErrorComics = true;
      // } else {
      //   textErrorComics = '';

        // utilizar un Map
        for (var item in data) {
          Comic comic = new Comic();
          comic.title = item['title'];
          if (item['description'] == null) {
            comic.description = '';
          } else {
            comic.description = item['description'];
          }
          comic.thumbnail = item['thumbnail']['path'] + '.' +
              item['thumbnail']['extension'].toString().toLowerCase();

          comics.add(comic);
        }

        return comics;
      // }
    } catch (ex) {
      // textErrorComics = 'Error en la conexión.';
      // showErrorComics = true;
      // print('error en la conexión');
      return ex;
    } finally {
      // itsBusyComics = false;
      // itsBusy = false;
    }
  }
}