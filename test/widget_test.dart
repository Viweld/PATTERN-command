// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:remote_controller/indicators.dart';
import 'package:remote_controller/main.dart';
import 'package:remote_controller/my_system.dart';
import 'package:remote_controller/remote_controller.dart';

void main() {
  testWidgets('1. тест MyApp - НАЛИЧИЕ', (WidgetTester tester) async {
    final testWidget = MyApp();
    await tester.pumpWidget(testWidget);
    await tester.pumpAndSettle();
  });

  testWidgets('2. тест MySystem - НАЛИЧИЕ', (WidgetTester tester) async {
    final root = MyApp();
    await tester.pumpWidget(root);
    expect(find.byType(MySystem),findsOneWidget);

  });

  testWidgets('2.1 тест индикатора', (WidgetTester tester) async {
    final root = MyApp();
    await tester.pumpWidget(root);
    expect(find.byType(Indicators),findsOneWidget);
  });

  testWidgets('3. тест кнопок', (WidgetTester tester) async {
    final root = MyApp();
    await tester.pumpWidget(root);
    expect(find.byType(RemoteController),findsOneWidget);
  });
}
