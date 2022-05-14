import 'package:uni/model/app_state.dart';
import 'package:uni/model/entities/exam.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:uni/view/Pages/secondary_page_view.dart';
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
        return Calendar(exams: exams);
      },
    );
  }
}

final CalendarController _controller = CalendarController();


/// Manages the 'Calendário' section in the user's personal area.
class Calendar extends StatelessWidget {

  final List<Exam> exams;
  Calendar({Key key, @required this.exams}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SfCalendar(
        initialDisplayDate: DateTime.now(),
        initialSelectedDate: DateTime.now(),
        dataSource: MeetingDataSource(getAppointments(exams)),
        backgroundColor: Colors.black87,
        controller: _controller,
        todayHighlightColor: Colors.blue[600],
        view: CalendarView.month,
        onTap: calendarTapped,

        monthViewSettings: const MonthViewSettings(
          showAgenda: true,
          agendaStyle: AgendaStyle(
            backgroundColor: Colors.white10,
            dayTextStyle: TextStyle(
              color: Colors.blue
            ),
            appointmentTextStyle: TextStyle(
              fontSize: 16
            ),
            dateTextStyle: TextStyle(
              color: Colors.white
            )
          ),
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
            //backgroundColor: Colors.blue[900],
            dayTextStyle: const TextStyle(
              color: Colors.white,
            ),

            dateTextStyle: const TextStyle(
              color: Colors.blue
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

  void calendarTapped(CalendarTapDetails details) {
    if(details.targetElement == CalendarElement.appointment ||
    details.targetElement == CalendarElement.agenda) {
    }
  }
}

List<Appointment> getAppointments(List<Exam> exams){

  final DateTime today = DateTime.now();

  List<Appointment> meetings = <Appointment>[];

  for(int i = 0; i < exams.length; i++){
    DateTime start = exams[i].date;
    int hour = int.parse(exams[i].begin.substring(0,2));
    int mins = int.parse(exams[i].begin.substring(3));
    start = start.add(Duration(hours: hour));
    start = start.add(Duration(minutes: mins));
    DateTime end = start.add(const Duration(hours:2));
    meetings.add(Appointment(
        startTime: start,
        subject: exams[i].subject,
        color: Colors.red[800],
        endTime: end));
  }
  return meetings;
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Appointment> source) {
    appointments = source;
  }
}