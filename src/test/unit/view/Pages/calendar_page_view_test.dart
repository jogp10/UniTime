import 'package:flutter_test/flutter_test.dart';
import 'package:uni/model/entities/exam.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import '../../../testable_widget.dart';
import 'package:flutter/material.dart';
import 'package:uni/view/Pages/calendar_page_view.dart';
import 'package:uni/main.dart';

void main(){
    test('calendar constructor with one exam',() async{
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
      Exam e1 = Exam('09:00-10:00', 'SO', 'B104', year + '-' + month + '-' + day, 'EN', 'Sexta');
      exams = [e1];
      final calendar = Calendar(exams: exams);
      expect(calendar.exams[0].toString(), e1.toString());
    }
  );

    test('calendar constructor with two exams',() async{
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
      Exam e1 = Exam('09:00-10:00', 'SO', 'B104', year + '-' + month + '-' + day, 'EN', 'Sexta');
      Exam e2 = Exam('18:00-19:00', 'ES', 'B107', year + '-' + month + '-' + day, 'EN', 'Sexta');
      exams = [e1,e2];
      final calendar = Calendar(key: Key('keyTest'), exams: exams);
      expect(calendar.exams[0].toString(), e1.toString());
      expect(calendar.exams[1].toString(), e2.toString());

    });

    test('calendar constructor with zero exams',() async{
      List<Exam> exams;

      exams = [];
      final calendar = Calendar(exams: exams);
      expect(calendar.exams.length, 0);

    });

}