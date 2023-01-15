part of 'todo_search_bloc.dart';

class TodoSearchState extends Equatable {
  final String searchString;

  const TodoSearchState({
    required this.searchString,
  });

  factory TodoSearchState.initial() {
    return const TodoSearchState(searchString: '');
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TodoSearchState &&
          runtimeType == other.runtimeType &&
          searchString == other.searchString);

  @override
  int get hashCode => searchString.hashCode;

  @override
  String toString() {
    return 'TodoSearchState{ searchString: $searchString,}';
  }

  TodoSearchState copyWith({
    String? searchString,
  }) {
    return TodoSearchState(
      searchString: searchString ?? this.searchString,
    );
  }

  @override
  List<Object> get props => [searchString];
}
