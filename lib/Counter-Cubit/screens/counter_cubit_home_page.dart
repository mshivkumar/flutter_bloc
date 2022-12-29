import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/counter/counter_cubit.dart';

class CounterCubitHomePage extends StatelessWidget {
  static const routeName = '/counter-cubit-home-page';
  const CounterCubitHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Cubit'),
      ),
      body: Center(
        child: Text(
          '${context.watch<CounterCubit>().state.counter}',
          style: const TextStyle(fontSize: 52),
        ),
      ),
      floatingActionButton: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FloatingActionButton(
              onPressed: () {
                context.read<CounterCubit>().decrementCounter();
              },
              child: const Icon(Icons.remove),
            ),
            FloatingActionButton(
              onPressed: () {
                context.read<CounterCubit>().incrementCounter();
              },
              child: const Icon(Icons.add),
            )
          ]),
    );
  }
}
