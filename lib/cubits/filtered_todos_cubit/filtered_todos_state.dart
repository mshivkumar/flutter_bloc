part of 'filtered_todos_cubit.dart';

class FilteredTodosState extends Equatable {
  final List<Todo> filteredTodos;

//<editor-fold desc="Data Methods">

  const FilteredTodosState({
    required this.filteredTodos,
  });

  factory FilteredTodosState.initial() {
    return const FilteredTodosState(filteredTodos: []);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FilteredTodosState &&
          runtimeType == other.runtimeType &&
          filteredTodos == other.filteredTodos);

  @override
  int get hashCode => filteredTodos.hashCode;

  @override
  String toString() {
    return 'FilteredTodosState{ filteredTodos: $filteredTodos,}';
  }

  FilteredTodosState copyWith({
    List<Todo>? filteredTodos,
  }) {
    return FilteredTodosState(
      filteredTodos: filteredTodos ?? this.filteredTodos,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'filteredTodos': filteredTodos,
    };
  }

  factory FilteredTodosState.fromMap(Map<String, dynamic> map) {
    return FilteredTodosState(
      filteredTodos: map['filteredTodos'] as List<Todo>,
    );
  }

  @override
  List<Object> get props => [filteredTodos];

//</editor-fold>
}
