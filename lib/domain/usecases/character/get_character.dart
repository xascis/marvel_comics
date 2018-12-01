import 'package:marvel_comics/common/api_marvel.dart';
import 'package:marvel_comics/common/utils/constants_utils.dart';
import 'package:marvel_comics/domain/models/character.dart';

class GetCharacter {

  ApiMarvel apiMarvel = ApiMarvel();
  
  Future<List<Character>> call() async{

    ApiResponse apiResponse = await apiMarvel.call(url: marvelCharactersUrl);

    List<Character> characterList = [];
    for(var char in apiResponse.apiResponseData.results){
      characterList.add(Character.fromJson(char));
    }

    return characterList;
  }
}