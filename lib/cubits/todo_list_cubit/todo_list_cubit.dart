import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/todo_model.dart';

part 'todo_list_state.dart';

class TodoListCubit extends Cubit<TodoListState> {
  TodoListCubit() : super(TodoListState.initial());

  void addTodo({required String desc}) {
    final Todo todo = Todo(desc: desc);
    final List<Todo> newTodosList = [...state.todos, todo];
    emit(state.copyWith(todos: newTodosList));
  }

  void editTodo({required String id, required String desc}) {
    final List<Todo> newTodosList = state.todos.map((todo) {
      if (todo.id == id) {
        return Todo(id: todo.id, desc: desc, isCompleted: todo.isCompleted);
      }

      return todo;
    }).toList();

    emit(state.copyWith(todos: newTodosList));
  }

  void toggleIsCompleted({required String id, required bool isCompleted}) {
    final List<Todo> newTodosList = state.todos.map((todo) {
      if (todo.id == id) {
        return Todo(id: todo.id, desc: todo.desc, isCompleted: isCompleted);
      }

      return todo;
    }).toList();

    emit(state.copyWith(todos: newTodosList));
  }

  void deleteTodo({required String id}) {
    List<Todo> newTodosList =
        state.todos.where((todo) => todo.id != id).toList();
    // newTodosList.removeWhere((todo) => todo.id == id);

    emit(state.copyWith(todos: newTodosList));
  }
}
