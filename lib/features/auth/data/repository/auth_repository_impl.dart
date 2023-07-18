import '../../../../core/resources/data_state.dart';
import '../models/user_model.dart';
import '../../domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl();

  @override
  Future<DataState<UserModel>> login(String email, String password) {
    throw UnimplementedError();
  }

  @override
  Future<DataState<UserModel>> register(String email, String password) {
    throw UnimplementedError();
  }
}
