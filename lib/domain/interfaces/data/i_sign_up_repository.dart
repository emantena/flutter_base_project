import 'package:base_project/core/error/failure.dart';
import 'package:base_project/core/model/result.dart';
import 'package:base_project/domain/entities/dto/sign_up_response_dto.dart';
import 'package:base_project/domain/entities/sign_up.dart';

abstract class ISignUpRepository {
  Future<Result<SignUpResponseDto, Failure>> createUserAccountAsync({
    required SignUp signUp,
  });
}
