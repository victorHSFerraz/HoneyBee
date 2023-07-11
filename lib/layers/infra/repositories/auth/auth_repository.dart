import 'package:dartz/dartz.dart';
import '../../infra.dart';
import '../../../../core/core.dart';
import '../../../domain/domain.dart';

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
