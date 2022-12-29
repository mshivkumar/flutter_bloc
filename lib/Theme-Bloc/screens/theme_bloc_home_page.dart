import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/theme/theme_bloc.dart';

class ThemeBlocHomePage extends StatelessWidget {
  static const routeName = '/theme-bloc-home-page';

  const ThemeBlocHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Bloc'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '${context.watch<ThemeBloc>().state.counter}',
            style: const TextStyle(fontSize: 52),
          ),
          ElevatedButton(
            onPressed: () {
              context.read<ThemeBloc>().add(IncrementCounterEvent());
              context.read<ThemeBloc>().add(ChangeThemeEvent());
            },
            child: const Text('Change Theme'),
          ),
        ],
      ),
    );
  }
}
