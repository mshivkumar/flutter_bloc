import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../todo_list_bloc/todo_list_bloc.dart';

part 'active_todo_count_event.dart';

part 'active_todo_count_state.dart';

class ActiveTodoCountBloc
    extends Bloc<ActiveTodoCountEvent, ActiveTodoCountState> {
  final int initialActiveTodosCount;

  ActiveTodoCountBloc({required this.initialActiveTodosCount})
      : super(ActiveTodoCountState(activeTodoCount: initialActiveTodosCount)) {
    on<TodoActiveCountEvent>(
        (TodoActiveCountEvent event, Emitter<ActiveTodoCountState> emit) {
      emit(state.copyWith(activeTodoCount: event.activeTodosCount));
    });
  }
}
