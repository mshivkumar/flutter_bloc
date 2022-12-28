import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testapp/screens/home_page.dart';

import 'cubits/theme/theme_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: Builder(builder: (context) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: context.watch<ThemeCubit>().state.appTheme == AppTheme.light
              ? ThemeData.light()
              : ThemeData.dark(),
          home: const HomePage(),
        );
      }),
    );
  }
}
