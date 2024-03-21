import 'package:biomedic_control/presentation/presentation.dart';
import 'package:biomedic_control/presentation/theme/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BioTech Solutions',
      theme: themeApp,
      initialRoute: FirebaseAuth.instance.currentUser != null
          ? DashboardScreen.route
          : AuthPage.route,
      onGenerateRoute: Routes.routes,
    );
  }
}
