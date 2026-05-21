import 'package:flutter/material.dart';
import 'package:movie_diss/core/storage/shared_pref.dart';
import 'package:movie_diss/features/home/presentation/nav_bar_screen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<RegistrationScreen> {
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> login() async {
    await LocalStorage.saveUser(
      email: emailController.text,
      name: nameController.text,
      password: passwordController.text,
    );

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const NavBarScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 50),
            const Text(
              '🌱 Smart Irrigation',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: login,
                child: const Text('Login'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
