import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/aria_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ARIA AI Agent'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Consumer<ARIAProvider>(
        builder: (context, ariaProvider, child) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: ariaProvider.messages.length,
                  itemBuilder: (context, index) {
                    final message = ariaProvider.messages[index];
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: message['isUser'] == true
                            ? Colors.blue[100]
                            : Colors.grey[100],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        message['text'] as String,
                        style: TextStyle(
                          fontWeight: message['isUser'] == true
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                    );
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _messageController,
                        decoration: const InputDecoration(
                          hintText: 'Type your message...',
                          border: OutlineInputBorder(),
                        ),
                        onSubmitted: (value) => _sendMessage(ariaProvider),
                      ),
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      onPressed: ariaProvider.isLoading
                          ? null
                          : () => _sendMessage(ariaProvider),
                      icon: ariaProvider.isLoading
                          ? const CircularProgressIndicator()
                          : const Icon(Icons.send),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void _sendMessage(ARIAProvider provider) {
    if (_messageController.text.trim().isNotEmpty) {
      provider.sendMessage(_messageController.text.trim());
      _messageController.clear();
    }
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }
}
