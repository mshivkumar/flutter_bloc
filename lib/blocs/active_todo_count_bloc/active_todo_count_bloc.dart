import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../todo_list_bloc/todo_list_bloc.dart';

part 'active_todo_count_event.dart';

part 'active_todo_count_state.dart';

class ActiveTodoCountBloc
    extends Bloc<ActiveTodoCountEvent, ActiveTodoCountState> {
  final TodoListBloc todoListBloc;

  late final StreamSubscription todoListSubscription;

  ActiveTodoCountBloc({required this.todoListBloc})
      : super(ActiveTodoCountState.initial()) {
    on<TodoActiveCountEvent>(
        (TodoActiveCountEvent event, Emitter<ActiveTodoCountState> emit) {
      todoListSubscription = todoListBloc.stream.listen((todoListState) {
        int activeTodosCount = todoListState.todos
            .where((todo) => !todo.isCompleted)
            .toList()
            .length;

        emit(state.copyWith(activeTodoCount: activeTodosCount));
      });
    });
  }

  @override
  Future<void> close() {
    todoListSubscription.cancel();
    return super.close();
  }
}
