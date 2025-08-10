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

    // Test typing a message
    await tester.enterText(find.byType(TextField), 'Hello ARIA');
    await tester.tap(find.byIcon(Icons.send));
    await tester.pump();

    // Verify the user message appears
    expect(find.text('Hello ARIA'), findsOneWidget);
  });

  testWidgets('Message input and send test', (WidgetTester tester) async {
    await tester.pumpWidget(const ARIAApp());

    // Find the text field
    final textField = find.byType(TextField);
    expect(textField, findsOneWidget);

    // Enter a test message
    await tester.enterText(textField, 'Test message');
    
    // Tap the send button
    await tester.tap(find.byIcon(Icons.send));
    await tester.pumpAndSettle(const Duration(seconds: 2));

    // Verify the message was sent
    expect(find.text('Test message'), findsOneWidget);
  });
}
