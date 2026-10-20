import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dogguard/app.dart';
import 'package:dogguard/features/rescue/rescue_page.dart';
import 'package:dogguard/features/dogs/dogs_page.dart';

void main() {
  testWidgets('DogGuard demo login renders with honest labeling', (tester) async {
    await tester.pumpWidget(const DogGuardApp());
    expect(find.text('DogGuard'), findsOneWidget);
    expect(find.text('Demo öffnen'), findsOneWidget);
    expect(find.textContaining('Es findet keine echte Anmeldung statt'), findsOneWidget);
  });

  testWidgets('Dog profiles can be added locally with validation', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: DogsPage()));
    await tester.tap(find.text('Hund hinzufügen'));
    await tester.pumpAndSettle();

    expect(find.text('Hund hinzufügen'), findsOneWidget);
    await tester.tap(find.text('Lokal speichern'));
    await tester.pumpAndSettle();
    expect(find.text('Name erforderlich'), findsOneWidget);

    await tester.enterText(find.widgetWithText(TextFormField, 'Name'), 'Luna');
    await tester.enterText(find.widgetWithText(TextFormField, 'Rasse / Typ'), 'Pudel');
    await tester.enterText(find.widgetWithText(TextFormField, 'Alter in Jahren'), '3');
    await tester.enterText(find.widgetWithText(TextFormField, 'Gewicht in kg'), '8.5');
    await tester.tap(find.text('Lokal speichern'));
    await tester.pumpAndSettle();

    expect(find.text('Luna'), findsOneWidget);
    expect(find.textContaining('Pudel'), findsOneWidget);
    expect(find.textContaining('während dieser Sitzung'), findsOneWidget);
  });

  testWidgets('Rescue flow states reports are local only', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: RescuePage()));
    expect(find.text('DogGuard Rescue'), findsOneWidget);
    expect(find.textContaining('sendet keine SOS-Nachricht'), findsOneWidget);

    await tester.tap(find.text('Hund als vermisst melden'));
    await tester.pumpAndSettle();
    expect(find.text('Vermisstmeldung vorbereiten'), findsOneWidget);
    expect(find.textContaining('Es wird nichts veröffentlicht oder versendet'), findsOneWidget);
  });
}
