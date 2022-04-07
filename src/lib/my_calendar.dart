import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class MyCalendar extends StatelessWidget {
  const MyCalendar({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SfCalendar(
        initialDisplayDate: DateTime(2022,04,01,08,30),
        initialSelectedDate: DateTime(2022,04,01,08,30),
        dataSource: MeetingDataSource(getAppointments()),
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

List<Appointment> getAppointments(){
  List<Appointment> meetings = <Appointment>[];
  final DateTime today = DateTime.now();
  DateTime startTime = DateTime(today.year, today.month, today.day, 9, 0, 0);
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
  ));
  return meetings;
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Appointment> source) {
    appointments = source;
  }
}