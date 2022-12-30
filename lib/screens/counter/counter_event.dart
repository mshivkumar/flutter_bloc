part of 'counter_bloc.dart';

abstract class CounterEvent extends Equatable {
  const CounterEvent();

  @override
  List<Object> get props => [];
}

class IncrementCounterEvent extends CounterEvent {
  final int incrementSize;

  const IncrementCounterEvent({
    required this.incrementSize,
  });

  @override
  String toString() {
    return 'IncrementCounterEvent{ incrementSize: $incrementSize,}';
  }
}
