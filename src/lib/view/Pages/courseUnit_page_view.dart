import 'package:flutter/material.dart';
import 'package:uni/view/Pages/secondary_page_view.dart';

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:uni/model/entities/course_unit.dart';

import '../Widgets/secondary_page_back_button.dart';

class CoursesUnitPageView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CoursesUnitPageViewState();
}

/// Manages the 'UCs' section of the app.
class CoursesUnitPageViewState extends SecondaryPageViewState {

  @override
  Widget getTopRightButton(BuildContext context) {
    return Container();
  }

  /// Returns a list with all the children widgets of this page.
  List<Widget> childrenList(BuildContext context) {
    final List<Widget> list = [];
    list.add(Padding(padding: const EdgeInsets.all(5.0)));

    list.add(Padding(padding: const EdgeInsets.all(5.0)));
    for (var i = 0; i < 1; i++) {

    }
    list.add(Padding(padding: const EdgeInsets.all(5.0)));
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return this.getScaffold(
        context,
        this.bodyWrapper(context)
    );
  }

  @override
  Widget bodyWrapper(BuildContext context){
    return  SecondaryPageBackButton(
        context: context,
        child: this.getBody(context)
    );
  }
}
