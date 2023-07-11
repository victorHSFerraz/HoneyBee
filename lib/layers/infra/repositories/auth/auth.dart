import 'package:dartz/dartz.dart';
import 'package:honey_bee/core/core.dart';
import 'package:honey_bee/layers/domain/domain.dart';
import 'package:honey_bee/layers/infra/datasources/auth/auth_datasource.dart';

class AuthRepository implements IAuthRepository {
  final IAuthDatasource datasource;

  AuthRepository(this.datasource);

  @override
  Future<Either<Failure, TokenEntity>> getUserToken() async {
    try {
      final response = await datasource.getUserToken();
      return Right(response);
    } on ServerException {
      return Left(
        ServerFailure(),
      );
    }
  }
}
