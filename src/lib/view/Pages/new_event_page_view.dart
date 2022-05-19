import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uni/view/Pages/secondary_page_view.dart';
import 'package:uni/model/entities/course_unit.dart';
import 'package:uni/view/Widgets/page_transition.dart';

import '../Widgets/page_transition.dart';
import 'course_unit_page_view.dart';

class NameEvent extends StatefulWidget {
  NameEvent({Key key}) : super(key: key);

  @override
  _NameEventState createState() => _NameEventState();
}

class _NameEventState extends State<NameEvent> {

  final nameController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
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
    );
  }
}

class TimePicker extends StatefulWidget {
  TimePicker({Key key}) : super(key: key);

  @override
  _TimePickerState createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  final timeController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is removed
    timeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
        readOnly: true,
        autofocus: false,
        controller: timeController,
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
          timeController.text = time.format(context);
        },);
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
            )
          ],
        )
      )
    );
  }
}
