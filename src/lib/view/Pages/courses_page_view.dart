import 'package:flutter/material.dart';
import 'package:uni/view/Pages/secondary_page_view.dart';

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:uni/model/entities/course_unit.dart';

import '../Widgets/secondary_page_back_button.dart';

class CoursesPageView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CoursesPageViewState();
}

/// Manages the 'UCs' section of the app.
class CoursesPageViewState extends SecondaryPageViewState {
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