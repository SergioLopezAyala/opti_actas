import 'package:flutter/material.dart';
import '/src/widgets/appscaffold.dart';


class ActasScreen extends StatelessWidget {

  const ActasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
     title: 'Actas',
      body: const Center(child: Text('Pantalla de Actas')),
    );
  }
}
