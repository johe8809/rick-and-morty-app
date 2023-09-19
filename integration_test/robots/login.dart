part of com.rick_morty_app.testing.robots;

class LoginRobot {
  const LoginRobot(this.tester);

  final WidgetTester tester;

  Future<void> checkViewport() async {
    Finder viewFinder = find.byKey(const Key('login_view_key'));

    expect(
      viewFinder,
      findsOneWidget,
      reason: 'Failed to verify login view is shown',
    );
  }

  Future<void> enterEmail(String email) async {
    Finder emailFieldFinder = find.byKey(const Key('email_field_key'));
    await tester.ensureVisible(emailFieldFinder);
    await tester.enterText(emailFieldFinder, email);
    await tester.pumpAndSettle();
  }

  Future<void> enterPassword(String password) async {
    Finder passwordFieldFinder = find.byKey(const Key('password_field_key'));
    await tester.ensureVisible(passwordFieldFinder);
    await tester.enterText(passwordFieldFinder, password);
    await tester.pumpAndSettle();
  }

  Future<void> onTapLoginButton() async {
    Finder loginButtonFinder = find.byKey(const Key('login_button_key'));
    await tester.ensureVisible(loginButtonFinder);
    await tester.tap(loginButtonFinder);
    await tester.pumpAndSettle();
  }
}
