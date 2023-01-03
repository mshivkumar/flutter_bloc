import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/counter/counter_cubit.dart';
import 'named_show_counter_screen.dart';

class NamedHomeScreen extends StatelessWidget {
  static const String routeName = '/named-home-screen';

  const NamedHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Named Route'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                        context, NamedShowCounterScreen.routeName);
                  },
                  child: const Text('Show Counter'),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<NamedCounterCubit>().incrementCounter();
                  },
                  child: const Text('Increment Counter'),
                ),
              ],
            ),
          )),
    );
  }
}
