import 'dart:convert';

class AutocompleteSearch {
  int? id;
  String? title;
  String? imageType;

  AutocompleteSearch({this.id, this.title, this.imageType});

  @override
  String toString() {
    return 'AutocompleteSearch(id: $id, title: $title, imageType: $imageType)';
  }

  factory AutocompleteSearch.fromMap(Map<String, dynamic> data) {
    return AutocompleteSearch(
      id: data['id'] as int?,
      title: data['title'] as String?,
      imageType: data['imageType'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'title': title,
        'imageType': imageType,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [AutocompleteSearch].
  factory AutocompleteSearch.fromJson(String data) {
    return AutocompleteSearch.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [AutocompleteSearch] to a JSON string.
  String toJson() => json.encode(toMap());
}


class AutocompleteSearchResponse {
  List<AutocompleteSearch>? autocompleteSearch;
}
