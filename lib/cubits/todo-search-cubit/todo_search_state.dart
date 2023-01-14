part of 'todo_search_cubit.dart';

class TodoSearchState extends Equatable {
  final String searchString;

//<editor-fold desc="Data Methods">

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

  Map<String, dynamic> toMap() {
    return {
      'searchString': searchString,
    };
  }

  factory TodoSearchState.fromMap(Map<String, dynamic> map) {
    return TodoSearchState(
      searchString: map['searchString'] as String,
    );
  }

  @override
  List<Object> get props => [searchString];

//</editor-fold>
}
