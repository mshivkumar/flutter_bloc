import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'hydrated_counter_event.dart';

part 'hydrated_counter_state.dart';

class HydratedCounterBloc
    extends Bloc<HydratedCounterEvent, HydratedCounterState>
    with HydratedMixin {
  HydratedCounterBloc() : super(HydratedCounterState.initial()) {
    on<HydratedCounterEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<IncrementCounterEvent>(_incrementCounter);

    on<DecrementCounterEvent>(_decrementCounter);
  }

  void _incrementCounter(
      IncrementCounterEvent event, Emitter<HydratedCounterState> emit) {
    emit(state.copyWith(counter: state.counter + 1));
  }

  void _decrementCounter(
      DecrementCounterEvent event, Emitter<HydratedCounterState> emit) {
    emit(state.copyWith(counter: state.counter - 1));
  }

  @override
  HydratedCounterState? fromJson(Map<String, dynamic> json) {
    print('HydratedCounter from Storage: $json');
    HydratedCounterState hydratedCounterState =
        HydratedCounterState.fromJson(json);
    print('CounterState: $hydratedCounterState');
    return hydratedCounterState;
  }

  @override
  Map<String, dynamic>? toJson(HydratedCounterState state) {
    print('CounterState: $state');
    final Map<String, dynamic> counterJson = state.toJson();
    print('CounterState to json: $counterJson');
    return counterJson;
  }
}
