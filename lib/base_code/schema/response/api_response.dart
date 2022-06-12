import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../logger/app_logger.dart';
part 'api_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class APIResponse<T> {
  // From API
  T? data;

  int? statusCode;
  String? message;

  APIResponse({
    this.data,
    this.statusCode = 200,
    this.message = '',
  });

  bool get isSuccess => statusCode == 200;

  factory APIResponse.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$APIResponseFromJson(json, fromJsonT);

  factory APIResponse.fromException(ex) {
    AppLogger.e(ex);

    var errorCode = 500;

    if (ex is DioError) {
    } else if (ex is DioError) {
      AppLogger.e(ex.message);

      switch (ex.type) {
        case DioErrorType.connectTimeout:
        case DioErrorType.sendTimeout:
        case DioErrorType.receiveTimeout:
          errorCode = 408;
          break;
        case DioErrorType.response:
          errorCode = ex.response?.statusCode ?? 500;
          break;
        case DioErrorType.cancel:
          errorCode = 499;
          break;
        case DioErrorType.other:
          errorCode = 500;

          break;
      }
    }

    String errorDescription = "";
    if (ex is DioError) {
      DioError dioError = ex;
      switch (dioError.type) {
        case DioErrorType.cancel:
          errorDescription = "Request to API server was cancelled";
          break;
        case DioErrorType.connectTimeout:
          errorDescription = "Connection timeout with API server";
          break;
        case DioErrorType.other:
          errorDescription =
              "Connection to API server failed due to internet connection";
          break;
        case DioErrorType.receiveTimeout:
          errorDescription = "Receive timeout in connection with API server";
          break;
        case DioErrorType.response:
          errorDescription =
              "Received invalid status code: ${dioError.response!.statusCode}";
          break;
        case DioErrorType.sendTimeout:
          errorDescription = "Send timeout in connection with API server";
          break;
      }
    } else {
      errorDescription = "Unexpected error occured";
    }

    return APIResponse(statusCode: errorCode, message: errorDescription);
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
}
