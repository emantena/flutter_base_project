import 'package:base_project/app/pages/sign_in/sign_in_page.dart';
import 'package:base_project/app/pages/sign_up/sign_up_page.dart';
import 'package:base_project/app/pages/splash_page.dart';
import 'package:base_project/core/interfaces/i_api_service.dart';
import 'package:base_project/core/services/api_service.dart';
import 'package:base_project/data/sign_up_repository.dart';
import 'package:base_project/data/user_repository.dart';
import 'package:base_project/domain/interfaces/data/i_sign_up_repository.dart';
import 'package:base_project/domain/interfaces/data/i_user_repository.dart';
import 'package:base_project/domain/interfaces/services/i_auth_service.dart';
import 'package:base_project/domain/interfaces/services/i_sign_up_service.dart';
import 'package:base_project/domain/services/auth_service.dart';
import 'package:base_project/domain/services/sign_up_service.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => const [];

  @override
  List<Bind> get binds => [
        //Services
        Bind.factory<IApiService>((i) => ApiService()),
        Bind.factory<ISignUpService>((i) => SignUpService(i(), i())),
        Bind.factory<IAuthService>((i) => AuthService()),
        //Repository
        Bind.factory<ISignUpRepository>((i) => SignUpRepository(i())),
        Bind.factory<IUserRepository>((i) => UserRepository(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const SplashPage()),
        ChildRoute('/sign-in', child: (context, args) => const SignInPage()),
        ChildRoute('/sign-up', child: (context, args) => const SignUpPage()),
      ];
}
