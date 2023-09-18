part of com.rick_and_morty.dashboard.core.state;

class HomeViewModel extends AppViewModel<HomeState> {
  HomeViewModel(this.ref) : super(HomeState());

  final StateNotifierProviderRef<HomeViewModel, dynamic> ref;

  void logout(BuildContext context) {
    FirebaseAuthService.instance.logout();
    StorageService.instance.delete();
    Navigator.of(context).pushReplacement(
      routes[LoginView.routeName]!,
    );
  }
}
