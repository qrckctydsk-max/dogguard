import 'package:flutter/material.dart';

class ExpertsPage extends StatelessWidget {
  const ExpertsPage({super.key});

  static const _categories = [
    ('Tierärzte', Icons.local_hospital_outlined),
    ('Hundetrainer', Icons.school_outlined),
    ('Hundepsychologen', Icons.psychology_outlined),
    ('Tierheilpraktiker', Icons.health_and_safety_outlined),
    ('Tierheime', Icons.home_outlined),
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Experten')),
    body: ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Text('Finde passende Unterstützung für deinen Hund.', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 12),
        const Card(
          child: ListTile(
            leading: Icon(Icons.info_outline),
            title: Text('Verzeichnis in Vorbereitung'),
            subtitle: Text('Es werden noch keine echten Anbieter gesucht oder verifiziert. Bitte prüfe Qualifikationen selbst, bevor du eine Behandlung vereinbarst.'),
          ),
        ),
        const SizedBox(height: 12),
        ..._categories.map((item) => Card(
          child: ListTile(
            leading: Icon(item.$2),
            title: Text(item.$1),
            subtitle: const Text('Kategorie – keine Anbieter geladen'),
            trailing: const Icon(Icons.lock_outline),
          ),
        )),
      ],
    ),
  );
}
