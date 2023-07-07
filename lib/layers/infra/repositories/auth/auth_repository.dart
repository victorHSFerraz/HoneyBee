import 'package:dartz/dartz.dart';
import 'package:honey_bee/core/error/failure.dart';
import 'package:honey_bee/layers/domain/domain.dart';

class AuthRepository implements IAuthRepository {
  @override
  Future<Either<Failure, TokenEntity>> getUserToken() {
    // TODO: implement getUserToken
    throw UnimplementedError();
  }
}
