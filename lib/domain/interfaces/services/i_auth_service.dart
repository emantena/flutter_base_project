import 'package:base_project/core/error/failure.dart';
import 'package:base_project/core/model/result.dart';

abstract class IAuthService {
  Future<Result<bool, Failure>> signIn({
    required String email,
    required String password,
  });
}
