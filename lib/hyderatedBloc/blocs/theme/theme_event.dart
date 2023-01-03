part of 'theme_bloc.dart';

abstract class HydratedThemeEvent extends Equatable {
  const HydratedThemeEvent();

  @override
  List<Object> get props => [];
}

class ToggleThemeEvent extends HydratedThemeEvent {}
