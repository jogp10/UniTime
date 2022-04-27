import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:uni/view/Pages/secondary_page_view.dart';

import 'package:uni/model/entities/course_unit.dart';
import 'package:uni/view/Widgets/back_button_exit_wrapper.dart';

import '../../model/app_state.dart';
import '../Widgets/course_unit_card.dart';

class CourseUnitsPageView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CourseUnitsPageViewState();
}

/// Manages the 'UCs' section of the app.
class CourseUnitsPageViewState extends SecondaryPageViewState {
  Widget buildCardContent(BuildContext context) {
    return StoreConnector<AppState, List<dynamic>>(
      converter: (store) {
        final List<CourseUnit> units = store.state.content['courseUnits'];
        return units;
      },
      builder: (context, units) {
        return CourseUnitsList(courseUnits: units);
      },
    );
  }
}

class CourseUnitsList extends StatelessWidget {
  final List<CourseUnit> courseUnits;

  CourseUnitsList({Key key, @required this.courseUnits}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackButtonExitWrapper(
        context: context,
        child: createScrollableCardView(context),
      ),
    );
  }

  Widget createScrollableCardView(BuildContext context) {
    return StoreConnector(
        builder: (context, courseUnits) {
          return Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height,
              child: ListView(
                children: this.createUnitsWidget(courseUnits, context),
              ));
        },
        converter: (store) => store.state.content['courseUnits']);
  }

  List<Widget> createUnitsWidget(List<CourseUnit> courseUnits,
      BuildContext context) {
    if (courseUnits == null) return [];

    final List<Widget> result = <Widget>[];
    for (int i = 0; i < courseUnits.length; i++) {
      result.add(this.createUnitWidget(courseUnits[i], i, context));
    }
    return result;
  }

  Widget createUnitWidget(CourseUnit courseUnit, int i, BuildContext context) {
    return CourseUnitCard();
  }
}
