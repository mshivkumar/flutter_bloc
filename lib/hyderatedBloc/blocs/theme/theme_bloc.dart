import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'theme_event.dart';

part 'theme_state.dart';

class HydratedThemeBloc extends Bloc<HydratedThemeEvent, HydratedThemeState>
    with HydratedMixin {
  HydratedThemeBloc() : super(HydratedThemeState.initial()) {
    on<ToggleThemeEvent>((event, emit) {
      if (state.appTheme == AppTheme.light) {
        emit(state.copyWith(appTheme: AppTheme.dark));
      } else if (state.appTheme == AppTheme.dark) {
        emit(state.copyWith(appTheme: AppTheme.light));
      }
    });
  }

  @override
  HydratedThemeState? fromJson(Map<String, dynamic> json) {
    print('HydratedThemeState from storage: $json');
    final HydratedThemeState hydratedThemeState =
        HydratedThemeState.fromJson(json);
    print('HydratedStorage to HydratedThemeState: $hydratedThemeState');
    return hydratedThemeState;
  }

  @override
  Map<String, dynamic>? toJson(HydratedThemeState state) {
    print('HydratedThemeState: $state');
    Map<String, dynamic> hydratedThemeJson = state.toJson();
    print('HydratedThemeState to Storage: $hydratedThemeJson');
    return hydratedThemeJson;
  }
}
