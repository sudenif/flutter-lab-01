import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:recipe_catalog/main_lab1.dart' as lab1;

/// Нативная проверка только этого этапа; снимки создаются из настоящих кадров Flutter.
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  final captureKey = GlobalKey();

  Future<void> capture(WidgetTester tester, String name) async {
    await tester.pumpAndSettle();
    await tester.runAsync(() async {
      final boundary =
          captureKey.currentContext!.findRenderObject()!
              as RenderRepaintBoundary;
      final image = await boundary.toImage(pixelRatio: 2);
      final bytes = await image.toByteData(format: ui.ImageByteFormat.png);
      final dir = Directory(
        const String.fromEnvironment(
          'EVIDENCE_DIR',
          defaultValue: 'test_screenshots',
        ),
      );
      await dir.create(recursive: true);
      await File('${dir.path}/$name.png')
          .writeAsBytes(bytes!.buffer.asUint8List());
      image.dispose();
    });
  }

  testWidgets('Lab 1 initial application runs on Windows', (tester) async {
    await tester.pumpWidget(
      RepaintBoundary(key: captureKey, child: const lab1.MainApp()),
    );
    expect(find.text('Hello World!'), findsOneWidget);
    await capture(tester, 'lab1_hello');
  });
}
