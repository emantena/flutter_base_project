import 'package:base_project/core/error/auth_exception.dart';
import 'package:base_project/core/error/failure.dart';
import 'package:base_project/core/firebase/firebase_config.dart';
import 'package:base_project/core/interfaces/i_api_service.dart';
import 'package:base_project/core/model/result.dart';
import 'package:base_project/domain/entities/dto/sign_up_response_dto.dart';
import 'package:base_project/domain/entities/sign_up.dart';

import '../domain/interfaces/data/i_sign_up_repository.dart';

class SignUpRepository implements ISignUpRepository {
  final IApiService _apiService;

  SignUpRepository(this._apiService);
  @override
  Future<Result<SignUpResponseDto, Failure>> createUserAccountAsync(
      {required SignUp signUp}) async {
    String url =
        '${FirebaseConfig.authApiUrl}/v1/accounts:signUp?key=${FirebaseConfig.apiKey}';

    try {
      final json = await _apiService.postAsync(
        body: signUp.toJson(),
        url: url,
      );

      return Result.success(SignUpResponseDto.fromJson(json));
    } on Failure catch (e) {
      return Result.failure(
        AuthException.getFirebaseAuthErrorMessage(errorMap: e.error),
      );
    }
  }
}
