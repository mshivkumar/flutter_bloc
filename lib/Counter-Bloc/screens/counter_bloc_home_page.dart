import 'package:flutter/material.dart';

class CounterBlocHomePage extends StatelessWidget {
  static const routeName = '/counter-bloc-home-page';

  const CounterBlocHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Bloc'),
      ),
      body: const Center(
        child: Text(
          '0',
          style: TextStyle(fontSize: 52),
        ),
      ),
      floatingActionButton: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FloatingActionButton(
              onPressed: () {},
              child: const Icon(Icons.remove),
            ),
            FloatingActionButton(
              onPressed: () {},
              child: const Icon(Icons.add),
            )
          ]),
    );
  }
}
