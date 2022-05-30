import 'package:flutter/material.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:uni/model/entities/course_unit.dart';
import 'package:uni/model/entities/media.dart';
import 'package:uni/view/Pages/course_units_page_view.dart';
import 'package:uni/view/Pages/medias_page_view.dart';

import '../../../testable_widget.dart';

@GenerateMocks([CourseUnit])
void main() {
  group('MediasPage', () {
    final ucName = 'SOPE';

    testWidgets('When given an empty list', (WidgetTester tester) async {
      final widget = makeTestableWidget(
          child: MediasList(ucs: <CourseUnit>[]));
      await tester.pumpWidget(widget);
      expect(find.byType(Card), findsNothing);
    });

    testWidgets('When given a single course unit', (WidgetTester tester) async {
      final media = Media(id:9999, grade:17);
      final courseUnit = CourseUnit(name: ucName, id:9999);
      final courseUnitList = [
        courseUnit,
      ];
      final widget = makeTestableWidget(
          child: MediasList(
            ucs: courseUnitList,
            medias: [media],
          ));

      await tester.pumpWidget(widget);

      expect(find.byType(Card), findsOneWidget);
    });
  });
}
