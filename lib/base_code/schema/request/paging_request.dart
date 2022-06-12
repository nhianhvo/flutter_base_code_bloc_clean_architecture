import 'package:json_annotation/json_annotation.dart';

part 'paging_request.g.dart';

@JsonSerializable()
class PagingRequest {
  int limit;
  int page;

  PagingRequest({
    this.limit = 1000,
    this.page = 0,
  });

  factory PagingRequest.fromJson(Map<String, dynamic> json) =>
      _$PagingRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PagingRequestToJson(this);
}
