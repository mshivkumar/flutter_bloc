part of 'theme_bloc.dart';

enum AppTheme {
  light,
  dark;

  String toJson() => name;

  static AppTheme fromJson(String json) => values.byName(json);
}

class HydratedThemeState extends Equatable {
  final AppTheme appTheme;

  @override
  List<Object> get props => [appTheme];

//<editor-fold desc="Data Methods">

  const HydratedThemeState({
    required this.appTheme,
  });

  factory HydratedThemeState.initial() {
    return const HydratedThemeState(appTheme: AppTheme.light);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HydratedThemeState &&
          runtimeType == other.runtimeType &&
          appTheme == other.appTheme);

  @override
  int get hashCode => appTheme.hashCode;

  @override
  String toString() {
    return 'ThemeState{ appTheme: $appTheme,}';
  }

  HydratedThemeState copyWith({
    AppTheme? appTheme,
  }) {
    return HydratedThemeState(
      appTheme: appTheme ?? this.appTheme,
    );
  }

  Map<String, dynamic> toJson() {
    final result = <String, dynamic>{};
    result.addAll({'appTheme': appTheme.toJson()});
    return result;
  }

  factory HydratedThemeState.fromJson(Map<String, dynamic> json) {
    return HydratedThemeState(
      appTheme: AppTheme.fromJson(json['appTheme']),
    );
  }

//</editor-fold>
}
