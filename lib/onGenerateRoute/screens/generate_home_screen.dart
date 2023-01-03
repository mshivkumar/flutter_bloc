import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testapp/onGenerateRoute/cubits/counter/counter_cubit.dart';

import 'generate_show_counter_screen.dart';

class onGenerateRouteHomeScreen extends StatelessWidget {
  static const String routeName = 'on-generate-route-home-page';

  const onGenerateRouteHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text('on Generate Route'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                        context,
                        onGenerateRouteShowCounterScreen.routeName,
                    );
                  },
                  child: const Text('Show Counter'),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<onGenerateCounterCubit>().incrementCounter();
                  },
                  child: const Text('Increment Counter'),
                ),
              ],
            ),
          )),
    );
  }
}
