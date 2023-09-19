part of com.rick_and_morty.app.navigator;

bool isAuthenticated = StorageService.instance.getToken != null;

List<GoRoute> routes = <GoRoute>[
  ...dashboardRoutes,
  ...authRoutes,
];

final GoRouter router = GoRouter(
  routes: routes,
  initialLocation: isAuthenticated ? HomeView.routeName : LoginView.routeName,
);
