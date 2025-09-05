import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatelessWidget{

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Profile')),
        body: Center(
          child: ElevatedButton(
            onPressed:() => context.push('/profil'),
            child: const Text('Ir a perfil'),
          ),
        ),
    ); // TODO: implement build
  }
}