import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../todo_list_cubit/todo_list_cubit.dart';

part 'active_todo_count_state.dart';

class ActiveTodoCountCubit extends Cubit<ActiveTodoCountState> {
  int initialActiveTodoCount;

  ActiveTodoCountCubit({
    required this.initialActiveTodoCount,
  }) : super(ActiveTodoCountState(activeTodoCount: initialActiveTodoCount));

  void calculateActiveTodoCount({required int activeTodoCount}) {
    emit(state.copyWith(activeTodoCount: activeTodoCount));
  }
}

// int currentActiveTodosCount = todoListState.todos
//     .where((todo) => !todo.isCompleted)
//     .toList()
//     .length;
// emit(state.copyWith(activeTodoCount: currentActiveTodosCount));
