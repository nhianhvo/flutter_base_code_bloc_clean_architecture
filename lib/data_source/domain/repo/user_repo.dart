import 'package:injectable/injectable.dart';
import '../../../base_code/repo_client/base_repo.dart';
import '../../../base_code/schema/response/api_response.dart';
import '../../../model/login_request.dart';
import '../../../model/login_response.dart';
import '../../api_client/api_client.dart';

abstract class IUserRepo extends BaseRepo {
  Future<APIResponse<LoginResponse>> login(LoginRequest? loginRequest);
  // IUserRepo(Object object);
}

@Singleton(as: IUserRepo)
class IUserRepoImpl extends BaseRepoImpl implements IUserRepo {
  final ApiClient _apiClient;

  IUserRepoImpl(this._apiClient);

  @override
  Future<APIResponse<LoginResponse>> login(LoginRequest? loginRequest) async {
    try {
      return await _apiClient.userService.login(loginRequest);
    } catch (e) {
      return APIResponse.fromException(e);
    }
  }
}
