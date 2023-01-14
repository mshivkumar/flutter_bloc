import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

enum Filter {
  all,
  active,
  completed
}

Uuid uuid = const Uuid();

class Todo {
  final String id;
  final String desc;
  final bool isCompleted;

  Todo({
    this.id,
    required this.desc,
    this.isCompleted = false,
  }) : id = id ?? uuid.v4();
}
