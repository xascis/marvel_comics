import 'package:marvel_comics/common/api_marvel.dart';
import 'package:marvel_comics/common/utils/constants_utils.dart';
import 'package:marvel_comics/domain/models/character.dart';

class GetCharacter {
  
  Future<List<Character>> call() async{

    ApiResponse apiResponse = await ApiMarvel()(url: marvelCharactersUrl);

    // convertir respose en listado de Character

    return null;
  }
}