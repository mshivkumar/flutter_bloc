part of 'theme_bloc.dart';

enum AppTheme { light, dark }

class ThemeState extends Equatable {
  final AppTheme appTheme;
  final int counter;

  @override
  List<Object> get props => [appTheme, counter];

//<editor-fold desc="Data Methods">

  const ThemeState({
    required this.appTheme,
    required this.counter,
  });

  factory ThemeState.initial() {
    return const ThemeState(appTheme: AppTheme.light, counter: 0);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ThemeState &&
          runtimeType == other.runtimeType &&
          appTheme == other.appTheme &&
          counter == other.counter);

  @override
  int get hashCode => appTheme.hashCode ^ counter.hashCode;

  @override
  String toString() {
    return 'ThemeState{ appTheme: $appTheme, counter: $counter,}';
  }

  ThemeState copyWith({
    AppTheme? appTheme,
    int? counter,
  }) {
    return ThemeState(
      appTheme: appTheme ?? this.appTheme,
      counter: counter ?? this.counter,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'appTheme': appTheme,
      'counter': counter,
    };
  }

  factory ThemeState.fromMap(Map<String, dynamic> map) {
    return ThemeState(
      appTheme: map['appTheme'] as AppTheme,
      counter: map['counter'] as int,
    );
  }

//</editor-fold>
}
