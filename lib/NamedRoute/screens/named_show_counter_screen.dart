import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testapp/NamedRoute/cubit/counter/counter_cubit.dart';

class NamedShowCounterScreen extends StatelessWidget {
  static const String routeName = 'named-show-counter-screen';

  const NamedShowCounterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter screen'),
      ),
      body: Center(
        child: Text(
          '${context.watch<NamedCounterCubit>().state.counter}',
          style: const TextStyle(fontSize: 52.0),
        ),
      ),
    );
  }
}
