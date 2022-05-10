import 'package:uni/controller/exam.dart';
import 'package:uni/model/app_state.dart';
import 'package:uni/model/entities/exam.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:uni/view/Pages/secondary_page_view.dart';
import 'package:uni/model/entities/exam.dart';
import 'package:uni/view/Widgets/exam_page_title_filter.dart';
import 'package:uni/view/Widgets/row_container.dart';
import 'package:uni/view/Widgets/schedule_row.dart';
import 'package:uni/view/Widgets/title_card.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarPageView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CalendarPageViewState();
}

/// Tracks the state of `ExamsLists`.
class CalendarPageViewState extends SecondaryPageViewState {
  final double borderRadius = 10.0;

  @override
  Widget getBody(BuildContext context) {
    return StoreConnector<AppState, List<dynamic>>(
      converter: (store) {
        final List<Exam> exams = store.state.content['exams'];
        final Map<String, bool> filteredExams =
        store.state.content['filteredExams'];
        return exams
            .where((exam) =>
        filteredExams[Exam.getExamTypeLong(exam.examType)] ?? true)
            .toList();
      },
      builder: (context, exams) {
        return Calendar();
      },
    );
  }
}

final CalendarController _controller = CalendarController();

void calendarTapped(CalendarTapDetails calendarTapDetails){
  if (_controller.view == CalendarView.month && calendarTapDetails.targetElement == CalendarElement.calendarCell){
    _controller.view = CalendarView.week;
  }
  else if(_controller.view == CalendarView.week && calendarTapDetails.targetElement == CalendarElement.header){
    _controller.view = CalendarView.month;
  }
}

/// Manages the 'Exams' section in the user's personal area and 'Exams Map'.
class Calendar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SfCalendar(
        initialDisplayDate: DateTime.now(),
        initialSelectedDate: DateTime.now(),
        backgroundColor: Colors.black87,
        controller: _controller,
        todayHighlightColor: Colors.blue[600],
        view: CalendarView.month,

        onTap: calendarTapped,
        monthViewSettings: const MonthViewSettings(
          monthCellStyle: MonthCellStyle(
            textStyle: TextStyle(
              color: Colors.white,
            ),
            leadingDatesTextStyle: TextStyle(
                color: Colors.white24
            ),
            trailingDatesTextStyle: TextStyle(
                color: Colors.white24
            ),
          ),

        ),

        showNavigationArrow: true,
        viewHeaderStyle: ViewHeaderStyle(
            backgroundColor: Colors.blue[900],
            dayTextStyle: const TextStyle(
              color: Colors.white,
            )
        ),
        headerStyle: CalendarHeaderStyle(
            textAlign: TextAlign.center,
            backgroundColor: Colors.blue[700],
            textStyle: const TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold
            )
        ),
      ),
    );
  }
}

List<Appointment> getAppointments(List<Exam> exams){

  final DateTime today = DateTime.now();

  List<Appointment> meetings = <Appointment>[];

  for(int i = 0; i < exams.length; i++){
    DateTime start = exams[i].date;
    int duration = int.parse(exams[i].end) - int.parse(exams[i].begin);
    DateTime end = start.add(const Duration(hours:2));
    meetings.add(Appointment(
        startTime: start,
        subject: exams[i].subject,
        color: Colors.red,
        endTime: end));
  }

  /*DateTime startTime = DateTime(today.year, today.month, today.day, 9, 0, 0);
  DateTime endTime = startTime.add(const Duration(hours: 2));

  meetings.add(Appointment(
      startTime: startTime,
      endTime: endTime,
      subject: 'Evento Pessoal',
      color: Colors.lightGreen
  ));

  startTime = DateTime(2022,4,29,13,0,0);
  endTime = startTime.add(const Duration(hours: 2));

  meetings.add(Appointment(
      startTime: startTime,
      endTime: endTime,
      subject: 'Teste de LC',
      color: Colors.red
  ));*/
  return meetings;
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Appointment> source) {
    appointments = source;
  }
}