part of 'color_cubit.dart';

class ColorState {
  final Color color;

//<editor-fold desc="Data Methods">

  const ColorState({
    this.color = Colors.red,
  });

  factory ColorState.initial() {
    return const ColorState(color: Colors.red);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ColorState &&
          runtimeType == other.runtimeType &&
          color == other.color);

  @override
  int get hashCode => color.hashCode;

  @override
  String toString() {
    return 'ColorState{ color: $color,}';
  }

  ColorState copyWith({
    Color? color,
  }) {
    return ColorState(
      color: color ?? this.color,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'color': color,
    };
  }

  factory ColorState.fromMap(Map<String, dynamic> map) {
    return ColorState(
      color: map['color'] as Color,
    );
  }

//</editor-fold>
}
