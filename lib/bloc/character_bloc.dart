import 'package:marvel_comics/bloc/bloc_base.dart';
import 'package:marvel_comics/domain/models/character.dart';
import 'package:marvel_comics/domain/usecases/character/get_character.dart';
import 'package:rxdart/rxdart.dart';

class CharacterBloc implements BlocBase {
  final _character = PublishSubject<List<Character>> ();

  Observable<List<Character>> get characterList => _character.stream;

  getCharacterList() async {
    final List<Character> list = await GetCharacter()();
    _character.sink.add(list);
  }

  void dispose(){
    _character.close();
  }

}