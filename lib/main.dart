import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontendthelastcastle/firebase_options.dart';

import 'Pages/Customer/CustomerHome.C.dart';
import 'Pages/Employee/EmployeeHome.C.dart';
import 'Pages/Employee/tipo/NuevoTipo.T.dart';
import 'Pages/Login/Login.L.dart';
import 'Pages/Signup/Signup.S.dart';
import 'Pages/Start/Home.S.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

class AppState extends StatelessWidget {
  const AppState({super.key});
  @override
  Widget build(BuildContext context) {
    return const ProviderScope(child: MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ecommerce',
      initialRoute: 'HomeEmp',
      routes: {
        'Home': (context) => const MyHome(),
        'login': (context) => Login(),
        'signup': (context) => Signup(),
        'HomeCus': (context) => const CustomerHome(),
        'HomeEmp': (context) => const EmployyeHome(),
        'nuevoTipo': (context) => const CreateTipo(),
      },
    );
  }
}
