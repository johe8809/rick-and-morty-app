part of com.rick_and_morty.dashboard.core.state;

class HomeViewModel extends AppViewModel<HomeState> {
  HomeViewModel(this.ref) : super(HomeState());

  final StateNotifierProviderRef<HomeViewModel, dynamic> ref;

  /// * Void functions

  void logout(BuildContext context) {
    FirebaseAuthService.instance.logout();
    StorageService.instance.delete();

    context.go(LoginView.routeName);
  }

  void navigateToDetailCharacterView(
    BuildContext context,
    Character character,
  ) {
    context.go('/${DetailCharacterView.routeName}', extra: character);
  }

  /// * Future functions

  Future<void> handleRetreiveCharacters(BuildContext context) async {
    try {
      showLoading(context);

      List<Character>? characters =
          await DashboardService.instance.retreiveCharacters();
      state = state.copyWith(characters: characters);
    } on Exception catch (_) {
      rethrow;
    } finally {
      closeLoading();
    }
  }
}
