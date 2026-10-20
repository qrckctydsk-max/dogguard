import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return _Shell(
      title: 'Guten Morgen',
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text('DogGuard', style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          const Text('Dein Überblick für heute.'),
          const SizedBox(height: 20),
          Card(child: ListTile(
            leading: const CircleAvatar(child: Icon(Icons.pets)),
            title: const Text('Buddy'),
            subtitle: const Text('Gesundheitsstatus: aktuell'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.push('/dogs'),
          )),
          const SizedBox(height: 12),
          _ActionCard(icon: Icons.favorite_outline, title: 'Gesundheit', text: 'Impfungen, Medikamente und Termine', onTap: () => context.push('/health')),
          _ActionCard(icon: Icons.warning_amber_rounded, title: 'Rescue', text: 'Vermisst- und Fundmeldungen', onTap: () => context.push('/rescue')),
          _ActionCard(icon: Icons.medical_services_outlined, title: 'Experten', text: 'Tierärzte, Trainer und Tierheime', onTap: () => context.push('/experts')),
          const SizedBox(height: 12),
          Card(
            child: const Padding(
              padding: EdgeInsets.all(18),
              child: Row(children: [
                Icon(Icons.verified_outlined),
                SizedBox(width: 12),
                Expanded(child: Text('DogGuard Founding Pack\nDie ersten 100 Alpha-Tester erhalten Founding-Status.')),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

class _ActionCard extends StatelessWidget {
  final IconData icon;
  final String title, text;
  final VoidCallback onTap;
  const _ActionCard({required this.icon, required this.title, required this.text, required this.onTap});

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

  Widget _item(BuildContext c, IconData i, String t, String p) => ListTile(
        leading: Icon(i),
        title: Text(t),
        onTap: () {
          Navigator.pop(c);
          GoRouter.of(c).go(p);
        },
      );
}
