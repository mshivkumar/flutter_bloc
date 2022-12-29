part of 'color_counter_cubit.dart';

class ColorCounterState extends Equatable {
  final int counter;

  @override
  List<Object> get props => [counter];

//<editor-fold desc="Data Methods">

  const ColorCounterState({
    required this.counter,
  });

  factory ColorCounterState.initial() {
    return const ColorCounterState(counter: 0);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ColorCounterState &&
          runtimeType == other.runtimeType &&
          counter == other.counter);

  @override
  int get hashCode => counter.hashCode;

  @override
  String toString() {
    return 'ColorCounterState{ counter: $counter,}';
  }

  ColorCounterState copyWith({
    int? counter,
  }) {
    return ColorCounterState(
      counter: counter ?? this.counter,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'counter': counter,
    };
  }

  factory ColorCounterState.fromMap(Map<String, dynamic> map) {
    return ColorCounterState(
      counter: map['counter'] as int,
    );
  }

//</editor-fold>
}
