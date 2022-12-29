import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Counter-Bloc/screens/counter_bloc_home_page.dart';
import 'Counter-Cubit/cubits/counter/counter_cubit.dart';
import 'Counter-Cubit/screens/counter_cubit_home_page.dart';
import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.light(),
        home: const Homepage(),
        routes: {
          CounterCubitHomePage.routeName: (ctx) => const CounterCubitHomePage(),
          CounterBlocHomePage.routeName: (ctx) => const CounterBlocHomePage(),
        },
      ),
    );
  }
}
