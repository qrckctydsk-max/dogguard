import 'package:flutter_test/flutter_test.dart';
import 'package:dogguard/app.dart';

void main() {
  testWidgets('DogGuard login renders', (tester) async {
    await tester.pumpWidget(const DogGuardApp());
    expect(find.text('DogGuard'), findsOneWidget);
    expect(find.text('Einloggen'), findsOneWidget);
  });
}
