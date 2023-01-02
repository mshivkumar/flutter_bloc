part of 'theme_bloc.dart';

enum AppTheme {
  light,
  dark;

  String toJson() => name;

  static AppTheme fromJson(String json) => values.byName(json);
}

class ThemeState extends Equatable {
  final AppTheme appTheme;

  @override
  List<Object> get props => [appTheme];

//<editor-fold desc="Data Methods">

  const ThemeState({
    required this.appTheme,
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

  // Map<String, dynamic> toJson() {
  //   return {
  //     'appTheme': appTheme,
  //   };
  // }
  //
  // factory ThemeState.fromJson(Map<String, dynamic> json) {
  //   return ThemeState(
  //     appTheme: json['appTheme'] as AppTheme,
  //   );
  // }

  Map<String, dynamic> toJson() {
    final result = <String, dynamic>{};
    result.addAll({'appTheme': appTheme.toJson()});
    return result;
  }

  factory ThemeState.fromJson(Map<String, dynamic> json) {
    return ThemeState(
      appTheme: AppTheme.fromJson(json['appTheme']),
    );
  }

//</editor-fold>
}
