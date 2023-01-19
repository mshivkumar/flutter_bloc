import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/todo_model.dart';
import '../todo_filter_cubit/todo_filter_cubit.dart';
import '../todo_list_cubit/todo_list_cubit.dart';
import '../todo_search_cubit/todo_search_cubit.dart';

part 'filtered_todos_state.dart';

class FilteredTodosCubit extends Cubit<FilteredTodosState> {
  final List<Todo> initialTodos;

  FilteredTodosCubit({required this.initialTodos})
      : super(FilteredTodosState(filteredTodos: initialTodos));

  void setFilteredTodos(
      {required Filter filter,
      required List<Todo> todos,
      required String searchTerm}) {
    List<Todo> _filteredTodos;

    switch (filter) {
      case Filter.active:
        _filteredTodos = todos.where((todo) => !todo.isCompleted).toList();
        break;
      case Filter.completed:
        _filteredTodos = todos.where((todo) => todo.isCompleted).toList();
        break;
      case Filter.all:
        _filteredTodos = todos;
        break;
    }

    if (searchTerm.isNotEmpty) {
      _filteredTodos = _filteredTodos
          .where((todo) =>
              todo.desc.toLowerCase().contains(searchTerm.toLowerCase()))
          .toList();
    }

    emit(state.copyWith(filteredTodos: _filteredTodos));
  }
}
