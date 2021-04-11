import 'package:flutter_application_1/models/NewsDetailModel.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  NewsDetailModel matcherModel;
  Map<String, dynamic> matcherJson;

  setUp(() {
    // Определяем новый мап с правильными значениями
    matcherJson = new Map<String, dynamic>();
    matcherJson['id'] = 1;
    matcherJson['created_at'] = "2020-01-01";
    matcherJson['title'] = "Title";
    matcherJson['content'] = "Content";
    matcherJson['adt'] = "ADT";
    matcherJson['files'] = ["file1", "file2", "file3"];

    // Определяем новый экземпляр класса с правильными значениями
    matcherModel = new NewsDetailModel(
      id: 1,
      createdAt: "2020-01-01",
      title: "Title",
      content: "Content",
      adt: "ADT",
      images: ["file1", "file2", "file3"],
    );
  });

  test('Получение модели из JSON', () {
    // Arrange
    var actualModel = new NewsDetailModel.fromJson(matcherJson);
    // Assert
    expect(actualModel.id, matcherModel.id);
    expect(actualModel.createdAt, matcherModel.createdAt);
    expect(actualModel.title, matcherModel.title);
    expect(actualModel.content, matcherModel.content);
    expect(actualModel.adt, matcherModel.adt);
    expect(actualModel.images.length, matcherModel.images.length);
  });

  test('Получение JSON из модели', () {
    // Arrange
    var actualJson = matcherModel.toJson();
    // Assert
    expect(actualJson['id'], matcherJson['id']);
    expect(actualJson['created_at'], matcherJson['created_at']);
    expect(actualJson['title'], matcherJson['title']);
    expect(actualJson['content'], matcherJson['content']);
    expect(actualJson['adt'], matcherJson['adt']);
    expect(actualJson['files'].length, matcherJson['files'].length);
  });
}
