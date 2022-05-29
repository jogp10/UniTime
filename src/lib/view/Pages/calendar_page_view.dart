import 'package:get_storage/get_storage.dart';
import 'package:uni/model/app_state.dart';
import 'package:uni/model/entities/exam.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:uni/view/Pages/new_event_page_view.dart';
import 'package:uni/view/Pages/secondary_page_view.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:uni/view/Widgets/page_transition.dart';
import 'package:intl/intl.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:uni/user_secure_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<Appointment> events = [];
final box = GetStorage();
List storageList = [];
int entrou = 1;


void addAndStoreEvent(Appointment event) {
  final storageMap = {}; // temporary map that gets added to storage
  final index = events.length + 1; // for unique map keys
  final nameKey = 'subject$index';
  final startKey = 'startTime$index';
  final endKey = 'endTime$index';

  storageMap[nameKey] = event.subject;
  storageMap[startKey] = event.startTime.toIso8601String();
  storageMap[endKey] = event.endTime.toIso8601String();

  if(storageList == null){
    storageList = [];
    storageList.add(storageMap); // adding temp map to storageList
    box.write('eventos', storageList); // adding list of maps to storage
  }

  else{
    box.remove('eventos');
    storageList.add(storageMap); // adding temp map to storageList
    box.write('eventos', storageList); // adding list of maps to storage

  }
}

void restoreEvents() {
  storageList = box.read('eventos'); // initializing list from storage
  String nameKey, startKey, endKey;
  events = [];

// looping through the storage list to parse out Task objects from maps
  if(storageList != null && storageList.isNotEmpty){
    for (int i = 0; i < storageList.length; i++) {
      final map = storageList[i];
      // index for retreival keys accounting for index starting at 0
      final index = i + 1;

      nameKey = 'subject$index';
      startKey = 'startTime$index';
      endKey = 'endTime$index';

      // recreating Task objects from storage

      final event = Appointment(subject: map[nameKey], startTime: DateTime.parse(map[startKey]) ,endTime: DateTime.parse(map[endKey]), color: Colors.green);

      events.add(event); // adding Tasks back to your normal Task list
    }
  }
}



class CalendarPageView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CalendarPageViewState();
}

/// Tracks the state of `ExamsLists`.
class CalendarPageViewState extends SecondaryPageViewState {
  final double borderRadius = 10.0;

  @override
  void initState(){
    restoreEvents();
    super.initState();
  }

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
        return Calendar(exams: exams,);
      },
    );
  }
}


final CalendarController _controller = CalendarController();

/// Manages the 'Calendário' section in the user's personal area.
class Calendar extends StatelessWidget {

  final List<Exam> exams;

  Calendar({Key key, @required this.exams,}) : super(key: key);


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
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
                PageTransition.makePageTransition(
                    page: NewEventPageView()
                ),
            );
          },
          tooltip: 'Adicionar Evento',
          backgroundColor: Colors.blue[700],
          elevation: 6,
          child: Icon(Icons.add),
        )
    );
  }

  void calendarTapped(CalendarTapDetails details) {
    if(details.targetElement == CalendarElement.appointment ||
    details.targetElement == CalendarElement.agenda) {
      details.date;
    }
  }
}

List<Appointment> getAppointments(List<Exam> exams){

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

  if(events.isNotEmpty){
    for(int i = 0; i < events.length; i++){
      meetings.add(events[i]);
    }
  }


  return meetings;
}

void getNewEvent(String start, String end, String name, String date){

  addAndStoreEvent(createNewEvent(start, end, name, date));

}

Appointment createNewEvent(String start, String end, String name, String date) {
  var eventDate = DateTime.parse(date);
  int startTimeHour;
  int endTimeHour;
  int startTimeMins;
  int endTimeMins;

  if(start.substring(1,2) == ":"){
    startTimeHour = int.parse(start.substring(0,1));
    startTimeMins = int.parse(start.substring(2,4));
  }
  else{
    startTimeHour = int.parse(start.substring(0,2));
    startTimeMins = int.parse(start.substring(3,5));
  }

  if(end.substring(1,2) == ":"){
    endTimeHour = int.parse(end.substring(0,1));
    endTimeMins = int.parse(end.substring(2,4));
  }
  else {
    endTimeHour = int.parse(end.substring(0,2));
    endTimeMins = int.parse(end.substring(3,5));
  }

  DateTime startTime = eventDate;
  startTime = startTime.add(Duration(hours: startTimeHour));
  if(start.contains('PM')) startTime = startTime.add(Duration(hours: 12));
  startTime = startTime.add(Duration(minutes: startTimeMins));

  DateTime endTime = eventDate;
  endTime = endTime.add(Duration(hours: endTimeHour));
  if(end.contains('PM')) endTime = endTime.add(Duration(hours: 12));
  endTime = endTime.add(Duration(minutes: endTimeMins));

  Appointment newEvent = Appointment(
      startTime: startTime,
      endTime: endTime,
      subject: name,
      color: Colors.green
  );

  return newEvent;
}


class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Appointment> source) {
    appointments = source;
  }

}

class NewEventPageView extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => NewEventPageViewState();

  NewEventPageView();
}


class NewEventPageViewState extends State<NewEventPageView> {


  final timeControllerStart = TextEditingController();
  final timeControllerEnd = TextEditingController();
  final nameController = TextEditingController();
  final dateController = TextEditingController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          bottom: PreferredSize(
            preferredSize: Size.zero,
            child: Container(
              margin: EdgeInsets.only(left: 18.0, right: 18.0),
              color: Theme.of(context).dividerColor,
              height: 1.5,
            ),
          ),
          title: Text("Novo Evento",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.blue[700],

        ),
        body: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextField(
                    autofocus: false,
                    controller: nameController,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue, width: 1.0)
                        ),
                        hintText: 'Nome do evento',
                        icon: Icon(
                          Icons.add,
                          color: Colors.blue,
                        )
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextField(
                    readOnly: true,
                    autofocus: false,
                    controller: timeControllerStart,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue, width: 1.0)
                        ),
                        labelStyle: TextStyle(color: Colors.blue),
                        hintText: 'Início',
                        icon: Icon(Icons.add,
                          color: Colors.blue,
                        )
                    ),
                    onTap: () async {
                      var time =  await showTimePicker(
                        initialTime: TimeOfDay.now(),
                        context: context,);
                      timeControllerStart.text = time.format(context);
                    },),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextField(
                    readOnly: true,
                    autofocus: false,
                    controller: timeControllerEnd,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue, width: 1.0)
                        ),
                        labelStyle: TextStyle(color: Colors.blue),
                        hintText: 'Fim',
                        icon: Icon(Icons.add,
                          color: Colors.blue,
                        )
                    ),
                    onTap: () async {
                      var time =  await showTimePicker(
                        initialTime: TimeOfDay.now(),
                        context: context,);
                      timeControllerEnd.text = time.format(context);
                    },),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextField(
                    readOnly: true,
                    autofocus: false,
                    controller: dateController,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue, width: 1.0)
                        ),
                        labelStyle: TextStyle(color: Colors.blue),
                        hintText: 'Data',
                        icon: Icon(Icons.add,
                          color: Colors.blue,
                        )
                    ),
                    onTap: () async {
                      var date =  await showDatePicker(
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2101),
                        context: context,);
                      dateController.text = DateFormat('yyyy-MM-dd').format(date);

                    },),
                ),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 120, vertical: 2),
                    child: ElevatedButton(
                      onPressed: () {
                        getNewEvent(timeControllerStart.text, timeControllerEnd.text, nameController.text, dateController.text);
                        Navigator.of(context).push(
                          PageTransition.makePageTransition(
                              page: CalendarPageView()
                          ),
                        );
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                      ),
                      child: Text('Adicionar Novo Evento',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    )
                ),
              ],
            )
        )
    );
  }
}