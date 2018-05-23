import 'package:marvel_comics/character_model.dart';
import 'package:marvel_comics/comic_model.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class DetailController {
  List<Comic> comics = new List<Comic>();
  List<Comic> events = new List<Comic>();

  String textErrorComics = '';
  String textErrorEvents = '';
  bool _itsbusycomics = false;
  bool _itsbusyevents = false;
  bool _showerrorcomics = false;
  bool _showerrorevents = false;

  bool get itsBusyComics => _itsbusycomics;
  set itsBusyComics(bool itsbusycomics) {this._itsbusycomics = itsbusycomics;}

  bool get itsBusyEvents => _itsbusyevents;
  set itsBusyEvents(bool itsbusyevents) {this._itsbusyevents = itsbusyevents;}

  bool get showErrorComics => _showerrorcomics;
  set showErrorComics(bool showerrorcomics) {this._showerrorcomics = showerrorcomics;}

  bool get showErrorEvents => _showerrorevents;
  set showErrorEvents(bool showerrorevents) {this._showerrorevents = showerrorevents;}

  getComics(Character character) async {
    if (character.numberComics == 0){
      textErrorComics = 'No existen resultados.';
      showErrorComics = true;
      return;
    }
    try {
      if (itsBusyComics) return;
      itsBusyComics = true;
      showErrorComics = false;

      comics.clear();

      var response = await http.get(
          "https://gateway.marvel.com/v1/public/" + "comics" +
              "?apikey=2c8c7e04677efe9a1a8625342ae2bac8&ts=10&hash=f8a89c483b2f946c754fc7262c34db1a" +
              "&limit=20" + "&characters=" + character.id.toString());
      final responseJson = jsonDecode(response.body);
      var data = responseJson['data']['results'];

      if (responseJson['data']['count'] == 0) {
        textErrorComics = 'No se han encontrado resultados';
        showErrorComics = true;
      } else {
        textErrorComics = '';

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
      }
    } catch (ex) {
      textErrorComics = 'Error en la conexión.';
      showErrorComics = true;
      print('error en la conexión');
      return ex;
    } finally {
      itsBusyComics = false;
    }
  }
}