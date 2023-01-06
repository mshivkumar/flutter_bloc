part of 'todo_search_cubit.dart';

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
    return 'TodoSearchState{ srearchTerm: $searchTerm,}';
  }

  TodoSearchState copyWith({
    String? srearchTerm,
  }) {
    return TodoSearchState(
      searchTerm: srearchTerm ?? this.searchTerm,
    );
  }

  @override
  List<Object> get props => [searchTerm];
}
