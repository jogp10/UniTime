import 'package:flutter/material.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:uni/model/entities/course_unit.dart';
import 'package:uni/view/Pages/course_unit_page_view.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../testable_widget.dart';
import 'course_units_page_view_test.mocks.dart';

@GenerateMocks([CourseUnit])
void main() {
  testWidgets('courseUnit title display page', (WidgetTester tester) async {
    final widget = makeTestableWidget(
        child: CourseUnitPageView(uc: MockCourseUnit()));
    await tester.pumpWidget(widget);
    final titleFinder = find.descendant(
        of: find.byType(ListView), matching: find.byType(Card));
    expect(titleFinder, findsOneWidget);
  });

  testWidgets('courseUnit information sections display page', (WidgetTester tester) async {
    final widget = makeTestableWidget(
        child: CourseUnitPageView(uc: MockCourseUnit()));
    await tester.pumpWidget(widget);
    final cardFinder = find.descendant(
        of: find.byType(ListView), matching: find.byType(Card));
    expect(cardFinder, findsNWidgets(5));
  });
}
