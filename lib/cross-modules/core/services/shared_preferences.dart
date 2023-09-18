part of com.rick_and_morty.core.services;

class StorageService {
  StorageService._();
  static final StorageService instance = StorageService._();

  static const String _bearerKey = 'bearer';
  static const String _userEmail = 'email';

  late SharedPreferences storage;

  Future<void> init() async {
    storage = await SharedPreferences.getInstance();
  }

  String? get getToken => storage.getString(_bearerKey);

  String? get getUserEmail => storage.getString(_userEmail);

  Future<void> setToken(String token) async =>
      storage.setString(_bearerKey, token);

  Future<void> setUserEmail(String email) async =>
      storage.setString(_userEmail, email);

  Future<bool> deleteUserTokenKey() async => storage.remove(_bearerKey);

  Future<void> delete() async {
    await storage.remove(_bearerKey);
    await storage.remove(_userEmail);
  }

  Future<Map<String, dynamic>> toJson() async {
    Map<String, dynamic> _json = <String, dynamic>{
      _bearerKey: getToken,
      _userEmail: getUserEmail,
    };
    return _json;
  }

  @override
  String toString() => '${storage.getKeys()}';
}
