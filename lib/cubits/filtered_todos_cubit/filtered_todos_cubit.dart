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
  final TodoFilterCubit todoFilterCubit;
  final TodoSearchCubit todoSearchCubit;
  final TodoListCubit todoListCubit;

  late final StreamSubscription todoFilterStreamSubscription;
  late final StreamSubscription todoSearchStreamSubscription;
  late final StreamSubscription todoListStreamSubscription;

  FilteredTodosCubit(
      {required this.initialTodos,
      required this.todoFilterCubit,
      required this.todoSearchCubit,
      required this.todoListCubit})
      : super(FilteredTodosState(filteredTodos: initialTodos)) {
    todoFilterStreamSubscription =
        todoFilterCubit.stream.listen((TodoFilterState todoFilterState) {
      setFilteredTodos();
    });

    todoSearchStreamSubscription =
        todoSearchCubit.stream.listen((TodoSearchState todoSearchState) {
      setFilteredTodos();
    });

    todoListStreamSubscription =
        todoListCubit.stream.listen((TodoListState todoListState) {
      setFilteredTodos();
    });
  }

  void setFilteredTodos() {
    List<Todo> _filteredTodos;

    switch (todoFilterCubit.state.filter) {
      case Filter.active:
        _filteredTodos = todoListCubit.state.todos
            .where((todo) => !todo.isCompleted)
            .toList();
        break;
      case Filter.completed:
        _filteredTodos = todoListCubit.state.todos
            .where((todo) => todo.isCompleted)
            .toList();
        break;
      case Filter.all:
        _filteredTodos = todoListCubit.state.todos;
        break;
    }

    if (todoSearchCubit.state.searchTerm.isNotEmpty) {
      _filteredTodos = _filteredTodos
          .where((todo) => todo.desc
              .toLowerCase()
              .contains(todoSearchCubit.state.searchTerm.toLowerCase()))
          .toList();
    }

    emit(state.copyWith(filteredTodos: _filteredTodos));
  }

  @override
  Future<void> close() {
    todoFilterStreamSubscription.cancel();
    todoSearchStreamSubscription.cancel();
    todoListStreamSubscription.cancel();
    return super.close();
  }
}
