part of 'todo_list_bloc.dart';

class TodoListState extends Equatable {
  final List<Todo> todos;

  const TodoListState({
    required this.todos,
  });

  factory TodoListState.initial() {
    return TodoListState(todos: [
      Todo(id: '0', desc: 'Hello new Todo', isCompleted: false),
      Todo(id: '1', desc: 'Hello old Todo', isCompleted: false),
      Todo(id: '2', desc: 'Hello practical Todo', isCompleted: false),
    ]);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TodoListState &&
          runtimeType == other.runtimeType &&
          todos == other.todos);

  @override
  int get hashCode => todos.hashCode;

  @override
  String toString() {
    return 'TodoListState{ todos: $todos,}';
  }

  TodoListState copyWith({
    List<Todo>? todos,
  }) {
    return TodoListState(
      todos: todos ?? this.todos,
    );
  }

  @override
  List<Object> get props => [todos];
}
