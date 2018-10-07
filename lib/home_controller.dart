import 'dart:convert';

import 'package:http/http.dart' as http;

import 'character_model.dart';

class HomeController {
  List<Character> characters = new List<Character>();
  String textError = '';

  getData(String textFieldHeroName) async{
    try {
      characters.clear();

      var response =  await http.get('https://gateway.marvel.com/v1/public/characters?apikey=2c8c7e04677efe9a1a8625342ae2bac8&ts=10&hash=f8a89c483b2f946c754fc7262c34db1a&orderBy=name'+ '&limit=50' + '&nameStartsWith=' + textFieldHeroName);
      final responseJson = jsonDecode(response.body);
      var data = responseJson['data']['results'];

      if (responseJson['data']['count'] == 0){
        textError = 'No se han encontrado resultados.';
      } else {
        textError = '';

        for (var item in data){
//          characters.add(Character.fromJson(item));

          Character character = new Character();
          character.name = item['name'];
          character.description = item['description'] ?? '';
          character.id = item['id'];
          character.thumbnail = item['thumbnail']['path'] + '.' + item['thumbnail']['extension'].toString().toLowerCase();
//          character.availableComics = { 'comics' : item['comics']['available'] };
          character.availableComics['comics'] = item['comics']['available'];
          character.availableComics['events'] = item['events']['available'];
//          character.availableComics['events'] = item['events'];
          print(character.availableComics);
//          character.numberComics = item['comics']['available'];
//          character.numberEvents = item['events']['available'];

//          character.urls = item['urls'];
//          print(character.urls);

          for (var url in item['urls']){
            var type = url['type'];
            character.urls[type] = url['url'];
//            switch (url['type']){
//              case 'detail':
//                character.urls['detail'] = url['url'];
//                break;
//              case 'wiki':
//                character.urlWiki = url['url'];
//                break;
//              case 'comiclink':
//                character.urlComics = url['url'];
//                break;
//            }
          }
          characters.add(character);
        }
      }
    } catch (ex){
      textError = 'Error en la conexión.';
    }
  }

}



