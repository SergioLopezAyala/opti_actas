import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MeetingScreen extends StatelessWidget {
  const MeetingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Meeting')),
      body: Center(
        child: ElevatedButton(
          onPressed:() => context.push('/acta'),
          child: const Text('Ir a acta'),
      ),
    ),

  );
  }
}