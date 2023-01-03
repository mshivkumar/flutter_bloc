part of 'counter_bloc.dart';

abstract class EventTransformerCounterEvent extends Equatable {
  const EventTransformerCounterEvent();

  @override
  List<Object> get props => [];
}

class IncrementCounterEvent extends EventTransformerCounterEvent {}

class DecrementCounterEvent extends EventTransformerCounterEvent {}
