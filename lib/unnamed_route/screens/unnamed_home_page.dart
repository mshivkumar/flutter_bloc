import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testapp/unnamed_route/screens/unamed_show_counter_screen.dart';

import '../cubit/counter/counter_cubit.dart';

class UnnamedHomePage extends StatelessWidget {
  static const String routeName = '/unnamed-home-page';
  const UnnamedHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Un Named Route'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => BlocProvider.value(
                                value: context.read<UnnamedCounterCubit>(),
                                child: const UnnamedShowCounterScreen())));
                  },
                  child: const Text('Show Counter'),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<UnnamedCounterCubit>().incrementCounter();
                  },
                  child: const Text('Increment Counter'),
                ),
              ],
            ),
          )),
    );
  }
}
