import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _notifications = false;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Profil & Einstellungen')),
    body: ListView(
      children: [
        const UserAccountsDrawerHeader(
          currentAccountPicture: CircleAvatar(child: Icon(Icons.person)),
          accountName: Text('DogGuard Demo'),
          accountEmail: Text('Lokales Testprofil'),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(16, 12, 16, 4),
          child: Text(
            'Demo-Modus: Es gibt kein angemeldetes Konto. Einstellungen werden nicht dauerhaft gespeichert.',
          ),
        ),
        SwitchListTile(
          value: _notifications,
          onChanged: (value) => setState(() => _notifications = value),
          title: const Text('Benachrichtigungen'),
          subtitle: const Text('Nur lokale UI-Einstellung – keine Push-Nachrichten werden versendet.'),
        ),
        const ListTile(
          leading: Icon(Icons.privacy_tip_outlined),
          title: Text('Datenschutz'),
          subtitle: Text('Eine vollständige Datenschutzerklärung muss vor Veröffentlichung ergänzt werden.'),
        ),
        ListTile(
          leading: const Icon(Icons.feedback_outlined),
          title: const Text('Beta-Feedback'),
          subtitle: const Text('Noch kein Versanddienst angebunden.'),
          onTap: () => showDialog<void>(
            context: context,
            builder: (dialogContext) => AlertDialog(
              title: const Text('Beta-Feedback'),
              content: const Text('Feedback kann in dieser Version noch nicht übermittelt werden.'),
              actions: [
                TextButton(onPressed: () => Navigator.pop(dialogContext), child: const Text('Schließen')),
              ],
            ),
          ),
        ),
        const ListTile(
          leading: Icon(Icons.info_outline),
          title: Text('DogGuard Beta 0.1.0+1'),
          subtitle: Text('Unsignierter Prototyp – keine öffentliche Freigabe.'),
        ),
      ],
    ),
  );
}
