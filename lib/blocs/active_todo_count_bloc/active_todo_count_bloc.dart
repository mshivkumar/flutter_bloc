import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../todo_list_bloc/todo_list_bloc.dart';

part 'active_todo_count_event.dart';

part 'active_todo_count_state.dart';

class ActiveTodoCountBloc
    extends Bloc<ActiveTodoCountEvent, ActiveTodoCountState> {
  final int initialActiveTodosCount;
  final TodoListBloc todoListBloc;

  late final StreamSubscription todoListSubscription;

  ActiveTodoCountBloc(
      {required this.todoListBloc, required this.initialActiveTodosCount})
      : super(ActiveTodoCountState(activeTodoCount: initialActiveTodosCount)) {
    todoListSubscription = todoListBloc.stream.listen((todoListState) {
      int activeTodosCount = todoListState.todos
          .where((todo) => !todo.isCompleted)
          .toList()
          .length;

      add(TodoActiveCountEvent(activeTodosCount: activeTodosCount));
    });

    on<TodoActiveCountEvent>(
        (TodoActiveCountEvent event, Emitter<ActiveTodoCountState> emit) {
      emit(state.copyWith(activeTodoCount: event.activeTodosCount));
    });
  }

  @override
  Future<void> close() {
    todoListSubscription.cancel();
    return super.close();
  }
}
