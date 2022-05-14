import 'package:flutter/material.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:uni/model/entities/course_unit.dart';
import 'package:uni/view/Pages/course_units_page_view.dart';

@GenerateMocks([CourseUnit])

void main() {
  testWidgets('courseUnits display page', (WidgetTester tester) async {
    when(CourseUnit.getUCs()).thenReturn([CourseUnit(name: 'ES'), CourseUnit(name:'DA'), CourseUnit(name: 'AED')]);
    await tester.pumpWidget(Scaffold(), Duration(seconds: 3));

    expect(find.byType(Card), findsNWidgets(2));
  });
}
