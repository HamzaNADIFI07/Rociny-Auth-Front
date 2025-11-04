import 'package:flutter/material.dart';
import 'auth/ui/login_page.dart';

class RocinyApp extends StatelessWidget {
  const RocinyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rociny',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xFF0C5C47),
        fontFamily: 'SF Pro',
      ),
      home: const LoginPage(),
    );
  }
}
