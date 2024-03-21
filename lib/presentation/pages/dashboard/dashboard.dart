import 'package:biomedic_control/presentation/blocs/auth/auth_bloc.dart';
import 'package:biomedic_control/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardScreen extends StatefulWidget {
  static const route = '/';
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int selectedPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyScreen(selectedPageIndex),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              context.read<AuthBloc>().add(const AuthLogoutPressed());
            },
            icon: const Icon(
              Icons.exit_to_app_outlined,
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: NavigationBar(
            selectedIndex: selectedPageIndex,
            onDestinationSelected: (int index) {
              setState(() => selectedPageIndex = index);
            },
            destinations: Routes.menuNavigators(),
          ),
        ),
      ),
    );
  }

  _bodyScreen(int index) {
    return [
      const Center(
        child: Text('Casos Creados'),
      ),
      const Center(
        child: Text('Casos asignados'),
      ),
      const Center(
        child: Text('Casos Pausados'),
      ),
      const Center(
        child: Text('Casos Completados'),
      ),
    ][index];
  }
}
