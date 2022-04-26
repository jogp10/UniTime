import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uni/model/entities/course_unit.dart';
import 'package:uni/view/Pages/general_page_view.dart';
import 'package:uni/view/Pages/secondary_page_view.dart';
import 'package:uni/view/Widgets/terms_and_conditions.dart';

import '../../model/app_state.dart';
import '../../model/entities/exam.dart';
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
