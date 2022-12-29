import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../color/color_cubit.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  int incrementCounterSize = 1;
  final ColorCubit colorCubit;
  late final StreamSubscription streamSubscription;

  CounterCubit({required this.colorCubit}) : super(CounterState.initial()) {
    streamSubscription = colorCubit.stream.listen((colorState) {
      if (colorState.color == Colors.red) {
        incrementCounterSize = 1;
      } else if (colorState.color == Colors.green) {
        incrementCounterSize = 10;
      } else if (colorState.color == Colors.blue) {
        incrementCounterSize = 100;
      } else if (colorState.color == Colors.black) {
        emit(state.copyWith(counter: state.counter - 100));
        incrementCounterSize = -100;
      }
    });
  }

  void changeCounter() {
    emit(state.copyWith(counter: state.counter + incrementCounterSize));
  }

  @override
  Future<void> close() {
    streamSubscription.cancel();
    return super.close();
  }
}
