import 'package:flutter/material.dart';
import 'package:movie_diss/core/storage/shared_pref.dart';
import 'package:movie_diss/features/auth/presentation/registration_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  Future<void> _logout(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Выход"),
        content: const Text("Вы действительно хотите выйти?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Отмена"),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(context);

              /// 🔥 ОЧИСТКА STORAGE
              await LocalStorage.logout();

              /// 🔥 НА РЕГИСТРАЦИЮ
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (_) => const RegistrationScreen(),
                ),
                (route) => false,
              );
            },
            child: const Text(
              "Выйти",
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }

  Future<Map<String, String>> _loadUser() async {
    final name = await LocalStorage.getName();
    final email = await LocalStorage.getEmail();

    return {
      "name": name,
      "email": email,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("Профиль"),
        centerTitle: true,
      ),
      body: FutureBuilder<Map<String, String>>(
        future: _loadUser(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final user = snapshot.data!;
          final name = user["name"] ?? "";
          final email = user["email"] ?? "";

          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.green,
                  child: Icon(Icons.person, size: 50, color: Colors.white),
                ),
                const SizedBox(height: 20),
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  email,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 40),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("📊 Статистика"),
                      SizedBox(height: 10),
                      Text("• Зоны: 3"),
                      Text("• Активный полив: 1"),
                      Text("• Запланированные даты: 5"),
                    ],
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => _logout(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: const EdgeInsets.all(14),
                    ),
                    child: const Text(
                      "Выйти",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
