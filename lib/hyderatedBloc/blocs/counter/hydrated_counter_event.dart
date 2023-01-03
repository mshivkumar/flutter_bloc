part of 'hydrated_counter_bloc.dart';

abstract class HydratedCounterEvent extends Equatable {
  const HydratedCounterEvent();

  @override
  List<Object> get props => [];
}

class IncrementCounterEvent extends HydratedCounterEvent {}

class DecrementCounterEvent extends HydratedCounterEvent {}