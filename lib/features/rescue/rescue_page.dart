import 'package:flutter/material.dart';
class RescuePage extends StatelessWidget {
  const RescuePage({super.key});
  @override Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text('DogGuard Rescue')), body: ListView(padding: const EdgeInsets.all(20), children: [
    Card(color: Theme.of(context).colorScheme.errorContainer, child: const Padding(padding: EdgeInsets.all(20), child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [Icon(Icons.warning_amber_rounded), SizedBox(width:12), Expanded(child: Text('Im Notfall schnell handeln. Öffentliche Meldungen sollten nur die Informationen enthalten, die du bewusst freigibst.'))]))),
    const SizedBox(height: 20),
    SizedBox(height: 56, child: FilledButton.icon(onPressed: () {}, icon: const Icon(Icons.search_off), label: const Text('Hund als vermisst melden'))),
    const SizedBox(height: 12),
    SizedBox(height: 56, child: OutlinedButton.icon(onPressed: () {}, icon: const Icon(Icons.pets), label: const Text('Hund gefunden melden'))),
    const SizedBox(height: 24),
    const ListTile(leading: Icon(Icons.location_on_outlined), title: Text('Sichtungen'), subtitle: Text('Sichtungen werden in der Beta vorbereitet.')),
  ]));
}
