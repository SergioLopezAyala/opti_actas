import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:proyecto_actas/src/features/meetings/meeting_screen.dart';

import 'features/auth/login_screen.dart';
import 'features/meetings/home_screen.dart';
import 'features/meetings/acta_screen.dart';

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
        return const MeetingScreen();
      },
    )

  ],
);