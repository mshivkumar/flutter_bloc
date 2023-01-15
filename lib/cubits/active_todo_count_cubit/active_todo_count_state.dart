part of 'active_todo_count_cubit.dart';

class ActiveTodoCountState extends Equatable {
  final int activeTodoCount;

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

  @override
  List<Object> get props => [activeTodoCount];
}
