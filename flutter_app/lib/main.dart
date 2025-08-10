import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen.dart';
import 'providers/aria_provider.dart';

void main() {
  runApp(const ARIAApp());
}

class ARIAApp extends StatelessWidget {
  const ARIAApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ARIAProvider(),
      child: MaterialApp(
        title: 'ARIA AI Agent',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true,
        ),
        home: const HomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
