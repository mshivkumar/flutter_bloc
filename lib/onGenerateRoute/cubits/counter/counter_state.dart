part of 'counter_cubit.dart';

class onGenerateCounterState extends Equatable {
  final int counter;

  @override
  List<Object> get props => [counter];

//<editor-fold desc="Data Methods">

  const onGenerateCounterState({
    required this.counter,
  });

  factory onGenerateCounterState.initial() {
    return const onGenerateCounterState(counter: 0);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is onGenerateCounterState &&
          runtimeType == other.runtimeType &&
          counter == other.counter);

  @override
  int get hashCode => counter.hashCode;

  @override
  String toString() {
    return 'CounterState{ counter: $counter,}';
  }

  onGenerateCounterState copyWith({
    int? counter,
  }) {
    return onGenerateCounterState(
      counter: counter ?? this.counter,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'counter': counter,
    };
  }

  factory onGenerateCounterState.fromMap(Map<String, dynamic> map) {
    return onGenerateCounterState(
      counter: map['counter'] as int,
    );
  }

//</editor-fold>
}
