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

  void navigateToDetailCharacterView(BuildContext context) {
    context.go(DetailCharacterView.routeName);
  }

  /// * Future functions

  Future<List<Character>> handleRetreiveCharacters(BuildContext context) async {
    try {
      showLoading(context);
      return await DashboardService.instance.retreiveCharacters();
    } on Exception catch (e) {
      return Future<List<Character>>.error(e);
    } finally {
      closeLoading();
    }
  }
}
