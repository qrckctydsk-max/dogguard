import 'package:flutter/material.dart';

/// Local-only beta flow. It does not contact rescuers or publish location data.
/// A backend and user-confirmed sharing must be implemented before production.
class RescuePage extends StatefulWidget {
  const RescuePage({super.key});

  @override
  State<RescuePage> createState() => _RescuePageState();
}

class _RescuePageState extends State<RescuePage> {
  final _formKey = GlobalKey<FormState>();
  final _dogController = TextEditingController();
  final _descriptionController = TextEditingController();
  String _kind = 'Vermisst';
  bool _submitted = false;

  @override
  void dispose() {
    _dogController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _showReportForm({required String kind}) async {
    setState(() {
      _kind = kind;
      _submitted = false;
      _dogController.clear();
      _descriptionController.clear();
    });
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (sheetContext) => StatefulBuilder(
        builder: (context, setSheetState) => Padding(
          padding: EdgeInsets.fromLTRB(
            20, 8, 20, 20 + MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    _kind == 'Vermisst' ? 'Vermisstmeldung vorbereiten' : 'Fundmeldung vorbereiten',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Beta-Demo: Es wird nichts veröffentlicht oder versendet. '
                    'Gib keine private Adresse und keine Kontaktdaten ein.',
                  ),
                  const SizedBox(height: 16),
                  DropdownButtonFormField<String>(
                    value: _kind,
                    decoration: const InputDecoration(labelText: 'Art der Meldung'),
                    items: const [
                      DropdownMenuItem(value: 'Vermisst', child: Text('Hund vermisst')),
                      DropdownMenuItem(value: 'Gefunden', child: Text('Hund gefunden')),
                    ],
                    onChanged: (value) {
                      if (value != null) setSheetState(() => _kind = value);
                    },
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _dogController,
                    maxLength: 60,
                    decoration: const InputDecoration(
                      labelText: 'Name oder kurze Bezeichnung',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) => value == null || value.trim().isEmpty
                        ? 'Bitte eine Bezeichnung eingeben.'
                        : null,
                  ),
                  TextFormField(
                    controller: _descriptionController,
                    maxLength: 500,
                    minLines: 2,
                    maxLines: 5,
                    decoration: const InputDecoration(
                      labelText: 'Beschreibung (optional)',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 12),
                  FilledButton(
                    onPressed: () {
                      if (!(_formKey.currentState?.validate() ?? false)) return;
                      Navigator.of(sheetContext).pop();
                      setState(() => _submitted = true);
                    },
                    child: const Text('Lokal vormerken'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('DogGuard Rescue')),
    body: ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Card(
          color: Theme.of(context).colorScheme.errorContainer,
          child: const Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.warning_amber_rounded),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Diese Beta sendet keine SOS-Nachricht und kontaktiert keine Rettungsstelle. '
                    'Wende dich bei akuter Gefahr direkt an die zuständigen lokalen Stellen.',
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 56,
          child: FilledButton.icon(
            onPressed: () => _showReportForm(kind: 'Vermisst'),
            icon: const Icon(Icons.search_off),
            label: const Text('Hund als vermisst melden'),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 56,
          child: OutlinedButton.icon(
            onPressed: () => _showReportForm(kind: 'Gefunden'),
            icon: const Icon(Icons.pets),
            label: const Text('Hund gefunden melden'),
          ),
        ),
        const SizedBox(height: 20),
        if (_submitted)
          Card(
            child: ListTile(
              leading: const Icon(Icons.check_circle_outline),
              title: Text('Demo-Meldung vorbereitet: $_kind'),
              subtitle: Text(_dogController.text.trim()),
            ),
          ),
        const ListTile(
          leading: Icon(Icons.location_on_outlined),
          title: Text('Sichtungen und Karte'),
          subtitle: Text('Noch nicht angebunden. Standort wird nicht erfasst oder geteilt.'),
        ),
      ],
    ),
  );
}
