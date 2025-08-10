import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ARIAProvider extends ChangeNotifier {
  List<Map<String, dynamic>> _messages = [];
  bool _isLoading = false;

  List<Map<String, dynamic>> get messages => _messages;
  bool get isLoading => _isLoading;

  void addMessage(String text, bool isUser) {
    _messages.add({
      'text': text,
      'isUser': isUser,
      'timestamp': DateTime.now(),
    });
    notifyListeners();
  }

  Future<void> sendMessage(String message) async {
    addMessage(message, true);
    _isLoading = true;
    notifyListeners();

    try {
      // Replace with your actual ARIA API endpoint
      final response = await http.post(
        Uri.parse('http://localhost:8000/api/chat'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'message': message}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        addMessage(data['response'] ?? 'No response', false);
      } else {
        addMessage('Error: Unable to connect to ARIA service', false);
      }
    } catch (e) {
      // For demo purposes, simulate a response
      await Future.delayed(const Duration(seconds: 1));
      addMessage('ARIA: Hello! I received your message: "$message"', false);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void clearMessages() {
    _messages.clear();
    notifyListeners();
  }
}
