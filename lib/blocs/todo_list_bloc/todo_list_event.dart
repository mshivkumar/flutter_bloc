part of 'todo_list_bloc.dart';

abstract class TodoListEvent extends Equatable {
  const TodoListEvent();

  @override
  List<Object> get props => [];
}

class AddTodoEvent extends TodoListEvent {
  final String newDesc;

  const AddTodoEvent({
    required this.newDesc,
  });

  @override
  String toString() {
    return 'AddTodoEvent{desc: $newDesc}';
  }

  @override
  List<Object> get props => [newDesc];
}

class EditTodoEvent extends TodoListEvent {
  final String id;
  final String newDesc;

  const EditTodoEvent({
    required this.id,
    required this.newDesc,
  });

  @override
  String toString() {
    return 'EditTodoEvent{id: $id, newDesc: $newDesc}';
  }

  @override
  List<Object> get props => [id, newDesc];
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
