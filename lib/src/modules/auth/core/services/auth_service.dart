part of com.rick_and_morty.core.services;

class AuthService {
  AuthService._();

  static final AuthService instance = AuthService._();

  Future<UserCredential?> login(String email, String password) async {
    try {
      return await FirebaseAuthService.instance.login(email, password);
    } on Exception catch (e) {
      return Future<UserCredential>.error(e);
    }
  }
}
