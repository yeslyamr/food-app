// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';

import 'package:recipe_app/domain/models/search_response/analyzed_instructions.dart';
import 'package:recipe_app/domain/models/search_response/ingredient.dart';

import 'extended_ingredient.dart';

part 'recipe_info.g.dart';

@JsonSerializable()
class RecipeInfo {
  bool? vegetarian;
  bool? vegan;
  bool? glutenFree;
  bool? dairyFree;
  bool? veryHealthy;
  bool? cheap;
  bool? veryPopular;
  bool? sustainable;
  bool? lowFodmap;
  int? weightWatcherSmartPoints;
  String? gaps;
  int? preparationMinutes;
  int? cookingMinutes;
  int? aggregateLikes;
  int? healthScore;
  String? creditsText;
  String? license;
  String? sourceName;
  double? pricePerServing;
  int? id;
  String? title;
  String? image;
  String? imageType;
  int? readyInMinutes;
  int? servings;
  String? sourceUrl;
  int? openLicense;
  String? summary;
  String? spoonacularSourceUrl;
  int? usedIngredientCount;
  int? missedIngredientCount;
  int? likes;

  List<String>? cuisines;
  List<String>? dishTypes;
  List<String>? diets;
  List<String>? occasions;

  List<Ingredient>? missedIngredients;
  List<Ingredient>? usedIngredients;
  List<Ingredient>? unusedIngredients;
  List<ExtendedIngredient>? extendedIngredients;

  List<AnalyzedInstruction>? analyzedInstructions;
  RecipeInfo({
    this.vegetarian,
    this.vegan,
    this.glutenFree,
    this.dairyFree,
    this.veryHealthy,
    this.cheap,
    this.veryPopular,
    this.sustainable,
    this.lowFodmap,
    this.weightWatcherSmartPoints,
    this.gaps,
    this.preparationMinutes,
    this.cookingMinutes,
    this.aggregateLikes,
    this.healthScore,
    this.creditsText,
    this.license,
    this.sourceName,
    this.pricePerServing,
    this.id,
    this.title,
    this.image,
    this.imageType,
    this.readyInMinutes,
    this.servings,
    this.sourceUrl,
    this.openLicense,
    this.summary,
    this.spoonacularSourceUrl,
    this.usedIngredientCount,
    this.missedIngredientCount,
    this.likes,
    this.cuisines,
    this.dishTypes,
    this.diets,
    this.occasions,
    this.missedIngredients,
    this.usedIngredients,
    this.unusedIngredients,
    this.extendedIngredients,
    this.analyzedInstructions,
  });
  

  factory RecipeInfo.fromJson(Map<String, dynamic> json) =>
      _$RecipeInfoFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeInfoToJson(this);
}
