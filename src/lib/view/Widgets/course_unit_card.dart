import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:tuple/tuple.dart';
import 'package:uni/model/app_state.dart';
import 'package:uni/view/Widgets/request_dependent_widget_builder.dart';
import 'package:uni/view/Widgets/row_container.dart';
import 'package:uni/view/Widgets/schedule_row.dart';

import '../../controller/exam.dart';
import '../../model/entities/course_unit.dart';
import 'date_rectangle.dart';
import 'generic_card.dart';

class CourseUnitCard extends GenericCard {
  CourseUnitCard({Key key}) : super(key: key);

  @override
  Widget buildCardContent(BuildContext context) {
    return StoreConnector<AppState, Tuple2<List<CourseUnit>, RequestStatus>>(
        builder: (context, courseUnitsInfo) => RequestDependentWidgetBuilder(
            context: context,
            status: courseUnitsInfo.item2,
            contentGenerator: generateCourseUnits,
            content: courseUnitsInfo.item2,
            contentChecker: courseUnitsInfo.item1 != null &&
                courseUnitsInfo.item1.isNotEmpty,
            onNullContent: Center(
              child: Text(
                'Não existem cadeiras para apresentar',
                style: Theme.of(context).textTheme.headline4,
              ),
            )),
        converter: (store) {
          final List<CourseUnit> courseUnitsList =
              store.state.content['courseUnits'];
          return Tuple2(courseUnitsList, store.state.content['']);
        });
  }

  @override
  String getTitle() => 'Cadeiras';

  @override
  onClick(BuildContext context) => Navigator.pushNamed(context, '/');

  Widget generateCourseUnits(courseUnits, context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: this.getCourseUnitsRows(context, courseUnits),
    );
  }

  List<Widget> getCourseUnitsRows(context, courseUnits) {
    final List<Widget> rows = <Widget>[];
    for (int i = 0; i < 1 && i < courseUnits.length; i++) {
      rows.add(this.createRowFromCourseUnit(context, courseUnits[i]));
    }
    if (courseUnits.length > 1) {
      rows.add(Container(
        margin: EdgeInsets.only(right: 80.0, left: 80.0, top: 15, bottom: 7),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    width: 1.5, color: Theme.of(context).dividerColor))),
      ));
    }
    for (int i = 1; i < 4 && i < courseUnits.length; i++) {
      rows.add(this.createRowFromCourseUnit(context, courseUnits[i]));
    }
    return rows;
  }

  /// Creates a row with the Course Unit
  Widget createRowFromCourseUnit(context, CourseUnit courseUnit) {
    return Column(children: [
      Container(
        child: RowContainer(
          child: ScheduleRow(
            subject: courseUnit.abbreviation,
            begin: courseUnit.ects.toString(),
            end: courseUnit.ectsGrade.toString(),
            type: courseUnit.type,
            rooms: [courseUnit.code],
          ),
        ),
      ),
    ]);
  }
}
