import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testapp/screens/cubits/counter/counter_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var counterProvider = BlocProvider.of<CounterCubit>(context);

    return Scaffold(
      body: BlocConsumer<CounterCubit, CounterState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Center(
            child: Text(
              '${state.counter}',
              style: const TextStyle(fontSize: 52),
            ),
          );
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              counterProvider.decrement();
            },
            child: const Icon(
              Icons.remove,
            ),
          ),
          FloatingActionButton(
            onPressed: () {
              counterProvider.increment();
            },
            child: const Icon(
              Icons.add,
            ),
          )
        ],
      ),
    );
  }
}
