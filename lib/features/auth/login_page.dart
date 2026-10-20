import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// This screen is intentionally a local demo. It does not authenticate an account.
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 430),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(28),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.pets, size: 72, color: Theme.of(context).colorScheme.primary),
                  const SizedBox(height: 16),
                  Text(
                    'DogGuard',
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Alles, was dein Hund braucht. In einer App.',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  const Card(
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.info_outline),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              'Beta-Demo: Es findet keine echte Anmeldung statt. '
                              'Gib hier kein echtes Passwort ein. Konten und Cloud-Synchronisierung sind noch nicht angebunden.',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: _email,
                    keyboardType: TextInputType.emailAddress,
                    autofillHints: const [AutofillHints.email],
                    decoration: const InputDecoration(
                      labelText: 'Demo-E-Mail (optional)',
                      prefixIcon: Icon(Icons.email_outlined),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 14),
                  TextField(
                    controller: _password,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Kein echtes Passwort verwenden',
                      prefixIcon: Icon(Icons.lock_outline),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: () => context.go('/'),
                      child: const Padding(
                        padding: EdgeInsets.all(14),
                        child: Text('Demo öffnen'),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextButton(
                    onPressed: () => context.go('/'),
                    child: const Text('Ohne Eingabe fortfahren'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
