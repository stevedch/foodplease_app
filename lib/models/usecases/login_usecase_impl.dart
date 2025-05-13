import '../../data/datasources/remote/user_remote_datasource.dart';
import 'login_usecase.dart';

class LoginUseCaseImpl implements LoginUseCase {
  final UserRemoteDataSource remoteDataSource;

  LoginUseCaseImpl(this.remoteDataSource);

  @override
  Future<String> login({required String email, required String password}) {
    return remoteDataSource.login(email: email, password: password);
  }
}
