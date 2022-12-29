import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testapp/cubits/counter/counter_cubit.dart';

import '../cubits/color/color_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.watch<ColorCubit>().state.color,
      appBar: AppBar(
        title: const Text('Cubit2Cubit'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
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
                context.read<CounterCubit>().changeCounter();
              },
              child: const Text('Increment Counter'),
            ),
          ],
        ),
      ),
    );
  }
}
