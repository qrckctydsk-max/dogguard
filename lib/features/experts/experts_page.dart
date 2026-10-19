import 'package:flutter/material.dart';
class ExpertsPage extends StatelessWidget {
  const ExpertsPage({super.key});
  @override Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text('Experten')), body: ListView(padding: const EdgeInsets.all(20), children: [
    const Text('Finde passende Unterstützung für deinen Hund.'),
    const SizedBox(height: 16),
    ...['Tierärzte','Hundetrainer','Hundepsychologen','Tierheilpraktiker','Tierheime'].map((x)=>Card(child:ListTile(leading:const Icon(Icons.verified_outlined),title:Text(x),subtitle:const Text('Experten in deiner Umgebung'),trailing:const Icon(Icons.chevron_right)))),
  ]));
}
