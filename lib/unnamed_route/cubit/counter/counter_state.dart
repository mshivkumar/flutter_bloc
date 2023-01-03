part of 'counter_cubit.dart';

class UnnamedCounterState extends Equatable {
  final int counter;

  @override
  List<Object> get props => [counter];

//<editor-fold desc="Data Methods">

  const UnnamedCounterState({
    required this.counter,
  });

  factory UnnamedCounterState.initial() {
    return const UnnamedCounterState(counter: 0);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UnnamedCounterState &&
          runtimeType == other.runtimeType &&
          counter == other.counter);

  @override
  int get hashCode => counter.hashCode;

  @override
  String toString() {
    return 'CounterState{ counter: $counter,}';
  }

  UnnamedCounterState copyWith({
    int? counter,
  }) {
    return UnnamedCounterState(
      counter: counter ?? this.counter,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'counter': counter,
    };
  }

  factory UnnamedCounterState.fromMap(Map<String, dynamic> map) {
    return UnnamedCounterState(
      counter: map['counter'] as int,
    );
  }

//</editor-fold>
}
