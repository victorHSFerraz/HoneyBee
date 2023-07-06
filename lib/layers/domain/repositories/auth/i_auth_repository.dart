import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';
import '../../domain.dart';

abstract class IAuthRepository {
  Future<Either<Failure, TokenEntity>> getUserToken();
}
