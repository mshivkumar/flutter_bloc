part of 'todo_filter_bloc.dart';

abstract class TodoFilterEvent extends Equatable {
  const TodoFilterEvent();

  @override
  List<Object> get props => [];
}

class FilterTodoEvent extends TodoFilterEvent {
  final Filter filter;

  const FilterTodoEvent({
    required this.filter,
  });

  @override
  String toString() {
    return 'FilterTodoEvent{filter: $filter}';
  }

  @override
  List<Object> get props => [filter];
}
