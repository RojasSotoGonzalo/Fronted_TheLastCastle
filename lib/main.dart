import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'Pages/Customer/CustomerHome.C.dart';
import 'Pages/Login/Login.L.dart';
import 'Pages/Signup/Signup.S.dart';
import 'Pages/Start/Home.S.dart';

void main() => runApp(const AppState());

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
      initialRoute: 'HomeCus',
      routes: {
        'Home': (context) => const MyHome(),
        'login': (context) => Login(),
        'signup': (context) => Signup(),
        'HomeCus': (context) => const CustomerHome(),
      },
    );
  }
}
