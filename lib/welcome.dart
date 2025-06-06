import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  final Map<String, dynamic> userInfo;
  const WelcomePage({super.key, required this.userInfo});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}