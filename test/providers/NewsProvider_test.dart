import 'package:flutter_application_1/models/NewsDetailModel.dart';
import 'package:flutter_application_1/models/NewsModel.dart';
import 'package:flutter_application_1/providers/NewsProvider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockNewsProvider extends Mock implements NewsProvider {}

void main() {
  MockNewsProvider provider;
  NewsModel newsModel;
  NewsDetailModel newsDetailModel;

  setUp(() {
    provider = MockNewsProvider();
    newsModel = NewsModel(
      id: 1,
      title: "Title",
      createdAt: "Created at",
      adt: "adt",
    );
    newsDetailModel = NewsDetailModel(
      id: 1,
      createdAt: "2020-01-01",
      title: "Title",
      content: "Content",
      adt: "ADT",
      images: ["file1", "file2", "file3"],
    );
  });

  test('При получении новостей сервер вернул записи', () async {
    // Arrange
    when(provider.getAllNews()).thenAnswer(
      (realInvocation) => Future.value([newsModel, newsModel, newsModel]),
    );
    // Assert
    expect(await provider.getAllNews().then((value) => value.length), 3);
  });

  test('При получении новостей сервер не отвечает', () async {
    // Arrange
    when(provider.getAllNews()).thenAnswer(
      (realInvocation) => Future.value([]),
    );
    // Assert
    expect(await provider.getAllNews(), []);
  });

  test('В избранных новостях не оказалось записей', () async {
    // Arrange
    when(provider.getAllFavoriteNews()).thenAnswer(
      (realInvocation) => Future.value([]),
    );
    // Assert
    expect(await provider.getAllFavoriteNews(), []);
  });

  test('В избранных новостях есть записи', () async {
    // Arrange
    when(provider.getAllFavoriteNews()).thenAnswer(
      (realInvocation) => Future.value([newsModel, newsModel, newsModel]),
    );
    // Assert
    expect(await provider.getAllFavoriteNews().then((v) => v.length), 3);
  });

  test('При получении детальной информации сервер не дал ответа', () async {
    // Arrange
    // when(provider.getDetailModel()).thenAnswer((realInvocation) => null);
    // Assert
    expect(await provider.getDetailModel(), null);
  });

  test('При получении детальной информации сервер вернул ответ', () async {
    // Arrange
    when(provider.getDetailModel()).thenAnswer(
      (realInvocation) => Future.value(newsDetailModel),
    );
    // Assert
    expect(await provider.getDetailModel(), newsDetailModel);
  });

  test('Указанный ID новости не находится в избранном', () async {
    // Arrange
    when(provider.checkIfFavorite()).thenAnswer(
      (realInvocation) => Future.value(false),
    );
    // Assert
    expect(await provider.checkIfFavorite(), false);
  });

  test('Указанный ID новости находится в избранном', () async {
    // Arrange
    when(provider.checkIfFavorite()).thenAnswer(
      (realInvocation) => Future.value(true),
    );
    // Assert
    expect(await provider.checkIfFavorite(), true);
  });
}
