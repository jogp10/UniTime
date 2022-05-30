import 'package:flutter/material.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:uni/model/entities/course_unit.dart';
import 'package:uni/view/Pages/course_units_page_view.dart';

import '../../../testable_widget.dart';

@GenerateMocks([CourseUnit])
void main() {
  group('CourseUnitsPage', () {
    final ucName = 'SOPE';


    testWidgets('When given an empty list', (WidgetTester tester) async {
      final widget = makeTestableWidget(
      child: CourseList(ucs: <CourseUnit>[]));
      await tester.pumpWidget(widget);
      expect(find.byType(Card), findsNothing);
    });

    testWidgets('When given a single course unit', (WidgetTester tester) async {
      final courseUnit = CourseUnit(name: ucName, semesterCode: '1S');
      final courseUnitList = [
        courseUnit,
      ];
      final widget = makeTestableWidget(
          child: CourseList(
            ucs: courseUnitList,
          ));

      await tester.pumpWidget(widget);

      expect(find.byType(Card), findsOneWidget);
    });
  });
}
