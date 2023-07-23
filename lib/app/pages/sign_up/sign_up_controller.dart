import 'package:base_project/app/pages/base/base_controller.dart';
import 'package:base_project/core/model/enums/result_status.dart';
import 'package:base_project/domain/entities/dto/create_user_dto.dart';
import 'package:base_project/domain/interfaces/services/i_sign_up_service.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SignUpController extends BaseController {
  final _signUpService = Modular.get<ISignUpService>();

  Future<bool> createUser({
    required String name,
    required String email,
    required String password,
  }) async {
    update(isLoading: true);

    final createUserDto = CreateUserDto(
      email: email,
      name: name,
      password: password,
    );

    final result = await _signUpService.createUserAsync(
      createUserDto: createUserDto,
    );

    update(hasError: result == ResultStatus.error);

    return result == ResultStatus.success;
  }
}
