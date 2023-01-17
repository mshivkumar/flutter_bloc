import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/todo_model.dart';

part 'todo_list_event.dart';

part 'todo_list_state.dart';

class TodoListBloc extends Bloc<TodoListEvent, TodoListState> {
  TodoListBloc() : super(TodoListState.initial()) {
    on<AddTodoEvent>((AddTodoEvent event, Emitter<TodoListState> emit) {
      Todo newTodo = Todo(desc: event.todoDesc);
      List<Todo> newTodos = [...state.todos, newTodo];
      emit(state.copyWith(todos: newTodos));
    });

    on<EditTodoEvent>((EditTodoEvent event, Emitter<TodoListState> emit) {
      List<Todo> newTodosList = state.todos.map((todo) {
        if (todo.id == event.id) {
          return Todo(
              id: todo.id, desc: event.todoDesc, isCompleted: todo.isCompleted);
        }

        return todo;
      }).toList();

      emit(state.copyWith(todos: newTodosList));
    });

    on<ToggleIsCompletedEvent>(
        (ToggleIsCompletedEvent event, Emitter<TodoListState> emit) {
      List<Todo> newTodosList = state.todos.map((todo) {
        if (todo.id == event.id) {
          return Todo(
              id: todo.id, desc: todo.desc, isCompleted: event.isCompleted);
        }

        return todo;
      }).toList();

      emit(state.copyWith(todos: newTodosList));
    });

    on<DeleteTodoEvent>((DeleteTodoEvent event, Emitter<TodoListState> emit) {
      List<Todo> newTodoList =
          state.todos.where((todo) => todo.id != event.id).toList();

      emit(state.copyWith(todos: newTodoList));
    });
  }
}
