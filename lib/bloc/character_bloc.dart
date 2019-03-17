import 'dart:async';

import 'package:bloc_provider/bloc_provider.dart';
import 'package:marvel_comics/domain/models/character.dart';
import 'package:marvel_comics/domain/usecases/character/get_character.dart';
import 'package:rxdart/rxdart.dart';

class CharacterBloc implements Bloc {
  final _character = BehaviorSubject<List<Character>>.seeded([]);
  final _search = BehaviorSubject<String>();

  Observable<List<Character>> get characterList => _character.stream;
  Observable<String> get _searchText => _search.stream.transform(validateText);

  Function(String) get searchName => _search.sink.add;

  Future<void> _getCharacterList(String text) async => _character.sink.add(await GetCharacter()(name: text));

  CharacterBloc() {
    _searchText.debounce(Duration(seconds: 3)).listen((text) {
      _getCharacterList(text);
    });
  }

  final validateText = StreamTransformer<String, String>.fromHandlers(
    handleData: (String text, EventSink<String> sink) {
      if (text.length > 2) sink.add(text);
    }
  );

  void dispose() async {
    await _character.close();
    await _search.close();
  }

}