import 'package:base_project/core/error/failure.dart';
import 'package:base_project/core/firebase/firebase_config.dart';
import 'package:base_project/core/interfaces/i_api_service.dart';
import 'package:base_project/core/model/result.dart';
import 'package:base_project/domain/entities/user.dart';
import '../domain/interfaces/data/i_user_repository.dart';

class UserRepository implements IUserRepository {
  final IApiService _apiService;
  final document = "users";

  UserRepository(this._apiService);

  @override
  Future<Result<User, Failure>> createUserAsync({
    required User user,
    required String localId,
  }) async {
    var url = "${FirebaseConfig.databaseURL}/$document/$localId.json";

    try {
      final json = await _apiService.putAsync(
        body: user.toJson(),
        url: url,
      );

      return Result.success(User.fromJson(json));
    } on Failure catch (e) {
      return Result.failure(
        Failure.fromMessage(
          message: "falha ao cadastrar usuário",
        ),
      );
    }
  }

  @override
  Future<Result<String, Failure>> authenticateUser({
    required String email,
    required String password,
  }) {
    // TODO: implement authenticateUser
    throw UnimplementedError();
  }
}
