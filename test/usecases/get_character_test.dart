import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:marvel_comics/domain/models/character.dart';
import 'package:marvel_comics/domain/usecases/character/get_character.dart';
import 'package:test/test.dart';

void main(){

  group('fetch characters', () {

    test('fetch characters list without text input', () async{
      GetCharacter getCharacter = GetCharacter();

      // load saved json data
      final file = File('test_resources/characters.json');
      final jsonResponse = jsonDecode(await file.readAsString());
      
      getCharacter.apiMarvel.client = MockClient((resquest) async {
        return Response(json.encode(jsonResponse), 200);
      });

      List<Character> characterList = await getCharacter();

      expect(characterList, TypeMatcher<List<Character>>());
    });

    test('fetch spider characters', () async {
      GetCharacter getCharacter = GetCharacter();

      // load saved json data
      final file = File('test_resources/characters.json');
      final jsonResponse = jsonDecode(await file.readAsString());
      
      getCharacter.apiMarvel.client = MockClient((resquest) async {
        return Response(json.encode(jsonResponse), 200);
      });

      List<Character> characterList = await getCharacter(name: 'Spider');

      expect(characterList, TypeMatcher<List<Character>>());
    });

  });
  
}