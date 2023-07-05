import 'package:dartz/dartz.dart';
import '../../../../core/core.dart';
import '../../entities/entities.dart';

abstract class ILoginUseCase {
  Future<Either<Failure, UserEntity>> call(String email, String password);
}
