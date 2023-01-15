import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/todo_model.dart';
import '../todo_filter_cubit/todo_filter_cubit.dart';
import '../todo_list_cubit/todo_list_cubit.dart';
import '../todo_search_cubit/todo_search_cubit.dart';

part 'filtered_todos_state.dart';

class FilteredTodosCubit extends Cubit<FilteredTodosState> {
  List<Todo> initialTodosList;

  final TodoFilterCubit todoFilterCubit;
  final TodoSearchCubit todoSearchCubit;
  final TodoListCubit todoListCubit;

  late final StreamSubscription todoFilterSubscription;
  late final StreamSubscription todoSearchSubscription;
  late final StreamSubscription todoListSubscription;

  FilteredTodosCubit({
    required this.todoFilterCubit,
    required this.todoSearchCubit,
    required this.todoListCubit,
    required this.initialTodosList,
  }) : super(FilteredTodosState(todos: initialTodosList)) {
    todoFilterSubscription =
        todoFilterCubit.stream.listen((TodoFilterState todoFilterState) {});

    todoSearchSubscription =
        todoSearchCubit.stream.listen((TodoSearchState todoSearchState) {});

    todoListSubscription =
        todoListCubit.stream.listen((TodoListState todoListState) {});
  }

  void setFilteredTodos() {
    List<Todo> _filteredTodos = [];

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

    if (todoSearchCubit.state.searchString.isNotEmpty) {
      String searchedString = todoSearchCubit.state.searchString;
      _filteredTodos = todoListCubit.state.todos
          .where((todo) => todo.desc
              .trim()
              .toLowerCase()
              .contains(searchedString.trim().toLowerCase()))
          .toList();
    }

    emit(state.copyWith(todos: _filteredTodos));
  }

  @override
  Future<void> close() async {
    todoFilterSubscription.cancel();
    todoSearchSubscription.cancel();
    todoListSubscription.cancel();
    return super.close();
  }
}
