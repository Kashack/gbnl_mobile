import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gbnl_mobile/features/auth/cubit/auth_cubit.dart';
import 'package:gbnl_mobile/features/dashboard/cubit/dashboard_cubit.dart';

import '../features/auth/presentation/auth.dart';
import '../features/dashboard/presentation/dashboard.dart';
import '../features/notification/presentation/notfication.dart';
import 'app_routes.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.auth:
        return MaterialPageRoute(builder: (_) =>
            BlocProvider(
              create: (context) => AuthCubit(),
              child: AuthScreen(),
            ));

      case AppRoutes.notification:
        return MaterialPageRoute(builder: (_) => NotificationScreen());

      case AppRoutes.dashboard:
        return MaterialPageRoute(builder: (_) =>
            BlocProvider(
              create: (context) => DashboardCubit()..loadUserName(),
              child: DashboardScreen(),
            ));

      default:
        return MaterialPageRoute(
          builder: (_) =>
              Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}')),
              ),
        );
    }
  }
}