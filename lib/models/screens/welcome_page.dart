import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final title = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Center(child: Text("Welcome"))],
      ),
    );
  }
}
