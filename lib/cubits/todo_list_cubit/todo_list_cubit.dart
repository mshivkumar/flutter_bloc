import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/todo_model.dart';

part 'todo_list_state.dart';

class TodoListCubit extends Cubit<TodoListState> {
  TodoListCubit() : super(TodoListState.initial());

  void addTodo({required String newDesc}) {
    final Todo newTodo = Todo(desc: newDesc);
    final List<Todo> newTodos = [...state.todos, newTodo];
    emit(state.copyWith(todos: newTodos));
  }

  void editTodo({required String id, required String newDesc}) {
    final List<Todo> newTodosList = state.todos.map((todo) {
      if (todo.id == id) {
        return Todo(id: todo.id, desc: newDesc, isCompleted: todo.isCompleted);
      }

      return todo;
    }).toList();

    emit(state.copyWith(todos: newTodosList));
  }

  void toggleStatus({required String id, required bool isCompleted}) {
    final List<Todo> newTodoList = state.todos.map((todo) {
      if (todo.id == id) {
        return Todo(id: todo.id, desc: todo.desc, isCompleted: isCompleted);
      }

      return todo;
    }).toList();
  }

  void deleteTodo({required String id}) {
    List<Todo> newTodosList =
        state.todos.where((todo) => todo.id != id).toList();
    // newTodosList.removeWhere((todo) => todo.id == id);

    emit(state.copyWith(todos: newTodosList));
  }
}
