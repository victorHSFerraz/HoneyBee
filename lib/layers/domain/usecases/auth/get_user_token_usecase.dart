import 'package:dartz/dartz.dart';
import '../../../../core/core.dart';
import '../../repositories/respositories.dart';

abstract class IGetUserTokenUseCase {
  Future<Either<Failure, String>> call();
}

class GetUserTokenUseCase implements IGetUserTokenUseCase {
  final IAuthRepository _repository;

  GetUserTokenUseCase(this._repository);

  @override
  Future<Either<Failure, String>> call() async {
    return await _repository.getUserToken();
  }
}
