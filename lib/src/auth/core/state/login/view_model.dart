part of com.rick_and_morty.auth.core.state;

class LoginViewModel extends AppViewModel<LoginState> {
  LoginViewModel(this.ref) : super(LoginState());

  final StateNotifierProviderRef<LoginViewModel, dynamic> ref;

  Future<void> login(
    BuildContext context,
    String email,
    String password,
  ) async {
    state = state.copyWith(error: null);
    try {
      showLoading(context);
      UserCredential? user = await AuthService.instance.login(email, password);
      await StorageService.instance.setToken(
        user?.credential?.accessToken ?? '',
      );
      context.go(HomeView.routeName);
    } on FirebaseAuthException catch (_) {
      state = state.copyWith(
        error: 'Ha ocurrido un error al iniciar sesión',
      );
    } finally {
      closeLoading();
    }
  }
}
