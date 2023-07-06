import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';

abstract class IAuthRepository {
  Future<Either<Failure, String>> getUserToken();
}
