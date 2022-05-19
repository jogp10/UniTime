import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:uni/view/Pages/secondary_page_view.dart';
import 'package:uni/model/entities/course_unit.dart';
import 'package:uni/view/Widgets/page_transition.dart';

import '../../model/entities/session.dart';
import '../../redux/action_creators.dart';
import '../Widgets/page_transition.dart';
import 'media_page_view.dart';

class MediasPageView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MediasPageViewState();
}

/// Manages the 'Media section of the app.
class MediasPageViewState extends SecondaryPageViewState {

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

                   /* onTap: (){
                      Navigator.of(context).push(
                          PageTransition.makePageTransition(
                              page: MediaPageView(uc : ucs[index])
                          )
                      );
                    },*/
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
