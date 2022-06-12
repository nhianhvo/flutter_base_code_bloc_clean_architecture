// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_paging_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiPagingResponse<T> _$ApiPagingResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    ApiPagingResponse<T>(
      items: (json['items'] as List<dynamic>?)?.map(fromJsonT).toList(),
      total: json['total'] as int? ?? 0,
    );

Map<String, dynamic> _$ApiPagingResponseToJson<T>(
  ApiPagingResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'items': instance.items?.map(toJsonT).toList(),
      'total': instance.total,
    };
