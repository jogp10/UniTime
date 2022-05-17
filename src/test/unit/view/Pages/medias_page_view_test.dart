import 'package:flutter/material.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:uni/model/entities/course_unit.dart';
import 'package:uni/view/Pages/course_units_page_view.dart';
import 'package:uni/view/Pages/medias_page_view.dart';

import '../../../testable_widget.dart';

@GenerateMocks([CourseUnit])
void main() {
  testWidgets('courseUnits display page', (WidgetTester tester) async {
    final widget = makeTestableWidget(
        child: MediasPageView());
    await tester.pumpWidget(widget);
    final cardFinder = find.descendant(
        of: find.byType(ListView), matching: find.byType(Card));
    expect(cardFinder, findsNWidgets(2));
  });
}
