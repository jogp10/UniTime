import 'package:flutter/material.dart';
import 'package:uni/view/Pages/calendar_page_view.dart';
import 'package:uni/view/Pages/secondary_page_view.dart';
import 'package:uni/model/entities/course_unit.dart';
import 'package:uni/view/Widgets/page_transition.dart';

import '../Widgets/page_transition.dart';
import 'course_unit_page_view.dart';

class CourseUnitsPageView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CourseUnitsPageViewState();
}

/// Manages the 'UCs' section of the app.
class CourseUnitsPageViewState extends SecondaryPageViewState {

  List<CourseUnit> ucs = CourseUnit.getUCs();

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

                    onTap: (){
                      Navigator.of(context).push(PageTransition.makePageTransition(page: CourseUnitPageView()));
                    },
                    //(PageTransition.makePageTransition(page: CourseUnitPageView(), settings: )) {},
                    title: Text(ucs[index].name),
                    textColor: Colors.blue,
                  )
              ),
            );
          }
      ),
    );
  }


}
