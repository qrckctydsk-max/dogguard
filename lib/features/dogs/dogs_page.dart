import 'package:flutter/material.dart';

class DogProfile {
  final String name;
  final String breed;
  final int ageYears;
  final double weightKg;

  const DogProfile({
    required this.name,
    required this.breed,
    required this.ageYears,
    required this.weightKg,
  });
}

class DogsPage extends StatefulWidget {
  const DogsPage({super.key});

  @override
  State<DogsPage> createState() => _DogsPageState();
}

class _DogsPageState extends State<DogsPage> {
  final List<DogProfile> _dogs = [
    const DogProfile(name: 'Buddy', breed: 'Mischling', ageYears: 6, weightKg: 24),
  ];

  Future<void> _editDog({DogProfile? existing}) async {
    final name = TextEditingController(text: existing?.name ?? '');
    final breed = TextEditingController(text: existing?.breed ?? '');
    final age = TextEditingController(text: existing?.ageYears.toString() ?? '');
    final weight = TextEditingController(text: existing?.weightKg.toString() ?? '');
    final formKey = GlobalKey<FormState>();

    final saved = await showDialog<DogProfile>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(existing == null ? 'Hund hinzufügen' : 'Hund bearbeiten'),
        content: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: name,
                  maxLength: 60,
                  decoration: const InputDecoration(labelText: 'Name'),
                  validator: (v) => v == null || v.trim().isEmpty ? 'Name erforderlich' : null,
                ),
                TextFormField(
                  controller: breed,
                  maxLength: 80,
                  decoration: const InputDecoration(labelText: 'Rasse / Typ'),
                  validator: (v) => v == null || v.trim().isEmpty ? 'Bitte eintragen' : null,
                ),
                TextFormField(
                  controller: age,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Alter in Jahren'),
                  validator: (v) {
                    final n = int.tryParse(v ?? '');
                    return n == null || n < 0 || n > 40 ? 'Alter zwischen 0 und 40 eingeben' : null;
                  },
                ),
                TextFormField(
                  controller: weight,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  decoration: const InputDecoration(labelText: 'Gewicht in kg'),
                  validator: (v) {
                    final n = double.tryParse((v ?? '').replaceAll(',', '.'));
                    return n == null || n <= 0 || n > 200 ? 'Gewicht zwischen 0 und 200 kg eingeben' : null;
                  },
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Abbrechen'),
          ),
          FilledButton(
            onPressed: () {
              if (!(formKey.currentState?.validate() ?? false)) return;
              Navigator.pop(
                dialogContext,
                DogProfile(
                  name: name.text.trim(),
                  breed: breed.text.trim(),
                  ageYears: int.parse(age.text.trim()),
                  weightKg: double.parse(weight.text.trim().replaceAll(',', '.')),
                ),
              );
            },
            child: const Text('Lokal speichern'),
          ),
        ],
      ),
    );

    name.dispose();
    breed.dispose();
    age.dispose();
    weight.dispose();

    if (!mounted || saved == null) return;
    setState(() {
      if (existing == null) {
        _dogs.add(saved);
      } else {
        final index = _dogs.indexOf(existing);
        if (index != -1) _dogs[index] = saved;
      }
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Meine Hunde')),
    body: ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Card(
          color: Theme.of(context).colorScheme.surfaceContainerHighest,
          child: const ListTile(
            leading: Icon(Icons.info_outline),
            title: Text('Lokale Beta-Demo'),
            subtitle: Text('Änderungen bleiben nur während dieser Sitzung im Speicher und werden nicht synchronisiert.'),
          ),
        ),
        const SizedBox(height: 12),
        if (_dogs.isEmpty)
          const Padding(
            padding: EdgeInsets.all(24),
            child: Text('Noch kein Hund hinzugefügt.'),
          ),
        ..._dogs.map((dog) => Card(
          child: ListTile(
            leading: const CircleAvatar(child: Icon(Icons.pets)),
            title: Text(dog.name),
            subtitle: Text('${dog.breed} • ${dog.ageYears} Jahre • ${dog.weightKg.toStringAsFixed(1)} kg'),
            trailing: IconButton(
              tooltip: 'Hund bearbeiten',
              onPressed: () => _editDog(existing: dog),
              icon: const Icon(Icons.edit_outlined),
            ),
          ),
        )),
        const SizedBox(height: 12),
        FilledButton.icon(
          onPressed: () => _editDog(),
          icon: const Icon(Icons.add),
          label: const Text('Hund hinzufügen'),
        ),
      ],
    ),
  );
}
