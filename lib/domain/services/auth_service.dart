import 'package:base_project/core/error/failure.dart';
import 'package:base_project/core/model/result.dart';
import 'package:base_project/domain/entities/dto/auth_user_response_dto.dart';
import 'package:base_project/domain/entities/dto/sign_in_dto.dart';
import 'package:base_project/domain/interfaces/data/i_user_repository.dart';
import '../interfaces/services/i_auth_service.dart';

class AuthService implements IAuthService {
  final IUserRepository _userRepository;

  AuthService(this._userRepository);

  @override
  Future<Result<AuthUserResponseDto, Failure>> signIn({
    required String email,
    required String password,
  }) async {
    final sign = SignInDto(
      email: email,
      password: password,
      returnSecureToken: true,
    );

    var result = await _userRepository.authenticateUser(signInDto: sign);

    return result;
  }
}
