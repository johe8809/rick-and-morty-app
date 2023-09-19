part of com.rick_and_morty.auth.core.state;

class LoginState {
  LoginState({
    this.error,
  });

  String? error;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoginState &&
          runtimeType == other.runtimeType &&
          toString() == other.toString();

  @override
  int get hashCode => error.hashCode;

  LoginState copyWith({
    String? error,
  }) =>
      LoginState(
        error: error,
      );

  @override
  String toString() => '';
}
