part of com.rick_morty_app.testing.steps;

class AuthScenario {
  AuthScenario(this.binding);

  final IntegrationTestWidgetsFlutterBinding binding;

  void body() {
    // Registers a function to be run once before all tests
    setUpAll(() async {});

    // Registers a function to be run before tests
    setUp(binding.reset);

    // Registers a function to be run once after all tests
    tearDown(() async {});

    // Registers a function to be run once after all tests
    tearDownAll(() async {});

    testWidgets(
      'login_success',
      (WidgetTester tester) async {
        await app.main();
        await tester.pumpAndSettle();

        LoginSteps authenticationSteps = LoginSteps(tester);
        HomeRobot homeRobot = HomeRobot(tester);

        await authenticationSteps.login(
          'johe8809@gmail.com',
          'test123',
        );

        await homeRobot.checkViewport();
      },
    );
  }
}
