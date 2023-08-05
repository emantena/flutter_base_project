import 'package:base_project/core/model/enums/result_status.dart';
import 'package:base_project/domain/entities/dto/create_user_dto.dart';
import 'package:base_project/domain/entities/sign_up.dart';
import 'package:base_project/domain/entities/user.dart';
import 'package:base_project/domain/interfaces/data/i_sign_up_repository.dart';
import 'package:base_project/domain/interfaces/data/i_user_repository.dart';

import '../interfaces/services/i_sign_up_service.dart';

class SignUpService implements ISignUpService {
  final ISignUpRepository _signUpRepository;
  final IUserRepository _userRepository;

  SignUpService(this._signUpRepository, this._userRepository);

  @override
  Future<ResultStatus> createUserAsync(
      {required CreateUserDto createUserDto}) async {
    var signUp = SignUp(
      email: createUserDto.email,
      password: createUserDto.password,
      returnSecureToken: true,
    );

    final userAccount = await _signUpRepository.createUserAccountAsync(
      signUp: signUp,
    );

    if (userAccount.status == ResultStatus.error) {
      return userAccount.status;
    }

    final user = User(
      name: createUserDto.name,
      createAt: DateTime.now().toIso8601String(),
      email: createUserDto.email,
      photo: "",
    );

    final userCreated = await _userRepository.createUserAsync(
      user: user,
      localId: userAccount.value!.localId!,
    );

    return userCreated.status;
  }
}
