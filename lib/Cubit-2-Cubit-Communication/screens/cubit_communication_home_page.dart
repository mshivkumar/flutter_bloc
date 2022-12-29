import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testapp/Cubit-2-Cubit-Communication/cubit/color_counter/color_counter_cubit.dart';

import '../cubit/color/color_cubit.dart';

class CubitCommunicationHomePage extends StatelessWidget {
  static const routeName = '/cubit-communication-home-page';

  const CubitCommunicationHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.watch<ColorCubit>().state.color,
      appBar: AppBar(
        title: const Text('Cubit 2 Cubit'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  context.read<ColorCubit>().changeColor();
                },
                child: const Text('Change Color')),
            Text(
              '${context.watch<ColorCounterCubit>().state.counter}',
              style: TextStyle(
                  fontSize: 52,
                  color: context.read<ColorCubit>().state.color == Colors.black
                      ? Colors.white
                      : Colors.black),
            ),
            ElevatedButton(
                onPressed: () {
                  context.read<ColorCounterCubit>().incrementColorCounter();
                },
                child: const Text('Increment Counter')),
          ],
        ),
      ),
    );
  }
}
