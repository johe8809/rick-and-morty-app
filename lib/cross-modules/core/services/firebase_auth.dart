part of com.rick_and_morty.services;

class FirebaseAuthService {
  FirebaseAuthService._();
  static final FirebaseAuthService instance = FirebaseAuthService._();

  late FirebaseAuth? _firebaseAuth;

  void init() {
    _firebaseAuth = FirebaseAuth.instance;
  }

  Future<UserCredential> login(String email, String password) async {
    try {
      UserCredential response = await _firebaseAuth!.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return response;
    } on Exception catch (e) {
      return Future<UserCredential>.error(e);
    }
  }

  void logout() {
    _firebaseAuth!.signOut();
  }
}
