part of com.rick_and_morty.app.navigator;

Map<String, MaterialPageRoute<Widget>> routes =
    <String, MaterialPageRoute<Widget>>{
  LoginView.routeName: MaterialPageRoute<Widget>(
    builder: (BuildContext context) => const LoginView(),
  ),
  HomeView.routeName: MaterialPageRoute<Widget>(
    builder: (BuildContext context) => const HomeView(),
  ),
};
