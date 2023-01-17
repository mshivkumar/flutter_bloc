part of 'todo_search_bloc.dart';

class TodoSearchState extends Equatable {
  final String searchTerm;

  const TodoSearchState({
    required this.searchTerm,
  });

  factory TodoSearchState.initial() {
    return const TodoSearchState(searchTerm: '');
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TodoSearchState &&
          runtimeType == other.runtimeType &&
          searchTerm == other.searchTerm);

  @override
  int get hashCode => searchTerm.hashCode;

  @override
  String toString() {
    return 'TodoSearchState{ searchTerm: $searchTerm,}';
  }

  TodoSearchState copyWith({
    String? searchTerm,
  }) {
    return TodoSearchState(
      searchTerm: searchTerm ?? this.searchTerm,
    );
  }

  @override
  List<Object> get props => [searchTerm];
}
