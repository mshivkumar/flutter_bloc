import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../color/color_cubit.dart';

part 'color_counter_state.dart';

class ColorCounterCubit extends Cubit<ColorCounterState> {
  int incrementCounter = 0;
  final ColorCubit colorCubit;
  late StreamSubscription streamSubscription;

  ColorCounterCubit({required this.colorCubit})
      : super(ColorCounterState.initial()) {
    streamSubscription = colorCubit.stream.listen((colorCubitState) {
      if (colorCubitState.color == Colors.red) {
        incrementCounter = 1;
      } else if (colorCubitState.color == Colors.green) {
        incrementCounter = 10;
      } else if (colorCubitState.color == Colors.blue) {
        incrementCounter = 100;
      } else if (colorCubitState.color == Colors.black) {
        incrementCounter = -100;
      }
    });
  }

  void incrementColorCounter() {
    emit(state.copyWith(counter: state.counter + incrementCounter));
  }
}

