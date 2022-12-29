import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testapp/Counter-Bloc/bloc/counter/counter_bloc.dart';
import 'package:testapp/Cubit-2-Cubit-Communication/screens/cubit_communication_home_page.dart';
import 'package:testapp/Theme-Bloc/screens/theme_bloc_home_page.dart';
import 'package:testapp/Theme-Cubit/screens/theme_cubit_home_page.dart';

import 'Counter-Bloc/screens/counter_bloc_home_page.dart';
import 'Counter-Cubit/cubits/counter/counter_cubit.dart';
import 'Counter-Cubit/screens/counter_cubit_home_page.dart';
import 'Theme-Bloc/bloc/theme/theme_bloc.dart' as themeBloc;
import 'Theme-Cubit/cubit/theme/theme_cubit.dart';
import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterCubit()),
        BlocProvider(create: (context) => CounterBloc()),
        BlocProvider(create: (context) => ThemeCubit()),
        BlocProvider(create: (context) => themeBloc.ThemeBloc()),
      ],
      child: Builder(builder: (context) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: context.watch<themeBloc.ThemeBloc>().state.appTheme ==
                  themeBloc.AppTheme.light
              ? ThemeData.light()
              : ThemeData.dark(),
          //ThemeData.light(),
          home: const Homepage(),
          routes: {
            CounterCubitHomePage.routeName: (ctx) =>
                const CounterCubitHomePage(),
            CounterBlocHomePage.routeName: (ctx) => const CounterBlocHomePage(),
            ThemeCubitHomePage.routeName: (ctx) => const ThemeCubitHomePage(),
            ThemeBlocHomePage.routeName: (ctx) => const ThemeBlocHomePage(),
            CubitCommunicationHomePage.routeName: (ctx) =>
                const CubitCommunicationHomePage(),
          },
        );
      }),
    );
  }
}
