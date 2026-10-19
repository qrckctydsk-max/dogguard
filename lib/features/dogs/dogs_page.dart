import 'package:flutter/material.dart';
import '../dashboard/dashboard_page.dart';

class DogsPage extends StatelessWidget {
  const DogsPage({super.key});
  @override Widget build(BuildContext context) => _Shell(title: 'Meine Hunde', child: ListView(padding: const EdgeInsets.all(20), children: [
    Card(child: ListTile(leading: const CircleAvatar(child: Icon(Icons.pets)), title: const Text('Buddy'), subtitle: const Text('Mischling • 6 Jahre • 24 kg'), trailing: IconButton(onPressed: () {}, icon: const Icon(Icons.edit_outlined)))),
    const SizedBox(height: 12),
    FilledButton.icon(onPressed: () {}, icon: const Icon(Icons.add), label: const Text('Hund hinzufügen')),
  ]));
}
class _Shell extends StatelessWidget { final String title; final Widget child; const _Shell({required this.title, required this.child});
@override Widget build(BuildContext c) => Scaffold(appBar: AppBar(title: Text(title)), drawer: const _Nav(), body: child); }
class _Nav extends StatelessWidget { const _Nav();
@override Widget build(BuildContext c) => Drawer(child: ListView(children: [
const DrawerHeader(child: Text('DogGuard', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
ListTile(title: const Text('Dashboard'), onTap: ()=>Navigator.pushReplacement(c, MaterialPageRoute(builder: (_)=>const DashboardPage()))),
ListTile(title: const Text('Meine Hunde'), onTap: ()=>Navigator.pop(c)),
])); }
