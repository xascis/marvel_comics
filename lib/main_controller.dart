import 'character_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MainController {
  List<Character> characters = new List<Character>();
  String textError = '';
  bool _itsbusy = false;
  bool _showerror = false;

  bool get itsBusy => _itsbusy;
  set itsBusy(bool itsbusy) {this._itsbusy = itsbusy;}

  bool get showError => _showerror;
  set showError(bool showerror) {this._showerror = showerror;}

  // añadir un callback
  getData(String textFieldHeroName) async{
    try {
      if (itsBusy) return;
      itsBusy = true;
      showError = false;
      characters.clear();

      var response =  await http.get('https://gateway.marvel.com/v1/public/characters?apikey=2c8c7e04677efe9a1a8625342ae2bac8&ts=10&hash=f8a89c483b2f946c754fc7262c34db1a&orderBy=name'+ '&limit=50' + '&nameStartsWith=' + textFieldHeroName);
      final responseJson = jsonDecode(response.body);
//    print(responseJson['data']['results']);
      var data = responseJson['data']['results'];

      if (responseJson['data']['count'] == 0){
        textError = 'No se han encontrado resultados';
        showError = true;
      } else {
        textError = '';

        // utilizar un Map
        for (var item in data){
          Character character = new Character();
          character.name = item['name'];
          character.description = item['description'];
          character.id = item['id'];
          character.thumbnail = item['thumbnail']['path'] + '.' + item['thumbnail']['extension'].toString().toLowerCase();
          character.numberComics = item['comics']['available'];
          character.numberEvents = item['events']['available'];

          for (var url in item['urls']){
            switch (url['type']){
              case 'detail':
                character.urlDetail = url['url'];
                break;
              case 'wiki':
                character.urlWiki = url['url'];
                break;
              case 'comiclink':
                character.urlComics = url['url'];
                break;
            }
          }

          characters.add(character);
        }
      }
    } catch (Exception){
      textError = 'Error en la conexión.';
      showError = true;
      print('Error en la conexión');

    } finally {
      itsBusy = false;
    }
  }

}



