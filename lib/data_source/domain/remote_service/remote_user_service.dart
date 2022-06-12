import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import '../../../base_code/schema/response/api_paging_response.dart';
import '../../../base_code/schema/response/api_response.dart';
import '../../../model/login_request.dart';
import '../../../model/login_response.dart';
import '../../../model/task.dart';
import '../../api_client/api_client.dart';

part 'remote_user_service.g.dart';

@RestApi()
abstract class UserService {
  factory UserService(Dio dio, {String baseUrl}) = _UserService;

  static const url = ApiEndpoint.API_PREFIX;

  @GET(url)
  Future<APIResponse<ApiPagingResponse<Task>>> getMyTasks(
    @Queries() Map<String, dynamic> paging,
  );

  @POST('$url/users/login')
  Future<APIResponse<LoginResponse>> login(@Body() LoginRequest? loginRequest);
}

// String _handleError(Object error) {
//   String errorDescription = "";
//   if (error is DioError) {
//     DioError dioError = error;
//     switch (dioError.type) {
//       case DioErrorType.cancel:
//         errorDescription = "Request to API server was cancelled";
//         break;
//       case DioErrorType.connectTimeout:
//         errorDescription = "Connection timeout with API server";
//         break;
//       case DioErrorType.other:
//         errorDescription =
//             "Connection to API server failed due to internet connection";
//         break;
//       case DioErrorType.receiveTimeout:
//         errorDescription = "Receive timeout in connection with API server";
//         break;
//       case DioErrorType.response:
//         errorDescription =
//             "Received invalid status code: ${dioError.response!.statusCode}";
//         break;
//       case DioErrorType.sendTimeout:
//         errorDescription = "Send timeout in connection with API server";
//         break;
//     }
//   } else {
//     errorDescription = "Unexpected error occured";
//   }
//   return errorDescription;
// }
