import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../api.dart';

class AuthRepository {
  final Api _api;
  final _storage = const FlutterSecureStorage();

  AuthRepository(this._api);

  Future<void> login({required String email, required String password}) async {
    final res = await _api.post('/auth/login', data: {
      'email': email,
      'password': password,
    });
    final token = res['accessToken'] as String;
    await _storage.write(key: 'jwt', value: token);
  }
}
