import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testapp/onGenerateRoute/cubits/counter/counter_cubit.dart';

class onGenerateRouteShowCounterScreen extends StatelessWidget {
  static const String routeName = 'on-generate-show-counter-screen';

  const onGenerateRouteShowCounterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter screen'),
      ),
      body: Center(
        child: Text(
          '${context.watch<onGenerateCounterCubit>().state.counter}',
          style: const TextStyle(fontSize: 52.0),
        ),
      ),
    );
  }
}
