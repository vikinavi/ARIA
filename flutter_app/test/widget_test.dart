import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:aria_mobile/main.dart';

void main() {
  testWidgets('ARIA app smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const ARIAApp());

    // Verify that the app starts with the welcome message
    expect(find.text('ARIA AI Agent'), findsOneWidget);
    expect(find.text('Hello! I\'m ARIA, your AI assistant. How can I help you today?'), findsOneWidget);

    // Verify that the send button is present
    expect(find.byIcon(Icons.send), findsOneWidget);
  });
}
