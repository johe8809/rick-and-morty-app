part of com.rick_and_morty.auth.core.state;

StateNotifierProvider<LoginViewModel, LoginState> loginViewModel =
    StateNotifierProvider<LoginViewModel, LoginState>(
  LoginViewModel.new,
  name: 'LoginViewModel',
);
