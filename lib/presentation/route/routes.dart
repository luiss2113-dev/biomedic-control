import 'package:biomedic_control/presentation/blocs/auth/auth_bloc.dart';
import 'package:biomedic_control/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Routes {
  static Route routes(RouteSettings settings) {
    switch (settings.name) {
      case DashboardScreen.route:
        return MaterialPageRoute(
          builder: (_) => BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state.status == AppStatus.unauthenticated) {
                Navigator.pushReplacementNamed(context, AuthPage.route);
              }
            },
            child: const DashboardScreen(),
          ),
        );
      case AuthPage.route:
        return MaterialPageRoute(
          builder: (_) => BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state.status == AppStatus.authenticated) {
                Navigator.pushReplacementNamed(context, DashboardScreen.route);
              }
            },
            child: const AuthPage(),
          ),
        );
      default:
        return MaterialPageRoute(builder: (_) => Container());
    }
  }

  static List<NavigationDestination> menuNavigators() {
    return [
      const NavigationDestination(
        selectedIcon: MyButtonIcon(
          icon: Icons.person_4_outlined,
          isSelected: true,
        ),
        icon: MyButtonIcon(icon: Icons.person_4_rounded),
        label: 'Creados',
      ),
      const NavigationDestination(
        selectedIcon: MyButtonIcon(
          icon: Icons.view_carousel_outlined,
          isSelected: true,
        ),
        icon: MyButtonIcon(icon: Icons.view_carousel_rounded),
        label: 'Asignados',
      ),
      const NavigationDestination(
        selectedIcon: MyButtonIcon(
          icon: Icons.view_carousel_outlined,
          isSelected: true,
        ),
        icon: MyButtonIcon(icon: Icons.view_carousel_rounded),
        label: 'Pausados',
      ),
      const NavigationDestination(
        selectedIcon: MyButtonIcon(
          icon: Icons.location_on_outlined,
          isSelected: true,
        ),
        icon: MyButtonIcon(icon: Icons.location_on_rounded),
        label: 'Completados',
      ),
    ];
  }
}
