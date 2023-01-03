part of 'hydrated_counter_bloc.dart';

class HydratedCounterState extends Equatable {
  final int counter;

  @override
  List<Object> get props => [counter];

//<editor-fold desc="Data Methods">

  const HydratedCounterState({
    required this.counter,
  });

  factory HydratedCounterState.initial() {
    return const HydratedCounterState(counter: 0);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HydratedCounterState &&
          runtimeType == other.runtimeType &&
          counter == other.counter);

  @override
  int get hashCode => counter.hashCode;

  @override
  String toString() {
    return 'HydratedCounterState{ counter: $counter,}';
  }

  HydratedCounterState copyWith({
    int? counter,
  }) {
    return HydratedCounterState(
      counter: counter ?? this.counter,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'counter': counter,
    };
  }

  factory HydratedCounterState.fromJson(Map<String, dynamic> json) {
    return HydratedCounterState(
      counter: json['counter'] as int,
    );
  }

//</editor-fold>
}
