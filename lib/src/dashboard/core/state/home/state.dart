part of com.rick_and_morty.dashboard.core.state;

class HomeState {
  HomeState({
    this.characters,
  });

  List<Character>? characters;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HomeState &&
          runtimeType == other.runtimeType &&
          toString() == other.toString();

  @override
  int get hashCode => characters.hashCode;

  HomeState copyWith({
    List<Character>? characters,
  }) =>
      HomeState(
        characters: characters ?? this.characters,
      );

  @override
  String toString() => '';
}
