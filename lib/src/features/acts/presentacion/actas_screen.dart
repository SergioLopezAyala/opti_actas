import 'package:flutter/material.dart';
import '/src/shared/widgets/AppBarRappi.dart';


class ActasScreen extends StatelessWidget {

  const ActasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBarRappi(
     title: 'Actas',
      body: const Center(child: Text('Pantalla de Actas')),
    );
  }
}
