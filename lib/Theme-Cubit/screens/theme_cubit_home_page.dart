import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testapp/Theme-Cubit/cubit/theme/theme_cubit.dart';

class ThemeCubitHomePage extends StatelessWidget {
  static const routeName = '/theme-cubit-home-page';

  const ThemeCubitHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Cubit'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '${context.watch<ThemeCubit>().state.counter}',
            style: const TextStyle(fontSize: 52),
          ),
          ElevatedButton(
            onPressed: () {
              context.read<ThemeCubit>().incrementCounter();
              context.read<ThemeCubit>().changeTheme();
            },
            child: const Text('Change Theme'),
          ),
        ],
      ),
    );
  }
}
