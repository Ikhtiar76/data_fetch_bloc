import 'package:data_fetch_bloc/presentation/home.dart';
import 'package:data_fetch_bloc/repo/reg_repository.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'presentation/registration/reg_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.grey[900],
        // color: Colors.grey[900],
        scaffoldBackgroundColor: Colors.white,
      ),
      home: RepositoryProvider<RegistrationRepository>(
        create: (context) => RegistrationRepository(),
        child: const Home(),
      ),
    );
  }
}
