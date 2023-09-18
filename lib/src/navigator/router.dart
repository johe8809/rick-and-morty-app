part of com.rick_and_morty.app.navigator;

bool isAuthenticated = StorageService.instance.getToken != null;

List<GoRoute> routes = <GoRoute>[
  GoRoute(
    path: HomeView.routeName,
    builder: (BuildContext context, GoRouterState state) => const HomeView(),
  ),
  GoRoute(
    path: LoginView.routeName,
    builder: (BuildContext context, GoRouterState state) => const LoginView(),
  ),
  GoRoute(
    path: DetailCharacterView.routeName,
    builder: (BuildContext context, GoRouterState state) =>
        const DetailCharacterView(),
  ),
];

final GoRouter router = GoRouter(
  routes: routes,
  initialLocation: isAuthenticated ? HomeView.routeName : LoginView.routeName,
);
