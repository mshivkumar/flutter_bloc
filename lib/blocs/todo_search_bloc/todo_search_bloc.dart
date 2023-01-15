import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'todo_search_event.dart';

part 'todo_search_state.dart';

class TodoSearchBloc extends Bloc<TodoSearchEvent, TodoSearchState> {
  TodoSearchBloc() : super(TodoSearchState.initial()) {
    on<TodoSearchEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
