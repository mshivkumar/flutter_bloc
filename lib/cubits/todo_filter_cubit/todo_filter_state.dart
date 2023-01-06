part of 'todo_filter_cubit.dart';

class TodoFilterState extends Equatable {
  final Filter filter;

//<editor-fold desc="Data Methods">

  const TodoFilterState({
    required this.filter,
  });

  factory TodoFilterState.initial() {
    return const TodoFilterState(filter: Filter.all);
  }

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

  @override
  List<Object> get props => [filter];

//</editor-fold>
}
