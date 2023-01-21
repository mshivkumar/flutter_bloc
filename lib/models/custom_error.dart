import 'package:equatable/equatable.dart';

class CustomError extends Equatable {
  final String errorMessage;

  const CustomError({
    required this.errorMessage,
  });

  @override
  String toString() {
    return 'CustomError{errorMessage: $errorMessage}';
  }

  @override
  List<Object> get props => [errorMessage];
}
