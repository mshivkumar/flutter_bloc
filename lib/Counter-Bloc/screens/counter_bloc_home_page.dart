import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/counter/counter_bloc.dart';

class CounterBlocHomePage extends StatelessWidget {
  static const routeName = '/counter-bloc-home-page';

  const CounterBlocHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Bloc'),
      ),
      body: Center(
        child: Text(
          '${context.watch<CounterBloc>().state.counter}',
          style: const TextStyle(fontSize: 52),
        ),
      ),
      floatingActionButton: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FloatingActionButton(
              onPressed: () {
                context.read<CounterBloc>().add(DecrementCounterEvent());
              },
              child: const Icon(Icons.remove),
            ),
            FloatingActionButton(
              onPressed: () {
                context.read<CounterBloc>().add(IncrementCounterEvent());
              },
              child: const Icon(Icons.add),
            )
          ]),
    );
  }
}
