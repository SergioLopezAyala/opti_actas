import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatelessWidget{

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PERFIL')),
      body: Center(
        child: ElevatedButton(
          onPressed:() => context.push('/profile'),
          child: const Text('Ir a perfil'),
        ),
      ),
    );
  }
}