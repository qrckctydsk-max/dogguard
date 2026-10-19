import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dogguard/app.dart';

void main() {
  testWidgets('DogGuard displays the login screen', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: DogGuardApp()));
    await tester.pumpAndSettle();

    expect(find.text('DogGuard'), findsOneWidget);
    expect(find.text('Alpha testen ohne Konto'), findsOneWidget);
  });
}
