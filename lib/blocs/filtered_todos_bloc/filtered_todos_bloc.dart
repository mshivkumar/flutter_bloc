import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/todo_model.dart';
import '../todo_filter_bloc/todo_filter_bloc.dart';
import '../todo_list_bloc/todo_list_bloc.dart';
import '../todo_search_bloc/todo_search_bloc.dart';

part 'filtered_todos_event.dart';

part 'filtered_todos_state.dart';

class FilteredTodosBloc extends Bloc<FilteredTodosEvent, FilteredTodosState> {
  final List<Todo> initialTodosList;

  final TodoFilterBloc todoFilterBloc;
  final TodoSearchBloc todoSearchBloc;
  final TodoListBloc todoListBloc;

  late final StreamSubscription todoFilterSubscription;
  late final StreamSubscription todoSearchSubscription;
  late final StreamSubscription todoListSubscription;

  FilteredTodosBloc({
    required this.todoFilterBloc,
    required this.todoSearchBloc,
    required this.todoListBloc,
    required this.initialTodosList,
  }) : super(FilteredTodosState(todos: initialTodosList)) {
    todoFilterSubscription =
        todoFilterBloc.stream.listen((TodoFilterState todoFilterState) {
      _setFilteredTodos();
    });

    todoSearchSubscription =
        todoSearchBloc.stream.listen((TodoSearchState todoSearchState) {
      _setFilteredTodos();
    });

    todoListSubscription =
        todoListBloc.stream.listen((TodoListState todoListState) {
      _setFilteredTodos();
    });

    on<SetFilteredTodosEvent>((event, emit) {
      emit(state.copyWith(todos: event.filteredTodos));
    });
  }

  void _setFilteredTodos() {
    List<Todo> _filteredTodos;

    switch (todoFilterBloc.state.filter) {
      case Filter.active:
        _filteredTodos = todoListBloc.state.todos
            .where((todo) => !todo.isCompleted)
            .toList();
        break;
      case Filter.completed:
        _filteredTodos =
            todoListBloc.state.todos.where((todo) => todo.isCompleted).toList();
        break;
      case Filter.all:
        _filteredTodos = todoListBloc.state.todos;
    }

    if (todoSearchBloc.state.searchTerm.isNotEmpty) {
      final String searchedString = todoSearchBloc.state.searchTerm;
      _filteredTodos = todoListBloc.state.todos
          .where((todo) => todo.desc
              .trim()
              .toLowerCase()
              .contains(searchedString.trim().toLowerCase()))
          .toList();
    }

    add(SetFilteredTodosEvent(filteredTodos: _filteredTodos));
  }

  @override
  Future<void> close() {
    todoFilterSubscription.cancel();
    todoSearchSubscription.cancel();
    todoListSubscription.cancel();
    return super.close();
  }
}
