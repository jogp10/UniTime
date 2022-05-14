import '../../../testable_widget.dart';
import 'package:flutter/material.dart';
import 'package:mockito/annotations.dart';
import 'package:uni/model/entities/course_unit.dart';
import 'package:uni/view/Pages/course_unit_page_view.dart';
import 'package:flutter_test/flutter_test.dart';

@GenerateMocks([CourseUnit])
void main() {
  testWidgets('courseUnit title display page', (WidgetTester tester) async {
    final widget = makeTestableWidget(
        child: CourseUnitPageView(uc: CourseUnit.getUCs()[0]));
    await tester.pumpWidget(widget);
    final titleFinder = find.descendant(
        of: find.byType(AppBar), matching: find.byType(Text));
    expect(titleFinder, findsOneWidget);
  });

  testWidgets('courseUnit information sections display page', (WidgetTester tester) async {
    final CourseUnit uc = CourseUnit.getUCs()[0];
    final widget = makeTestableWidget(
        child: CourseUnitPageView(uc: uc));
    await tester.pumpWidget(widget);
    try {
      if(uc.learningResult!='') await tester.scrollUntilVisible(find.text("Resultados da aprendizagem"), 500);
      if(uc.evaluationType!='') await tester.scrollUntilVisible(find.text("Avaliação"), 500);
      if(uc.evaluationComp!='') await tester.scrollUntilVisible(find.text("Composição da Avaliação"), 500);
      if(uc.formula!='') await tester.scrollUntilVisible(find.text("Fórmula"), 500);
      if(uc.specialWorks!='') await tester.scrollUntilVisible(find.text("Trabalhos especiais"), 500);
    } catch (e) {
      return false;
    }
  });
}
