import 'package:json_annotation/json_annotation.dart';

part 'api_paging_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ApiPagingResponse<T> {
  List<T>? items;
  int total;

  ApiPagingResponse({
    this.items,
    this.total = 0,
  });

  factory ApiPagingResponse.fromJson(
          dynamic json, T Function(Object? json) fromJsonT) =>
      _$ApiPagingResponseFromJson(json as Map<String, dynamic>, fromJsonT);
}
