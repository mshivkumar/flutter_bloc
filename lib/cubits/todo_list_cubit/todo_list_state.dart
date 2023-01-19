part of 'todo_list_cubit.dart';

class TodoListState extends Equatable {
  final List<Todo> todos;

  @override
  List<Object> get props => [todos];

//<editor-fold desc="Data Methods">

  const TodoListState({
    required this.todos,
  });

  factory TodoListState.initial() {
    return const TodoListState(
      todos: [
      ],
    );
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

  Map<String, dynamic> toMap() {
    return {
      'todos': todos,
    };
  }

  factory TodoListState.fromMap(Map<String, dynamic> map) {
    return TodoListState(
      todos: map['todos'] as List<Todo>,
    );
  }

//</editor-fold>
}
