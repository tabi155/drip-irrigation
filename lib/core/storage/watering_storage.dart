import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class WateringStorage {
  static const key = "watering_data";

  static Future<Map<String, List<String>>> getAll() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(key);

    if (data == null) return {};

    final decoded = Map<String, dynamic>.from(jsonDecode(data));

    return decoded.map(
      (k, v) => MapEntry(k, List<String>.from(v)),
    );
  }

  static Future<void> toggle(String zoneId, String date) async {
    final prefs = await SharedPreferences.getInstance();
    final all = await getAll();

    final list = all[zoneId] ?? [];

    if (list.contains(date)) {
      list.remove(date);
    } else {
      list.add(date);
    }

    all[zoneId] = list;

    await prefs.setString(key, jsonEncode(all));
  }
}