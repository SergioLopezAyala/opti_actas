import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () => context.push('/acta'),
              child: const Text('Ir a Actas'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () => context.push('/meeting'),
              child: const Text('Ir a Reunion'),
            ),
          ],
        ),
      ),
    );
  }
}
