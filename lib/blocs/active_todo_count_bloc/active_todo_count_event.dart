part of 'active_todo_count_bloc.dart';

abstract class ActiveTodoCountEvent extends Equatable {
  const ActiveTodoCountEvent();

  @override
  List<Object> get props => [];
}

class TodoActiveCountEvent extends ActiveTodoCountEvent {
  final int activeTodosCount;

  const TodoActiveCountEvent({
    required this.activeTodosCount,
  });

  @override
  String toString() {
    return 'TodoActiveCountEvent{activeTodosCount: $activeTodosCount}';
  }

  @override
  List<Object> get props => [activeTodosCount];
}
