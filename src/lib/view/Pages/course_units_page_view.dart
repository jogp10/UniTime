import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:uni/view/Pages/secondary_page_view.dart';
import 'package:uni/model/entities/course_unit.dart';
import 'package:uni/view/Widgets/page_transition.dart';

import '../../model/app_state.dart';
import '../Widgets/page_transition.dart';
import 'course_unit_page_view.dart';

class CourseUnitsPageView extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => CourseUnitsPageViewState();

}

/// Manages the 'UCs' section of the app.
class CourseUnitsPageViewState extends SecondaryPageViewState {
  @override
  Widget getBody(BuildContext context) {
    return StoreConnector<AppState, List<dynamic>>(
      converter: (store) {
        final DateTime startFirstSemester = DateTime(store.state.content['currentTime'].year, 8);
        final DateTime startSecondSemester = DateTime(store.state.content['currentTime'].year, 2);
        final bool firstSemester = startFirstSemester.month<=store.state.content['currentTime'].month && store.state.content['currentTime'].month<startSecondSemester.month;
        final List<CourseUnit> ucs = store.state.content['currUcs'];
        final List<CourseUnit> filteredUCS = [];
        for(var i=0; i<ucs.length; i++) {
          if(firstSemester && ucs[i].semesterCode=='1S') {
            filteredUCS.add(ucs[i]);
          } else if (!firstSemester && ucs[i].semesterCode=='2S') {
            filteredUCS.add(ucs[i]);
          }
        }
        return filteredUCS;
      },
      builder: (context, ucs) {
        return CourseList(ucs: ucs);
      },
    );
  }

}

class CourseList extends StatelessWidget {
  final List<CourseUnit> ucs;

  CourseList({Key key, @required this.ucs}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: ucs.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 1.0, horizontal: 8.0),
              child: Card(
                  child: ListTile(

                    onTap: () {
                      Navigator.of(context).push(
                          PageTransition.makePageTransition(
                              page: CourseUnitPageView(uc: ucs[index])
                          )
                      );
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
