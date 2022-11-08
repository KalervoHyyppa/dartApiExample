import 'package:dartApiExample/models/response_model.dart';

/// Adds meta data to a list of models
List<ResponseModel> saturateMetadata(List<ResponseModel> models) {
  List<ResponseModel> copyModels = [...models];

  return copyModels.map((model) => addWordFrequencyMapToResponseModel(model)).toList();
}

/// Adds the frequency of each word in the article to the model
ResponseModel addWordFrequencyMapToResponseModel(ResponseModel model) {
  Map<String, int> wordFrequencyMap = {};

  List<String> wordsInArticle = model.content.split(' ');

  wordsInArticle.forEach((word) {
    word = word.toLowerCase();
    if (wordFrequencyMap.containsKey(word)) {
      wordFrequencyMap[word] = wordFrequencyMap[word]! + 1;
    } else {
      wordFrequencyMap[word] = 1;
    }
  });

  return model.copyWith(wordFrequencyMap: wordFrequencyMap);
}
