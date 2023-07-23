import 'package:base_project/core/error/failure.dart';
import 'package:base_project/core/model/result.dart';
import 'package:base_project/domain/entities/user.dart';

abstract class IUserRepository {
  Future<Result<User, Failure>> createUserAsync({
    required User user,
    required String localId,
  });

  Future<Result<String, Failure>> authenticateUser({
    required String email,
    required String password,
  });
}
