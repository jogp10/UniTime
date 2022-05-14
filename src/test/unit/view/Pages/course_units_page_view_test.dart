import 'package:encrypt/encrypt.dart';
import 'package:uni/model/entities/course_unit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:uni/view/Pages/course_units_page_view.dart';

import '../../../testable_widget.dart';

void main() {
  testWidgets('courseUnits', (WidgetTester tester) async {
    List<CourseUnit> ucs;
    CourseUnit uc1 = CourseUnit(name: 'ES');
    CourseUnit uc2 = CourseUnit(name: 'DA');
    ucs = [uc1, uc2];

    const testKey = Key('K');
    final course_units = makeTestableWidget(child: )

  });
}
