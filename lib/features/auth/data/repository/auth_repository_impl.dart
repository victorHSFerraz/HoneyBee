import '../../../../core/resources/data_state.dart';
import '../models/user.dart';
import '../../domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<DataState<UserModel>> login(String email, String password) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<DataState<UserModel>> register(String email, String password) {
    // TODO: implement register
    throw UnimplementedError();
  }
}
