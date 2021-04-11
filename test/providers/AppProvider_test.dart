import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/NewsFavoriteListPage.dart';
import 'package:flutter_application_1/pages/NewsListPage.dart';
import 'package:flutter_application_1/providers/AppProvider.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  AppProvider provider;

  setUp(() {
    provider = new AppProvider();
  });

  test('Изменение индекса bottom bar на указанный существующий', () {
    // Arrange
    int id = 1;
    // Act
    provider.changeBottomIndex(id);
    // Assert
    expect(provider.bottomIndex, id);
  });
  test('Изменение индекса bottom bar на указанный отсутствующий', () {
    // Arrange
    int id = -1;
    // Act
    provider.changeBottomIndex(id);
    // Assert
    expect(provider.bottomIndex, id);
  });
  test('Получение страницы для первого элемента bottom bar', () {
    // Arrange
    int id = 0;
    // Act
    provider.changeBottomIndex(id);
    // Assert
    expect(
      provider.getPageFromBottomNavigator(),
      isA<NewsListPage>(),
    );
  });
  test('Получение страницы для второго элемента bottom bar', () {
    // Arrange
    int id = 1;
    // Act
    provider.changeBottomIndex(id);
    // Assert
    expect(
      provider.getPageFromBottomNavigator(),
      isA<NewsFavoriteListPage>(),
    );
  });
  test('Получение страницы для несуществующего bottom bar', () {
    // Arrange
    int id = -1;
    // Act
    provider.changeBottomIndex(id);
    // Assert
    expect(
      provider.getPageFromBottomNavigator(),
      isA<Scaffold>(),
    );
  });
}
