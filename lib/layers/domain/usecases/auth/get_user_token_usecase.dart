import 'package:dartz/dartz.dart';
import '../../domain.dart';
import '../../../../core/core.dart';

abstract class IGetUserTokenUseCase {
  Future<Either<Failure, TokenEntity>> call();
}

class GetUserTokenUseCase implements IGetUserTokenUseCase {
  final IAuthRepository _repository;

  GetUserTokenUseCase(this._repository);

  @override
  Future<Either<Failure, TokenEntity>> call() async {
    return await _repository.getUserToken();
  }
}
