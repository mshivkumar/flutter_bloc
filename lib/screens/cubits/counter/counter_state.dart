part of 'counter_cubit.dart';

class CounterState extends Equatable {
  final int counter;

  const CounterState({
    required this.counter,
  });

  factory CounterState.initial() {
    return const CounterState(counter: 0);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CounterState &&
          runtimeType == other.runtimeType &&
          counter == other.counter);

  @override
  int get hashCode => counter.hashCode;

  @override
  String toString() {
    return 'CounterState{ counter: $counter,}';
  }

  CounterState copyWith({
    int? counter,
  }) {
    return CounterState(
      counter: counter ?? this.counter,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'counter': this.counter,
    };
  }

  factory CounterState.fromMap(Map<String, dynamic> map) {
    return CounterState(
      counter: map['counter'] as int,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [counter];

//</editor-fold>
}
