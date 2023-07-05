import '../../../core/core.dart';

class UsecaseException extends Failure {
  final String errorMessage;
  UsecaseException(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
