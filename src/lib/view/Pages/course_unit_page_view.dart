import 'package:flutter/material.dart';
import 'package:uni/view/Pages/secondary_page_view.dart';

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:uni/model/entities/course_unit.dart';

import '../Widgets/secondary_page_back_button.dart';

class CourseUnitPageView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CourseUnitPageViewState();
}

/// Manages the 'UCs' section of the app.
class CourseUnitPageViewState extends SecondaryPageViewState {
  List<String> ucs = ['ds','ass'];
  @override
  Widget getBody(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: ucs.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 1.0, horizontal: 8.0),
              child: Card(
                  child: ListTile(
                    onTap: () {},
                    //(PageTransition.makePageTransition(page: CourseUnitPageView(), settings: )) {},
                    title: Text(ucs[index]),
                    textColor: Colors.blue,
                  )
              ),
            );
          }
      ),
    );
  }
}
