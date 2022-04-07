import 'package:flutter/material.dart';
import 'package:src/my_custom_form.dart';
import 'package:src/my_calendar.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

void main() {
  runApp(const MaterialApp(
    home: Home(),
  ));
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UniTime'),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
      ),
      body: Container(
        child: MyCalendar(),
      ),
    );

  }

  Widget buildCustomForm(){
    return const MyCustomForm();
  }

  Widget buildCalendar(){
    return const MyCalendar();
  }

}