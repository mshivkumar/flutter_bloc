part of 'todo_list_bloc.dart';

abstract class TodoListEvent extends Equatable {
  const TodoListEvent();

  @override
  List<Object> get props => [];
}

class AddTodoEvent extends TodoListEvent {
  final String todoDesc;

  const AddTodoEvent({
    required this.todoDesc,
  });

  @override
  String toString() {
    return 'AddTodoEvent{todoDesc: $todoDesc}';
  }

  @override
  List<Object> get props => [todoDesc];
}

class EditTodoEvent extends TodoListEvent {
  final String id;
  final String todoDesc;

  const EditTodoEvent({
    required this.id,
    required this.todoDesc,
  });

  @override
  String toString() {
    return 'EditTodoEvent{id: $id, todoDesc: $todoDesc}';
  }

  @override
  List<Object> get props => [id, todoDesc];
}

class ToggleIsCompletedEvent extends TodoListEvent {
  final String id;
  final bool isCompleted;

  const ToggleIsCompletedEvent({
    required this.id,
    required this.isCompleted,
  });

  @override
  String toString() {
    return 'ToggleIsCompletedEvent{id: $id, isCompleted: $isCompleted}';
  }

  @override
  List<Object> get props => [id, isCompleted];
}

class DeleteTodoEvent extends TodoListEvent {
  final String id;

  const DeleteTodoEvent({
    required this.id,
  });

  @override
  String toString() {
    return 'DeleteTodoEvent{id: $id}';
  }

  @override
  List<Object> get props => [id];
}
