part of 'todo_filter_bloc.dart';

abstract class TodoFilterEvent extends Equatable {
  const TodoFilterEvent();

  @override
  List<Object> get props => [];
}

class ChangeFilterEvent extends TodoFilterEvent {
  final Filter newFilter;

  const ChangeFilterEvent({
    required this.newFilter,
  });

  @override
  String toString() {
    return 'FilterTodoEvent{filter: $newFilter}';
  }

  @override
  List<Object> get props => [newFilter];
}
