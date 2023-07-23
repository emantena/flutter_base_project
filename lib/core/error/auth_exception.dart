import 'package:base_project/core/error/failure.dart';
import 'package:base_project/core/model/auth_error.dart';

class AuthException implements Exception {
  static Failure getFirebaseAuthErrorMessage({
    required Map<String, dynamic> errorMap,
  }) {
    final error = AuthError.fromJson(errorMap);

    var message = "Falha ao realizar autenticação";
    error.error?.errors?.forEach((error) {
      message = error.message!;
    });

    switch (message) {
      case 'EMAIL_EXISTS':
        return Failure.fromMessage(
          message: 'E-mail já cadastrado.',
        );
      case 'OPERATION_NOT_ALLOWED':
        return Failure.fromMessage(
          message: 'Operação não permitida!',
        );
      case 'TOO_MANY_ATTEMPTS_TRY_LATER':
        return Failure.fromMessage(
          message: 'Acesso bloqueado temporariamente. Tente mais tarde.',
        );
      case 'EMAIL_NOT_FOUND':
        return Failure.fromMessage(
          message: 'E-mail não encontrado.',
        );
      case 'INVALID_PASSWORD':
        return Failure.fromMessage(
          message: 'Senha informada não confere.',
        );
      case 'USER_DISABLED':
        return Failure.fromMessage(
          message: 'A conta do usuário foi desabilitada.',
        );
      case "WEAK_PASSWORD":
        return Failure.fromMessage(
          message: 'Senha dever conter 6 caracteres.',
        );
      default:
        return Failure.fromMessage(
          message: message,
        );
    }
  }
}
