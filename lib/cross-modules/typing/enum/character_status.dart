part of com.rick_and_morty.typing.enum_types;

enum CharacterStatus {
  alive('Alive'),
  dead('Dead'),
  unknown('Unknown');

  const CharacterStatus(String status) : value = status;

  factory CharacterStatus.fromString(String status) {
    switch (status) {
      case 'Alive':
        return CharacterStatus.alive;
      case 'Dead':
        return CharacterStatus.dead;
      default:
        return CharacterStatus.unknown;
    }
  }

  final String? value;

  bool get isDead => this == CharacterStatus.dead;
}
