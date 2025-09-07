import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:proyecto_actas/src/features/acts/actas_screen.dart';
import 'package:proyecto_actas/src/features/meetings/meeting_screen.dart';
import 'package:proyecto_actas/src/features/meetings/meetings_screen.dart';
import 'package:proyecto_actas/src/features/profile/profile_screen.dart';
import 'package:proyecto_actas/src/features/settings/settings_screen.dart';

import 'features/auth/login_screen.dart';
import 'features/home_screen.dart';
import 'features/Acts/acta_screen.dart';


final GoRouter router =GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
    path: '/login',
    builder:(BuildContext context, GoRouterState state) {
      return const LoginScreen();
    },
    ),
    GoRoute(
    path:'/home',
    builder: (BuildContext context, GoRouterState state){
      return const HomeScreen();
    },
    ),
    GoRoute(path: '/acta',
      builder: (BuildContext context, GoRouterState state){
      return const ActaScreen();
      },

    ),
    GoRoute(path: '/meeting',
    builder: (BuildContext context, GoRouterState state){
      return const MeetingScreen();
    },
    ),GoRoute(path: '/profile',
      builder: (BuildContext context, GoRouterState state){
        return const ProfileScreen();
      },
      ),
      GoRoute(path: '/meetings',
      builder: (BuildContext context, GoRouterState state){
      return const MeetingsScreen();
        }),
      GoRoute(path: '/settings',
      builder: (BuildContext context, GoRouterState state){
      return const Settings();
      },
      ),
      GoRoute(path: '/acts',
      builder: (BuildContext context, GoRouterState state){
      return const ActasScreen();
      },
      )

  ],
);
