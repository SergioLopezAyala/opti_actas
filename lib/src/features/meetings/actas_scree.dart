import 'package:flutter/material.dart';

class ActasScreen extends StatelessWidget {
  const ActasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Actas')),
      body: const Center(child: Text('Pantalla de Actas')),
    );
  }
}
