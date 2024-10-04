import 'package:shared_preferences/shared_preferences.dart';

class TokenService {
  static Future<void> storeToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('auth_token', token);
  }

  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_token');
  }

  static Future<void> removeToken() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('auth_token');
  }
}
