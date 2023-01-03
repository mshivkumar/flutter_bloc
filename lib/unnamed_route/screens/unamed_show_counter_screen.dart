import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/counter/counter_cubit.dart';

class UnnamedShowCounterScreen extends StatelessWidget {
  static const String routeName = 'un-named-show-counter-screen';
  const UnnamedShowCounterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter screen'),
      ),
      body: Center(
        child: Text(
          '${context.watch<UnnamedCounterCubit>().state.counter}',
          style: const TextStyle(fontSize: 52.0),
        ),
      ),
    );
  }
}
