import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Profil & Einstellungen')),
        body: ListView(
          children: [
            const UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(child: Icon(Icons.person)),
              accountName: Text('DogGuard Tester'),
              accountEmail: Text('Alpha / Founding Pack'),
            ),
            SwitchListTile(
              value: true,
              onChanged: (_) {},
              title: const Text('Benachrichtigungen'),
            ),
            ListTile(
              leading: const Icon(Icons.privacy_tip_outlined),
              title: const Text('Datenschutz'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.feedback_outlined),
              title: const Text('Beta-Feedback senden'),
              onTap: () {},
            ),
            const ListTile(
              leading: Icon(Icons.info_outline),
              title: Text('DogGuard Alpha 0.1.0+1'),
            ),
          ],
        ),
      );
}
