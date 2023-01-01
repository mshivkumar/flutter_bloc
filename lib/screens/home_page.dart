import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testapp/cubits/counter/counter_cubit.dart';
import 'package:testapp/screens/show_counter.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/';

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int incrementSize = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Anonymous Route Access'),
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
                onPressed: () async {
                  await Navigator.pushNamed(
                    context,
                    ShowCounter.routeName,
                  );
                },
                child: const Text('Show Counter'),
              ),
              ElevatedButton(
                onPressed: () {
                  BlocProvider.of<CounterCubit>(context).incrementCounter();
                },
                child: const Text('Increment Counter'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
