import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kendrix_mobile_app/main.dart';

void main() {
  testWidgets('App loads and shows initial screen', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      const ProviderScope(
        child: KendrixApp(),
      ),
    );

    // Verify that the app loads successfully
    expect(find.byType(KendrixApp), findsOneWidget);
  });

  testWidgets('Material 3 theme is applied', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: KendrixApp(),
      ),
    );

    final MaterialApp materialApp = tester.widget(find.byType(MaterialApp));
    expect(materialApp.theme?.useMaterial3, isTrue);
  });
}