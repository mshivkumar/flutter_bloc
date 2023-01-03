import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'theme_event.dart';

part 'theme_state.dart';

class HydratedThemeBloc extends Bloc<HydratedThemeEvent, HydratedThemeState> {
  HydratedThemeBloc() : super(HydratedThemeState.initial()) {
    on<ToggleThemeEvent>((event, emit) {
      if (state.appTheme == AppTheme.light) {
        emit(state.copyWith(appTheme: AppTheme.dark));
      } else if (state.appTheme == AppTheme.dark) {
        emit(state.copyWith(appTheme: AppTheme.light));
      }
    });
  }
}
