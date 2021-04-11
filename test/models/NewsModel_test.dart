import 'package:flutter_application_1/models/NewsModel.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  NewsModel matcherModel;
  Map<String, dynamic> matcherJson;

  setUp(() {
    // Определяем новый мап с правильными значениями
    matcherJson = new Map<String, dynamic>();
    matcherJson['id'] = 1;
    matcherJson['created_at'] = "2020-01-01";
    matcherJson['title'] = "Title";
    matcherJson['adt'] = "ADT";

    // Определяем новый экземпляр класса с правильными значениями
    matcherModel = new NewsModel(
      id: 1,
      createdAt: "2020-01-01",
      title: "Title",
      adt: "ADT",
    );
  });

  test('Получение модели из JSON', () {
    // Arrange
    var actualModel = new NewsModel.fromJson(matcherJson);
    // Assert
    expect(actualModel.id, matcherModel.id);
    expect(actualModel.createdAt, matcherModel.createdAt);
    expect(actualModel.title, matcherModel.title);
    expect(actualModel.adt, matcherModel.adt);
  });

  test('Получение JSON из модели', () {
    // Arrange
    var actualJson = matcherModel.toJson();
    // Assert
    expect(actualJson['id'], matcherJson['id']);
    expect(actualJson['created_at'], matcherJson['created_at']);
    expect(actualJson['title'], matcherJson['title']);
    expect(actualJson['adt'], matcherJson['adt']);
  });
}
