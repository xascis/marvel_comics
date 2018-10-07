import 'package:marvel_comics/models/character.dart';

class AppState{
  final bool isLoading;
  final List<Character> characterList;

  AppState({
    this.isLoading = false,
    this.characterList = const [],
  });

  factory AppState.loading() {
    return AppState(isLoading: true);
  }

  AppState copyWith({
    bool isLoading,
    List<Character> characterList,
  }){
    return AppState(
      isLoading: isLoading ?? this.isLoading,
      characterList: characterList ?? this.characterList,
    );
  }

}