import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_catalog/main_lab1.dart';

void main() {
  testWidgets('Hello World is shown on the initial screen', (tester) async {
    await tester.pumpWidget(const MainApp());
    expect(find.text('Hello World!'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
