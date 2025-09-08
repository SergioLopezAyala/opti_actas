import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '/src/shared/widgets/AppBarRappi.dart';

class MeetingsScreen extends StatelessWidget{

  const MeetingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBarRappi(
     title: 'Reuniones',
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: 8,
        separatorBuilder: (_, __) => const SizedBox(height: 8),
        itemBuilder: (_, i) => Card(
          child: ListTile(
            title: Text('Reunión #$i'),
            subtitle: const Text('Hoy • 30 min'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
        ),
      ),
    );
  }
}