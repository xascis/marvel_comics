import 'dart:async';

import 'package:marvel_comics/common/api_marvel.dart';
import 'package:marvel_comics/common/utils/constants_utils.dart';
import 'package:marvel_comics/domain/models/character.dart';

class GetCharacter {

  ApiMarvel apiMarvel = ApiMarvel();
  
  Future<List<Character>> call({String name}) async{

    ApiResponse apiResponse = await apiMarvel.call(url: marvelCharactersUrl, name: name);

    return apiResponse.apiResponseData.results.map<Character>((char) => Character.fromJson(char)).toList();
  }
}