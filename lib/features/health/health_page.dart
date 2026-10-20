import 'package:flutter/material.dart';

enum HealthRecordKind { vaccination, medication, allergy, appointment }

class HealthRecord {
  final HealthRecordKind kind;
  final String title;
  final String detail;

  const HealthRecord({required this.kind, required this.title, required this.detail});
}

class HealthPage extends StatefulWidget {
  const HealthPage({super.key});

  @override
  State<HealthPage> createState() => _HealthPageState();
}

class _HealthPageState extends State<HealthPage> {
  final List<HealthRecord> _records = [
    const HealthRecord(kind: HealthRecordKind.vaccination, title: 'Impfungen', detail: 'Beispieldaten – bitte prüfen'),
    const HealthRecord(kind: HealthRecordKind.medication, title: 'Medikamente', detail: 'Noch keine Angaben'),
    const HealthRecord(kind: HealthRecordKind.allergy, title: 'Allergien', detail: 'Noch keine Angaben'),
    const HealthRecord(kind: HealthRecordKind.appointment, title: 'Tierarzttermine', detail: 'Noch keine Termine eingetragen'),
  ];

  IconData _icon(HealthRecordKind kind) => switch (kind) {
    HealthRecordKind.vaccination => Icons.vaccines_outlined,
    HealthRecordKind.medication => Icons.medication_outlined,
    HealthRecordKind.allergy => Icons.warning_amber_outlined,
    HealthRecordKind.appointment => Icons.calendar_month_outlined,
  };

  String _label(HealthRecordKind kind) => switch (kind) {
    HealthRecordKind.vaccination => 'Impfung',
    HealthRecordKind.medication => 'Medikament',
    HealthRecordKind.allergy => 'Allergie',
    HealthRecordKind.appointment => 'Tierarzttermin',
  };

  Future<void> _addRecord() async {
    final formKey = GlobalKey<FormState>();
    final title = TextEditingController();
    final detail = TextEditingController();
    var kind = HealthRecordKind.vaccination;
    final record = await showDialog<HealthRecord>(
      context: context,
      builder: (dialogContext) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          title: const Text('Gesundheitseintrag hinzufügen'),
          content: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DropdownButtonFormField<HealthRecordKind>(
                    initialValue: kind,
                    decoration: const InputDecoration(labelText: 'Kategorie'),
                    items: HealthRecordKind.values.map((item) => DropdownMenuItem(
                      value: item,
                      child: Text(_label(item)),
                    )).toList(),
                    onChanged: (value) {
                      if (value != null) setDialogState(() => kind = value);
                    },
                  ),
                  TextFormField(
                    controller: title,
                    maxLength: 80,
                    decoration: const InputDecoration(labelText: 'Titel'),
                    validator: (v) => v == null || v.trim().isEmpty ? 'Titel erforderlich' : null,
                  ),
                  TextFormField(
                    controller: detail,
                    maxLength: 300,
                    minLines: 1,
                    maxLines: 4,
                    decoration: const InputDecoration(labelText: 'Details (optional)'),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(dialogContext), child: const Text('Abbrechen')),
            FilledButton(
              onPressed: () {
                if (!(formKey.currentState?.validate() ?? false)) return;
                Navigator.pop(
                  dialogContext,
                  HealthRecord(kind: kind, title: title.text.trim(), detail: detail.text.trim().isEmpty ? 'Keine Details' : detail.text.trim()),
                );
              },
              child: const Text('Lokal speichern'),
            ),
          ],
        ),
      ),
    );
    title.dispose();
    detail.dispose();
    if (!mounted || record == null) return;
    setState(() => _records.add(record));
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Gesundheitsakte')),
    body: ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Card(
          color: Theme.of(context).colorScheme.surfaceContainerHighest,
          child: const ListTile(
            leading: Icon(Icons.info_outline),
            title: Text('Lokale Beta-Demo'),
            subtitle: Text('Beispieldaten sind keine tierärztliche Empfehlung. Einträge werden nicht in der Cloud gespeichert.'),
          ),
        ),
        const SizedBox(height: 12),
        ..._records.map((record) => Card(
          child: ListTile(
            leading: Icon(_icon(record.kind)),
            title: Text(record.title),
            subtitle: Text('${_label(record.kind)} • ${record.detail}'),
          ),
        )),
        const SizedBox(height: 12),
        FilledButton.icon(
          onPressed: _addRecord,
          icon: const Icon(Icons.add),
          label: const Text('Eintrag hinzufügen'),
        ),
      ],
    ),
  );
}
