// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipeInfo _$RecipeInfoFromJson(Map<String, dynamic> json) => RecipeInfo(
      vegetarian: json['vegetarian'] as bool?,
      vegan: json['vegan'] as bool?,
      glutenFree: json['glutenFree'] as bool?,
      dairyFree: json['dairyFree'] as bool?,
      veryHealthy: json['veryHealthy'] as bool?,
      cheap: json['cheap'] as bool?,
      veryPopular: json['veryPopular'] as bool?,
      sustainable: json['sustainable'] as bool?,
      lowFodmap: json['lowFodmap'] as bool?,
      weightWatcherSmartPoints: json['weightWatcherSmartPoints'] as int?,
      gaps: json['gaps'] as String?,
      preparationMinutes: json['preparationMinutes'] as int?,
      cookingMinutes: json['cookingMinutes'] as int?,
      aggregateLikes: json['aggregateLikes'] as int?,
      healthScore: json['healthScore'] as int?,
      creditsText: json['creditsText'] as String?,
      license: json['license'] as String?,
      sourceName: json['sourceName'] as String?,
      pricePerServing: (json['pricePerServing'] as num?)?.toDouble(),
      id: json['id'] as int?,
      title: json['title'] as String?,
      image: json['image'] as String?,
      imageType: json['imageType'] as String?,
      readyInMinutes: json['readyInMinutes'] as int?,
      servings: json['servings'] as int?,
      sourceUrl: json['sourceUrl'] as String?,
      openLicense: json['openLicense'] as int?,
      summary: json['summary'] as String?,
      spoonacularSourceUrl: json['spoonacularSourceUrl'] as String?,
      usedIngredientCount: json['usedIngredientCount'] as int?,
      missedIngredientCount: json['missedIngredientCount'] as int?,
      likes: json['likes'] as int?,
      cuisines: (json['cuisines'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      dishTypes: (json['dishTypes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      diets:
          (json['diets'] as List<dynamic>?)?.map((e) => e as String).toList(),
      occasions: (json['occasions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      missedIngredients: (json['missedIngredients'] as List<dynamic>?)
          ?.map((e) => Ingredient.fromJson(e as Map<String, dynamic>))
          .toList(),
      usedIngredients: (json['usedIngredients'] as List<dynamic>?)
          ?.map((e) => Ingredient.fromJson(e as Map<String, dynamic>))
          .toList(),
      unusedIngredients: (json['unusedIngredients'] as List<dynamic>?)
          ?.map((e) => Ingredient.fromJson(e as Map<String, dynamic>))
          .toList(),
      extendedIngredients: (json['extendedIngredients'] as List<dynamic>?)
          ?.map((e) => ExtendedIngredient.fromJson(e as Map<String, dynamic>))
          .toList(),
      analyzedInstructions: (json['analyzedInstructions'] as List<dynamic>?)
          ?.map((e) => AnalyzedInstruction.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RecipeInfoToJson(RecipeInfo instance) =>
    <String, dynamic>{
      'vegetarian': instance.vegetarian,
      'vegan': instance.vegan,
      'glutenFree': instance.glutenFree,
      'dairyFree': instance.dairyFree,
      'veryHealthy': instance.veryHealthy,
      'cheap': instance.cheap,
      'veryPopular': instance.veryPopular,
      'sustainable': instance.sustainable,
      'lowFodmap': instance.lowFodmap,
      'weightWatcherSmartPoints': instance.weightWatcherSmartPoints,
      'gaps': instance.gaps,
      'preparationMinutes': instance.preparationMinutes,
      'cookingMinutes': instance.cookingMinutes,
      'aggregateLikes': instance.aggregateLikes,
      'healthScore': instance.healthScore,
      'creditsText': instance.creditsText,
      'license': instance.license,
      'sourceName': instance.sourceName,
      'pricePerServing': instance.pricePerServing,
      'id': instance.id,
      'title': instance.title,
      'image': instance.image,
      'imageType': instance.imageType,
      'readyInMinutes': instance.readyInMinutes,
      'servings': instance.servings,
      'sourceUrl': instance.sourceUrl,
      'openLicense': instance.openLicense,
      'summary': instance.summary,
      'spoonacularSourceUrl': instance.spoonacularSourceUrl,
      'usedIngredientCount': instance.usedIngredientCount,
      'missedIngredientCount': instance.missedIngredientCount,
      'likes': instance.likes,
      'cuisines': instance.cuisines,
      'dishTypes': instance.dishTypes,
      'diets': instance.diets,
      'occasions': instance.occasions,
      'missedIngredients':
          instance.missedIngredients?.map((e) => e.toJson()).toList(),
      'usedIngredients':
          instance.usedIngredients?.map((e) => e.toJson()).toList(),
      'unusedIngredients':
          instance.unusedIngredients?.map((e) => e.toJson()).toList(),
      'extendedIngredients':
          instance.extendedIngredients?.map((e) => e.toJson()).toList(),
      'analyzedInstructions':
          instance.analyzedInstructions?.map((e) => e.toJson()).toList(),
    };
