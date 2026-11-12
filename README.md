# Лабораторная работа 1. Создание Flutter-проекта

Дисциплина: кроссплатформенные средства разработки программного обеспечения. Учебная тема — «Книга рецептов», вариант 3.

## Что выполнено

**Минимальное приложение.** Один экран с текстом Hello World! по центру. Модель, каталог, сеть и BLoC еще не добавлены.

На защите: Точка входа, runApp, MaterialApp, Scaffold, Center и Text.

## Запуск

Нужен Flutter SDK с Dart >= 3.10. Исходная реализация подготовлена на Flutter 3.47.9 / Dart 3.13.7; точные разрешенные зависимости находятся в `pubspec.lock`.
Установите SDK и добавьте `flutter/bin` в PATH. Для Windows нужны Visual Studio Build Tools с C++; для Web — браузер Chrome или Edge.
Клонируйте проект в путь без кириллицы, например `C:/projects/flutter-lab-01`.

```powershell
flutter pub get
flutter run -d windows
# или Web
flutter run -d chrome
```
## Проверки

```powershell
flutter analyze
flutter test --reporter expanded
flutter test integration_test/app_test.dart -d windows
flutter build web --release --no-wasm-dry-run
```


## Платформы

Проект содержит оболочки Windows, Web и Android.
