import 'package:base_project/core/error/failure.dart';
import 'package:base_project/core/model/result.dart';
import '../interfaces/services/i_auth_service.dart';

class AuthService implements IAuthService {
  @override
  Future<Result<bool, Failure>> signIn(
      {required String email, required String password}) {
    throw UnimplementedError();
  }
}
