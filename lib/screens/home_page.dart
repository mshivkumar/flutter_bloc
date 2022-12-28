import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testapp/screens/blocs/theme/theme_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme app'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            final int randInt = Random().nextInt(10);
            print('Random number: $randInt');
            context.read<ThemeBloc>().add(ChangeThemeEvent(randInt: randInt));
          },
          child: const Text('Change Theme.'),
        ),
      ),
    );
  }
}
