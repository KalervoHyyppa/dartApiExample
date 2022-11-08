import 'package:dartApiExample/models/response_model.dart';

/// Converts the incoming json from GNews to a [ResponseModel]
ResponseModel convertGnewsJsonToResponseModel(Map<String, dynamic> json) {
  return ResponseModel(
    title: json['title'],
    description: json['description'],
    content: json['content'],
    url: json['url'],
    image: json['image'],
    publishedAt: json['publishedAt'],
    sourceName: json['source']['name'],
  );
}

/// Parses [keyWords] into what GNews API expects
///
/// For example:
///
/// If [keyWords] = ['apple', 'banana']
/// It would return 'apple AND banana'
String parseKeyWords(List<String> keyWords) {
  if (keyWords.length == 1) {
    return keyWords[0];
  } else {
    String parsed = '';

    for (var i = 0; i < keyWords.length; i++) {
      parsed += keyWords[i];

      if (i != keyWords.length - 1) {
        parsed += ' AND ';
      }
    }
    return parsed;
  }
}
