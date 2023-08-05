import 'package:base_project/core/error/failure.dart';
import 'package:base_project/core/model/result.dart';
import 'package:base_project/domain/entities/dto/auth_user_response_dto.dart';
import 'package:base_project/domain/entities/dto/sign_in_dto.dart';
import 'package:base_project/domain/entities/user.dart';

abstract class IUserRepository {
  Future<Result<User, Failure>> createUserAsync({
    required User user,
    required String localId,
  });

  Future<Result<AuthUserResponseDto, Failure>> authenticateUser({
    required SignInDto signInDto,
  });
}
