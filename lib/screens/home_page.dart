import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testapp/cubits/counter/counter_cubit.dart';

import '../cubits/color/color_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int incrementCounterSize = 1;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ColorCubit, ColorState>(
      listener: (context, state) {
        if (state.color == Colors.red) {
          incrementCounterSize = 1;
        } else if (state.color == Colors.green) {
          incrementCounterSize = 10;
        } else if (state.color == Colors.blue) {
          incrementCounterSize = 100;
        } else if (state.color == Colors.black) {
          context.read<CounterCubit>().changeCounter(incrementSize: -100);
          incrementCounterSize = -100;
        }
      },
      child: Scaffold(
        backgroundColor: context.watch<ColorCubit>().state.color,
        appBar: AppBar(
          title: const Text('Cubit2Cubit'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    context.read<ColorCubit>().changeColor();
                  },
                  child: const Text('Change Color'),
                ),
                Text(
                  '${context.watch<CounterCubit>().state.counter}',
                  style: const TextStyle(fontSize: 24),
                ),
                ElevatedButton(
                  onPressed: () {
                    context
                        .read<CounterCubit>()
                        .changeCounter(incrementSize: incrementCounterSize);
                  },
                  child: const Text('Increment Counter'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
