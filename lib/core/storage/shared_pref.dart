import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {

  // SAVE LOGIN
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

  // CHECK LOGIN
  static Future<bool> isLoggedIn() async {

    final prefs = await SharedPreferences.getInstance();

    return prefs.getBool('isLogged') ?? false;
  }
  static Future<String> getPassword() async {

  final prefs = await SharedPreferences.getInstance();

  return prefs.getString('password') ?? '';
}

  // GET NAME
  static Future<String> getName() async {

    final prefs = await SharedPreferences.getInstance();

    return prefs.getString('name') ?? '';
  }

  // GET EMAIL
  static Future<String> getEmail() async {

    final prefs = await SharedPreferences.getInstance();

    return prefs.getString('email') ?? '';
  }

  // LOGOUT
  static Future<void> logout() async {

    final prefs = await SharedPreferences.getInstance();

    await prefs.clear();
  }
  
}


