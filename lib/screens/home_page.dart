import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testapp/screens/bloc/color_bloc.dart';

import 'counter/counter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int incrementSize = 1;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ColorBloc, ColorState>(
      listener: (context, state) {
        if (state.color == Colors.red) {
          incrementSize = 1;
        } else if (state.color == Colors.green) {
          incrementSize = 10;
        } else if (state.color == Colors.blue) {
          incrementSize = 100;
        } else if (state.color == Colors.black) {
          incrementSize = -100;
        }
      },
      child: Scaffold(
        backgroundColor: context.watch<ColorBloc>().state.color,
        appBar: AppBar(
          title: const Text('Bloc2Bloc'),
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
                    context.read<ColorBloc>().add(ChangeColorEvent());
                  },
                  child: const Text('Change Color'),
                ),
                Text(
                  '${context.watch<CounterBloc>().state.counter}',
                  style: TextStyle(
                      fontSize: 24,
                      color: (context.watch<ColorBloc>().state.color ==
                              Colors.black
                          ? Colors.white
                          : Colors.black)),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(
                        IncrementCounterEvent(incrementSize: incrementSize));
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
