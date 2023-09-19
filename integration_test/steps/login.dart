part of com.rick_morty_app.testing.steps;

class LoginSteps {
  LoginSteps(this.tester) {
    _loginRobot = LoginRobot(tester);
  }

  late WidgetTester tester;
  late LoginRobot _loginRobot;

  Future<void> login(String email, String password) async {
    await tester.pumpAndSettle();
    await _loginRobot.checkViewport();
    await _loginRobot.enterEmail(email);
    await _loginRobot.enterPassword(password);
    await _loginRobot.onTapLoginButton();
  }
}
