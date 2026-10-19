import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  void dispose() { email.dispose(); password.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 430),
          child: Padding(
            padding: const EdgeInsets.all(28),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.pets, size: 72, color: Theme.of(context).colorScheme.primary),
                const SizedBox(height: 16),
                Text('DogGuard', style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                const Text('Alles, was dein Hund braucht. In einer App.'),
                const SizedBox(height: 32),
                TextField(controller: email, decoration: const InputDecoration(labelText: 'E-Mail', prefixIcon: Icon(Icons.email_outlined), border: OutlineInputBorder())),
                const SizedBox(height: 14),
                TextField(controller: password, obscureText: true, decoration: const InputDecoration(labelText: 'Passwort', prefixIcon: Icon(Icons.lock_outline), border: OutlineInputBorder())),
                const SizedBox(height: 20),
                SizedBox(width: double.infinity, child: FilledButton(
                  onPressed: () => context.go('/'),
                  child: const Padding(padding: EdgeInsets.all(14), child: Text('Einloggen')),
                )),
                const SizedBox(height: 8),
                TextButton(onPressed: () => context.go('/'), child: const Text('Alpha testen ohne Konto')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
