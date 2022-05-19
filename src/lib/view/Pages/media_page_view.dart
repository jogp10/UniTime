import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uni/model/app_state.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:uni/model/entities/session.dart';
import 'package:uni/view/Pages/secondary_page_view.dart';

import 'package:uni/model/entities/course_unit.dart';

import 'package:uni/controller/networking/network_router.dart';
import 'package:uni/redux/action_creators.dart';

import '../Widgets/page_transition.dart';
import 'exams_page_view.dart';

class MediaPageView extends StatefulWidget {
  CourseUnit uc;


  @override
  State<StatefulWidget> createState() => MediaPageViewState(ucs: uc);

  MediaPageView({this.uc});

}

/// Manages the 'UCs' section of the app.
class MediaPageViewState extends SecondaryPageViewState {
  CourseUnit ucs;
  List<String> infoUc;

  MediaPageViewState({this.ucs
  });
  @override
  Widget getBody(BuildContext context) {
    return StoreConnector<AppState, List<dynamic>>(
      converter: (store) {
        final List<CourseUnit> ucs = store.state.content['currUcs'];
        return ucs;
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

                    onTap: (){
                      Navigator.of(context).push(
                          PageTransition.makePageTransition(
                              page: MediaPageView(uc : ucs[index])
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
