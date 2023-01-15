part of 'filtered_todos_cubit.dart';

class FilteredTodosState extends Equatable {
  final List<Todo> todos;

  const FilteredTodosState({
    required this.todos,
  });

  factory FilteredTodosState.initial() {
    return const FilteredTodosState(todos: []);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FilteredTodosState &&
          runtimeType == other.runtimeType &&
          todos == other.todos);

  @override
  int get hashCode => todos.hashCode;

  @override
  String toString() {
    return 'FilteredTodosState{ todos: $todos,}';
  }

  FilteredTodosState copyWith({
    List<Todo>? todos,
  }) {
    return FilteredTodosState(
      todos: todos ?? this.todos,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'todos': todos,
    };
  }

  factory FilteredTodosState.fromMap(Map<String, dynamic> map) {
    return FilteredTodosState(
      todos: map['todos'] as List<Todo>,
    );
  }

  @override
  List<Object> get props => [todos];
}
