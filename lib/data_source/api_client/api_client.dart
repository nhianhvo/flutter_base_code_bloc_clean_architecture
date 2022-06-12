import 'dart:io';
import 'package:dio/dio.dart';
import '../../base_code/local/shared_preferences_repo.dart';
import '../../base_code/logger/app_logger.dart';
import '../../base_code/repo_client/base_api_client.dart';
import '../domain/remote_service/remote_user_service.dart';
import 'package:injectable/injectable.dart';

@singleton
class ApiClient extends BaseApiClient {
  final SharedPreferencesRepo _sharedPreferencesRepo;

  late Dio dio;

  late UserService userService;

  ApiClient(this._sharedPreferencesRepo) {
    AppLogger.d('Init dio api client');

    dio = getDio(
      endpoint: ApiEndpoint.END_POINT,
    );

    // taskService = TaskService(dio);
    userService = UserService(dio);
  }

  @override
  Map<String, dynamic>? getHeaders() {
    var headers = {
      'Platform': Platform.isIOS ? 'iOS' : 'Android',
      'App-Version': '1.0.0'
    };
    var token = _sharedPreferencesRepo.getToken();
    if (token?.isNotEmpty == true) {
      headers.addAll({
        'Authorization': 'Bearer ${_sharedPreferencesRepo.getToken()}',
      });
    }

    return headers;
  }

  @override
  void onTokenExpired() {}
}

class ApiEndpoint {
  static const String END_POINT = 'http://54.179.111.20:3000';
  static const String API_PREFIX = '';
}
