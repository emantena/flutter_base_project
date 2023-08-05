import 'package:base_project/core/error/failure.dart';
import 'package:base_project/core/model/result.dart';
import 'package:base_project/domain/entities/dto/auth_user_response_dto.dart';

abstract class IAuthService {
  Future<Result<AuthUserResponseDto, Failure>> signIn({
    required String email,
    required String password,
  });
}
