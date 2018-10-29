import 'package:marvel_comics/domain/models/character.dart';
import 'package:marvel_comics/domain/usecases/character/get_character.dart';
import 'package:test/test.dart';

void main(){
  test('get characters list', () async{
    List<Character> characterList = await GetCharacter()();

    expect(characterList.isNotEmpty, true);
  });
}