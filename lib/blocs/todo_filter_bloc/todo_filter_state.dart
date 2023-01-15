part of 'todo_filter_bloc.dart';

class TodoFilterState extends Equatable {
  final Filter filter;

  const TodoFilterState({
    required this.filter,
  });

  factory TodoFilterState.initial() {
    return const TodoFilterState(filter: Filter.all);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TodoFilterState &&
          runtimeType == other.runtimeType &&
          filter == other.filter);

  @override
  int get hashCode => filter.hashCode;

  @override
  String toString() {
    return 'TodoFilterState{ filter: $filter,}';
  }

  TodoFilterState copyWith({
    Filter? filter,
  }) {
    return TodoFilterState(
      filter: filter ?? this.filter,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'filter': filter,
    };
  }

  factory TodoFilterState.fromMap(Map<String, dynamic> map) {
    return TodoFilterState(
      filter: map['filter'] as Filter,
    );
  }

  @override
  List<Object> get props => [filter];
}
