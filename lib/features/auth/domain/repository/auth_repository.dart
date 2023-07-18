import '../../../../core/resources/data_state.dart';
import '../entities/user_entity.dart';

abstract class AuthRepository {
  const AuthRepository();

  Future<DataState<UserEntity>> login(String email, String password);
  Future<DataState<UserEntity>> register(String email, String password);
}
