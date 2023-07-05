import 'package:dartz/dartz.dart';
import '../../../../core/core.dart';

abstract class IGetUserTokenUseCase {
  Future<Either<Failure, String>> call();
}
