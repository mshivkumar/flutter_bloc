part of 'theme_cubit.dart';

enum AppTheme { light, dark }

class ThemeState extends Equatable {
  final AppTheme appTheme;

  @override
  List<Object> get props => [appTheme];

//<editor-fold desc="Data Methods">

  const ThemeState({
    this.appTheme = AppTheme.light,
  });

  factory ThemeState.initial() {
    return const ThemeState(appTheme: AppTheme.light);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ThemeState &&
          runtimeType == other.runtimeType &&
          appTheme == other.appTheme);

  @override
  int get hashCode => appTheme.hashCode;

  @override
  String toString() {
    return 'ThemeState{ appTheme: $appTheme,}';
  }

  ThemeState copyWith({
    AppTheme? appTheme,
  }) {
    return ThemeState(
      appTheme: appTheme ?? this.appTheme,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'appTheme': appTheme,
    };
  }

  factory ThemeState.fromMap(Map<String, dynamic> map) {
    return ThemeState(
      appTheme: map['appTheme'] as AppTheme,
    );
  }

//</editor-fold>
}
