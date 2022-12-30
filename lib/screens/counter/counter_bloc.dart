import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../bloc/color_bloc.dart';

part 'counter_event.dart';

part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  int incrementSize = 1;
  final ColorBloc colorBloc;
  late final StreamSubscription streamSubscription;

  CounterBloc({required this.colorBloc}) : super(CounterState.initial()) {
    streamSubscription = colorBloc.stream.listen((colorState) {
      if (colorState.color == Colors.red) {
        incrementSize = 1;
      } else if (colorState.color == Colors.green) {
        incrementSize = 10;
      } else if (colorState.color == Colors.blue) {
        incrementSize = 100;
      } else if (colorState.color == Colors.black) {
        incrementSize = -100;
      }
    });

    on<IncrementCounterEvent>((event, emit) {
      emit(state.copyWith(counter: state.counter + incrementSize));
    });
  }
}
