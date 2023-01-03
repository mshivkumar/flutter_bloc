part of 'counter_cubit.dart';

class NamedCounterState extends Equatable {
  final int counter;

  @override
  List<Object> get props => [counter];

//<editor-fold desc="Data Methods">

  const NamedCounterState({
    required this.counter,
  });

  factory NamedCounterState.initial() {
    return const NamedCounterState(counter: 0);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NamedCounterState &&
          runtimeType == other.runtimeType &&
          counter == other.counter);

  @override
  int get hashCode => counter.hashCode;

  @override
  String toString() {
    return 'CounterState{ counter: $counter,}';
  }

  NamedCounterState copyWith({
    int? counter,
  }) {
    return NamedCounterState(
      counter: counter ?? this.counter,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'counter': counter,
    };
  }

  factory NamedCounterState.fromMap(Map<String, dynamic> map) {
    return NamedCounterState(
      counter: map['counter'] as int,
    );
  }

//</editor-fold>
}
