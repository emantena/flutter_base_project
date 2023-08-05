import 'package:base_project/app/pages/base/base_controller.dart';
import 'package:base_project/domain/interfaces/services/i_auth_service.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SignInController extends BaseController {
  final _authService = Modular.get<IAuthService>();

  Future<void> login({
    required String email,
    required String password,
  }) async {
    await _authService.signIn(email: email, password: password);
  }
}
