part of 'counter_bloc.dart';

class EventTransformerCounterState extends Equatable {
  final int counter;

  @override
  List<Object> get props => [counter];

//<editor-fold desc="Data Methods">

  const EventTransformerCounterState({
    required this.counter,
  });

  factory EventTransformerCounterState.initial() {
    return const EventTransformerCounterState(counter: 0);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EventTransformerCounterState &&
          runtimeType == other.runtimeType &&
          counter == other.counter);

  @override
  int get hashCode => counter.hashCode;

  @override
  String toString() {
    return 'CounterState{ counter: $counter,}';
  }

  EventTransformerCounterState copyWith({
    int? counter,
  }) {
    return EventTransformerCounterState(
      counter: counter ?? this.counter,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'counter': counter,
    };
  }

  factory EventTransformerCounterState.fromMap(Map<String, dynamic> map) {
    return EventTransformerCounterState(
      counter: map['counter'] as int,
    );
  }

//</editor-fold>
}
