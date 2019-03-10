import 'package:bloc_provider/bloc_provider.dart';
import 'package:marvel_comics/domain/models/character.dart';
import 'package:marvel_comics/domain/usecases/character/get_character.dart';
import 'package:rxdart/rxdart.dart';

class CharacterBloc implements Bloc {
  final _character = PublishSubject<List<Character>> ();

  CharacterBloc() {
    this.getCharacterList();
  }

  Observable<List<Character>> get characterList => _character.stream;

  getCharacterList() async {
    final List<Character> list = await GetCharacter()();
    _character.sink.add(list);
  }

  void dispose() async {
    await _character.close();
  }

}