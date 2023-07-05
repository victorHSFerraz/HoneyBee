import '../../../core/core.dart';

class EntityException extends Failure {
  final String errorMessage;
  EntityException(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
