import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return _Shell(
      title: 'DogGuard Beta',
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(
            'DogGuard',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          const Text('Dein Überblick für heute.'),
          const SizedBox(height: 16),
          const Card(
            child: ListTile(
              leading: Icon(Icons.science_outlined),
              title: Text('Beta-Demo aktiv'),
              subtitle: Text('Die angezeigten Inhalte sind Beispieldaten. Es gibt noch keine Cloud-Synchronisierung.'),
            ),
          ),
          const SizedBox(height: 12),
          Card(
            child: ListTile(
              leading: const CircleAvatar(child: Icon(Icons.pets)),
              title: const Text('Buddy – Beispieldaten'),
              subtitle: const Text('Status nicht medizinisch geprüft'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => context.push('/dogs'),
            ),
          ),
          const SizedBox(height: 12),
          _ActionCard(
            icon: Icons.favorite_outline,
            title: 'Gesundheit',
            text: 'Lokale Demo-Einträge, nicht mit Tierarzt synchronisiert',
            onTap: () => context.push('/health'),
          ),
          _ActionCard(
            icon: Icons.warning_amber_rounded,
            title: 'Rescue',
            text: 'Lokale Meldungsdemo – kein Versand und keine SOS-Verbindung',
            onTap: () => context.push('/rescue'),
          ),
          _ActionCard(
            icon: Icons.medical_services_outlined,
            title: 'Experten',
            text: 'Kategorien ansehen – keine echten Anbieter geladen',
            onTap: () => context.push('/experts'),
          ),
          _ActionCard(
            icon: Icons.person_outline,
            title: 'Profil und Einstellungen',
            text: 'Lokales Demo-Profil',
            onTap: () => context.push('/profile'),
          ),
          const SizedBox(height: 12),
          const Card(
            child: Padding(
              padding: EdgeInsets.all(18),
              child: Row(
                children: [
                  Icon(Icons.verified_outlined),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Founding Pack\nBeta-Konzept für die ersten 100 Tester – noch keine Registrierung oder Mitgliedschaft.',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ActionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String text;
  final VoidCallback onTap;

  const _ActionCard({
    required this.icon,
    required this.title,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) => Card(
    child: ListTile(
      leading: Icon(icon),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
      subtitle: Text(text),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    ),
  );
}

class _Shell extends StatelessWidget {
  final String title;
  final Widget child;

  const _Shell({required this.title, required this.child});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text(title)),
    drawer: Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.pets, size: 42),
                SizedBox(height: 8),
                Text('DogGuard', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                Text('Beta-Demo'),
              ],
            ),
          ),
          _item(context, Icons.dashboard_outlined, 'Dashboard', '/'),
          _item(context, Icons.pets, 'Meine Hunde', '/dogs'),
          _item(context, Icons.favorite_outline, 'Gesundheit', '/health'),
          _item(context, Icons.warning_amber_rounded, 'Rescue', '/rescue'),
          _item(context, Icons.medical_services_outlined, 'Experten', '/experts'),
          _item(context, Icons.person_outline, 'Profil', '/profile'),
        ],
      ),
    ),
    body: child,
  );

  Widget _item(BuildContext context, IconData icon, String title, String path) => ListTile(
    leading: Icon(icon),
    title: Text(title),
    onTap: () {
      Navigator.pop(context);
      GoRouter.of(context).go(path);
    },
  );
}
