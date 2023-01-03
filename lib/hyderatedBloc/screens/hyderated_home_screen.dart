import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:testapp/hyderatedBloc/blocs/counter/hydrated_counter_bloc.dart';
import 'package:testapp/hyderatedBloc/blocs/theme/theme_bloc.dart';

class HyderatedHomeScreen extends StatelessWidget {
  static const String routeName = 'hydrated-home-page';

  const HyderatedHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hydrated Bloc'),
      ),
      body: Center(
        child: Text(
          '${context.watch<HydratedCounterBloc>().state.counter}',
          style: TextStyle(fontSize: 52.0),
        ),
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'changeTheme',
            onPressed: () {
              context.read<HydratedThemeBloc>().add(ToggleThemeEvent());
            },
            child: const Icon(Icons.sunny_snowing),
          ),
          const SizedBox(
            width: 10.0,
          ),
          FloatingActionButton(
            heroTag: 'incrementCounter',
            onPressed: () {
              context.read<HydratedCounterBloc>().add(IncrementCounterEvent());
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(
            width: 10.0,
          ),
          FloatingActionButton(
            heroTag: 'decrementCounter',
            onPressed: () {
              context.read<HydratedCounterBloc>().add(DecrementCounterEvent());
            },
            child: const Icon(Icons.remove),
          ),
          const SizedBox(
            width: 10.0,
          ),
          FloatingActionButton(
            heroTag: 'clearHydratedStorage',
            onPressed: () {

            },
            child: const Icon(Icons.delete_forever),
          ),
        ],
      ),
    );
  }
}
