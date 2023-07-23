import 'package:base_project/core/model/enums/result_status.dart';
import 'package:base_project/domain/entities/dto/create_user_dto.dart';

abstract class ISignUpService {
  Future<ResultStatus> createUserAsync({required CreateUserDto createUserDto});
}
