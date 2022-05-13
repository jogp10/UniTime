import 'package:flutter_test/flutter_test.dart';
import 'package:uni/model/entities/exam.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import '../../../testable_widget.dart';
import 'package:flutter/material.dart';
import 'package:uni/view/Pages/calendar_page_view.dart';

void main(){
  testWidgets('calendar',(WidgetTester tester) async{
    List<Exam> exams;
    String year = DateTime.now().year.toString();
    String month = DateTime.now().month.toString();
    String day = DateTime.now().day.toString();
    if(month.length == 1){
      month = '0'+month;
    }
    if(day.length == 1){
      day = '0'+day;
    }
    Exam e1 = Exam('09:00-12:00', 'SO', 'B104', year + '-' + month + '-' + day, 'EN', 'Sexta');
    exams = [e1];
    const testKey = Key('K');
    final calendar = makeTestableWidget(child: Calendar(key: testKey, exams: exams));
    await tester.pumpWidget(calendar);

    expect(find.byWidget(calendar),findsOneWidget);
    expect(find.byKey(testKey),findsOneWidget);

  });

}