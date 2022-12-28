import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../cubits/theme/theme_cubit.dart';

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
            context.read<ThemeCubit>().changeTheme(randInt: randInt);
          },
          child: const Text('Change Theme.'),
        ),
      ),
    );
  }
}
