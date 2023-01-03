import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testapp/EventTransformer/blocs/counter/counter_bloc.dart';

class EventTransformerHomePage extends StatelessWidget {
  static const String routeName = 'event-tarnsformer-home-page';

  const EventTransformerHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Event Transformer'),
      ),
      body: Center(
        child: Text(
          '${context.watch<EventTransformerCounterBloc>().state.counter}',
          style: const TextStyle(fontSize: 52),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'increment',
            onPressed: () {
              context.read<EventTransformerCounterBloc>().add(IncrementCounterEvent());
            },
            child: const Icon(
              Icons.add,
            ),
          ),
          const SizedBox(
            width: 10.0,
          ),
          FloatingActionButton(
            heroTag: 'decrement',
            onPressed: () {
              context.read<EventTransformerCounterBloc>().add(DecrementCounterEvent());
            },
            child: const Icon(
              Icons.remove,
            ),
          )
        ],
      ),
    );
  }
}
