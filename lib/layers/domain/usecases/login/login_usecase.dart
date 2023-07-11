import 'package:dartz/dartz.dart';
import '../../../../core/core.dart';
import '../../../domain/domain.dart';

abstract class ILoginUseCase {
  Future<Either<Failure, UserEntity>> call(String email, String password);
}
