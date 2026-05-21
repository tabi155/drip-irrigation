import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static Future<void> saveUser({
    required String email,
    required String name,
    required String password,
  }) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setBool('isLogged', true);
    await prefs.setString('email', email);
    await prefs.setString('name', name);
    await prefs.setString('password', password);
  }

  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getBool('isLogged') ?? false;
  }

  static Future<String> getPassword() async { 
    final prefs = await SharedPreferences.getInstance();

    return prefs.getString('password') ?? '';
  }

  static Future<String> getName() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getString('name') ?? '';
  }

  static Future<String> getEmail() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getString('email') ?? '';
  }

  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.clear();
  }
}
