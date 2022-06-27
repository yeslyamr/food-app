// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchResponse _$SearchResponseFromJson(Map<String, dynamic> json) =>
    SearchResponse(
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => RecipeInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      offset: json['offset'] as int?,
      number: json['number'] as int?,
      totalResults: json['totalResults'] as int?,
    );

Map<String, dynamic> _$SearchResponseToJson(SearchResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
      'offset': instance.offset,
      'number': instance.number,
      'totalResults': instance.totalResults,
    };
