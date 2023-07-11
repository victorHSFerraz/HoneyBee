import 'package:dartz/dartz.dart';
import 'package:honey_bee/core/error/failure.dart';
import 'package:honey_bee/layers/domain/domain.dart';

class AuthRepository implements IAuthRepository {
  @override
  Future<Either<Failure, TokenEntity>> getUserToken() async {
    try {
      final token = TokenEntity(token: '1234567890', tokenExpirationAt: DateTime.now());
      return Right(token);
    } catch (error) {
      return Left(UsecaseException('Failed to fetch token'));
    }
  }
}
