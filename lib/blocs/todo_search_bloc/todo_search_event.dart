part of 'todo_search_bloc.dart';

abstract class TodoSearchEvent extends Equatable {
  const TodoSearchEvent();

  @override
  List<Object> get props => [];
}

class SearchTodoEvent extends TodoSearchEvent {
  final String searchedString;

  const SearchTodoEvent({
    required this.searchedString,
  });

  @override
  String toString() {
    return 'SearchTodoEvent{searchedString: $searchedString}';
  }

  @override
  List<Object> get props => [searchedString];
}
