import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:remote_controller/main.dart';
import 'package:remote_controller/presentation/my_system_screen.dart';
import 'package:remote_controller/presentation/widgets/indicators_view.dart';
import 'package:remote_controller/presentation/widgets/remote_controller_view.dart';

void main() {
  testWidgets('1. тест MyApp - НАЛИЧИЕ', (WidgetTester tester) async {
    final testWidget = MyApp();
    await tester.pumpWidget(testWidget);
    await tester.pumpAndSettle();
  });

  testWidgets('2. тест наличия виджета MySystemScreen',
      (WidgetTester tester) async {
    final root = MyApp();
    await tester.pumpWidget(root);
    expect(find.byType(MySystemScreen), findsOneWidget);
  });

  group('3 тест Indicators', () {
    testWidgets('наличие панели индикаторов', (WidgetTester tester) async {
      final root = MyApp();
      await tester.pumpWidget(root);
      expect(find.byType(IndicatorsView), findsOneWidget);
    });
    // testWidgets('наличие индикаторов', (WidgetTester tester) async {
    //   final root = MyApp();
    //   await tester.pumpWidget(root);
    //   final indicatorPannel=find.byType(Indicators);
    //   expect(find.byType(Indicators), findsOneWidget);
    // });
  });
  group('4 тест RemoteController', () {
    testWidgets('наличие виджета пульта', (WidgetTester tester) async {
      final root = MyApp();
      await tester.pumpWidget(root);
      expect(find.byType(RemoteControllerView), findsOneWidget);
    });
    testWidgets('кнопки', (WidgetTester tester) async {
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pump();
      //expect(find.descendant(find.byType(Container),),findsOneWidget);
    });

  });
}
