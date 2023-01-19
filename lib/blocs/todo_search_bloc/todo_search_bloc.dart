import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';

part 'todo_search_event.dart';

part 'todo_search_state.dart';

class TodoSearchBloc extends Bloc<TodoSearchEvent, TodoSearchState> {
  TodoSearchBloc() : super(TodoSearchState.initial()) {
    on<SetSearchTermEvent>(
      (event, emit) {
        emit(state.copyWith(searchTerm: event.newSearchTerm));
      },
      transformer: debounce(const Duration(milliseconds: 500)),
    );
  }

  EventTransformer<SetSearchTermEvent> debounce<setSearchTermEvent>(
      Duration duration) {
    return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
  }
}
