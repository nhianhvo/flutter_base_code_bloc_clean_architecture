import 'package:flutter_test_bloc/base_code/schema/response/api_response.dart';
import 'package:flutter_test_bloc/model/login_request.dart';
import 'package:flutter_test_bloc/model/login_response.dart';

import '../../../core/usecase.dart';
import '../../api_client/api_client.dart';

class UserUsecase implements UseCase {
  final ApiClient _apiClient;

  UserUsecase(this._apiClient);

  @override
  Future<APIResponse<LoginResponse>> login(LoginRequest loginRequest) {
    return _apiClient.userService.login(loginRequest);
  }
}
