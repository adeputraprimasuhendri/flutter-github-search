// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_github_search/main.dart';
import 'package:flutter_github_search/models/search_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Search github user', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    await tester.pump();
    expect(find.byType(TextFormField), findsOneWidget);

    final Finder textinput = find.byType(TextFormField);
    await tester.tap(textinput);
    await tester.showKeyboard(find.byType(TextFormField));
    await tester.enterText(find.byType(TextFormField), 'ade');
    await tester.pump();
    expect(find.text('ade'), findsOneWidget);
  });

  test('Parse json over a network', () async {
    final url = 'https://api.github.com/search/users?q=ade&per_page=10';
    final res = await Dio().get(url);
    if (res.statusCode == 200) {
      expect(SearchModel.fromJson(res.data), isNotNull);
    }
  });

  test('Parse an item json over a network', () async {
    final url = 'https://api.github.com/search/users?q=ade&per_page=10';
    final res = await Dio().get(url);
    if (res.statusCode == 200) {
      expect(SearchModel.fromJson(res.data).items.first.login, 'ade');
    }
  });
}
