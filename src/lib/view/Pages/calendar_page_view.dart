import 'package:uni/controller/exam.dart';
import 'package:uni/model/app_state.dart';
import 'package:uni/model/entities/exam.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:uni/view/Pages/secondary_page_view.dart';
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

/// Manages the 'Exams' section in the user's personal area and 'Exams Map'.
class Calendar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SfCalendar(
        initialDisplayDate: DateTime(2022,04,01,08,30),
        initialSelectedDate: DateTime(2022,04,01,08,30),
        backgroundColor: Colors.black87,
        todayHighlightColor: Colors.blue[600],
        view: CalendarView.month,
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

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Appointment> source) {
    appointments = source;
  }
}