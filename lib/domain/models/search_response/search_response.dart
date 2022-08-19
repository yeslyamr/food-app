// ignore_for_file: depend_on_referenced_packages

import 'recipe_info.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_response.g.dart';

@JsonSerializable(explicitToJson: true)
class SearchResponse {
  List<RecipeInfo>? results;
  int? offset;
  int? number;
  int? totalResults;

  SearchResponse({
    this.results,
    this.offset,
    this.number,
    this.totalResults,
  });

  factory SearchResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SearchResponseToJson(this);
}
