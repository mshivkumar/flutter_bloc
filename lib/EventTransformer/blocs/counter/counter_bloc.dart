import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';

part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState.initial()) {
    on<CounterEvent>((event, emit) {

    });

    on<IncrementCounterEvent>(_incrementCounter);

    on<DecrementCounterEvent>(_decrementCounter);
  }

  Future<void> _incrementCounter(
      IncrementCounterEvent event, Emitter<CounterState> emit) async {
    await Future.delayed(const Duration(seconds: 4));
    emit(state.copyWith(counter: state.counter + 1));
  }

  Future<void> _decrementCounter(
      DecrementCounterEvent event, Emitter<CounterState> emit) async {
    await Future.delayed(const Duration(seconds: 2));
    emit(state.copyWith(counter: state.counter - 1));
  }
}
