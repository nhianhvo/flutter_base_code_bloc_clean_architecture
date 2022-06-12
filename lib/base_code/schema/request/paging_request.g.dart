// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paging_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PagingRequest _$PagingRequestFromJson(Map<String, dynamic> json) =>
    PagingRequest(
      limit: json['limit'] as int? ?? 1000,
      page: json['page'] as int? ?? 0,
    );

Map<String, dynamic> _$PagingRequestToJson(PagingRequest instance) =>
    <String, dynamic>{
      'limit': instance.limit,
      'page': instance.page,
    };
