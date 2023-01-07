part of 'active_todo_count_cubit.dart';

class ActiveTodoCountState extends Equatable {
  final int activeTodoCount;

//<editor-fold desc="Data Methods">

  const ActiveTodoCountState({
    required this.activeTodoCount,
  });

  factory ActiveTodoCountState.initial() {
    return const ActiveTodoCountState(activeTodoCount: 0);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ActiveTodoCountState &&
          runtimeType == other.runtimeType &&
          activeTodoCount == other.activeTodoCount);

  @override
  int get hashCode => activeTodoCount.hashCode;

  @override
  String toString() {
    return 'ActiveTodoCountState{ activeTodoCount: $activeTodoCount,}';
  }

  ActiveTodoCountState copyWith({
    int? activeTodoCount,
  }) {
    return ActiveTodoCountState(
      activeTodoCount: activeTodoCount ?? this.activeTodoCount,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'activeTodoCount': activeTodoCount,
    };
  }

  factory ActiveTodoCountState.fromMap(Map<String, dynamic> map) {
    return ActiveTodoCountState(
      activeTodoCount: map['activeTodoCount'] as int,
    );
  }

  @override
  List<Object> get props => [activeTodoCount];
//</editor-fold>
}
