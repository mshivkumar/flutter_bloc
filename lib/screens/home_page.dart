import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testapp/bloc/counter/counter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          '${context.watch<CounterBloc>().state.counter}',
          style: const TextStyle(fontSize: 52),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              context.read<CounterBloc>().add(IncrementCounterEvent());
            },
            child: const Icon(
              Icons.add,
            ),
          ),
          const SizedBox(
            width: 10.0,
          ),
          FloatingActionButton(
            onPressed: () {
              context.read<CounterBloc>().add(DecrementCounterEvent());
            },
            child: const Icon(
              Icons.remove,
            ),
          )
        ],
      ),
    );
  }
}
