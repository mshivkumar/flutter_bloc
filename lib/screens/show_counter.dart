import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testapp/cubits/counter/counter_cubit.dart';

class ShowCounter extends StatelessWidget {
  static const routeName = '/show-me-counter-screen';
  const ShowCounter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Show Counter'),
      ),
      body: Center(
        child: BlocBuilder<CounterCubit, CounterState>(
          builder: (context, state) {
            return Text(
              '${state.counter}',
              style: const TextStyle(fontSize: 52),
            );
          },
        ),
      ),
    );
  }
}
