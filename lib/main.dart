import 'package:biomedic_control/data/data.dart';
import 'package:biomedic_control/presentation/blocs/auth/auth_bloc.dart';
import 'package:biomedic_control/presentation/presentation.dart' show MyApp;
import 'package:biomedic_control/utils/utils.dart'
    show FirebaseImpl, Enviroment;
import 'package:firebase_auth/firebase_auth.dart' show FirebaseAuth;
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart' show Firebase;
import 'package:flutter_bloc/flutter_bloc.dart'
    show BlocProvider, MultiBlocProvider;
import 'firebase_options.dart' show DefaultFirebaseOptions;

void main() async {
  await Enviroment.loadEnviroment(Enviroment.fileName);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseImpl().firebaseAuth.useAuthEmulator(Enviroment.host, 9099);
  FirebaseImpl().firestore.useFirestoreEmulator(Enviroment.host, 8080);
  final datasource =
      BiotechRemoteDatasourceImpl(authProvider: FirebaseAuth.instance);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AuthBloc(
            repository: BiotechRepositoryImpl(
              datasource,
            ),
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}
