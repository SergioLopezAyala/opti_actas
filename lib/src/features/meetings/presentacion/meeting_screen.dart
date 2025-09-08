import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '/src/shared/widgets/AppBarRappi.dart';

class MeetingScreen extends StatelessWidget {
  const MeetingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBarRappi(
      title: 'Reunion',
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
        children:
        [
          ElevatedButton(
            onPressed: () => context.push('/acta'),
            child: const Text('Ir a acta'),
          ),



        ]),

    ),

  ),
    );
  }
}