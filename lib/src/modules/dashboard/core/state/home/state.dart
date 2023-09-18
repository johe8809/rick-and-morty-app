part of com.rick_and_morty.dashboard.core.state;

class HomeState {
  HomeState({
    this.error,
  });

  String? error;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HomeState &&
          runtimeType == other.runtimeType &&
          toString() == other.toString();

  @override
  int get hashCode => error.hashCode;

  HomeState copyWith({
    String? error,
  }) =>
      HomeState(
        error: error,
      );

  @override
  String toString() => '';
}
