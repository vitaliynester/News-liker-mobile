import 'package:flutter_application_1/models/NewsModel.dart';
import 'package:flutter_application_1/providers/DatabaseProvider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockNewsModel extends Mock implements NewsModel {}

class MockDatabaseProvider extends Mock implements DatabaseProvider {}

void main() {
  MockDatabaseProvider db;
  NewsModel newsModel;

  setUp(() {
    db = MockDatabaseProvider();
    newsModel = NewsModel(
      id: 1,
      title: "Title",
      createdAt: "Created at",
      adt: "ADT",
    );
  });

  test('После добавления записи она появляется в БД', () async {
    // Assert
    expect(await db.insert(newsModel), null);
  });

  test('В избранных записях есть новость с таким ID', () async {
    // Arrange
    when(db.getNews(1)).thenAnswer((realInvocation) => Future.value(newsModel));
    // Assert
    expect(await db.getNews(1), newsModel);
  });

  test('В избранных записях нет новости с таким ID', () async {
    expect(await db.getNews(1), null);
  });

  test('В избранных новостях есть записи', () async {
    // Arrange
    when(db.getAllNews()).thenAnswer(
      (realInvocation) => Future.value([
        NewsModel(
          id: 1,
          title: "Title",
          createdAt: "Created at",
          adt: "ADT",
        ),
        NewsModel(
          id: 2,
          title: "Title",
          createdAt: "Created at",
          adt: "ADT",
        ),
        NewsModel(
          id: 3,
          title: "Title",
          createdAt: "Created at",
          adt: "ADT",
        ),
      ]),
    );
    // Assert
    expect(await db.getAllNews().then((value) => value.length), 3);
  });

  test('В избранных новостях записи отсутствуют', () async {
    // Arrange
    when(db.getAllNews()).thenAnswer((realInvocation) => Future.value([]));
    // Assert
    expect(await db.getAllNews().then((value) => value.length), 0);
  });

  test('При удалении указанная запись существовала', () async {
    // Arrange
    when(db.delete(1)).thenAnswer((realInvocation) => Future.value(1));
    // Assert
    expect(await db.delete(1), 1);
  });

  test('При удалении указанная запись несуществовала', () async {
    // Arrange
    when(db.delete(1)).thenAnswer((realInvocation) => Future.value(0));
    // Assert
    expect(await db.delete(1), 0);
  });
}
