import 'dart:async';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:uni/view/Pages/secondary_page_view.dart';
import 'package:uni/model/entities/course_unit.dart';
import 'package:uni/view/Widgets/back_button_exit_wrapper.dart';
import '../../controller/networking/network_router.dart';
import '../../model/app_state.dart';
import '../../model/entities/profile.dart';
import '../../redux/actions.dart';
import 'package:redux/redux.dart';
import 'package:uni/controller/networking/network_router.dart'
    show NetworkRouter;
import 'package:uni/model/app_state.dart';
import 'package:uni/model/entities/profile.dart';
import 'package:uni/redux/actions.dart';

class CourseUnitsPageView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CourseUnitsPageViewState();
}

ThunkAction<AppState> getUCs(Completer<Null> action) {
    return (Store<AppState> store) async {
    try {
      Profile userProfile;

      store.dispatch(SaveProfileStatusAction(RequestStatus.busy));

      final profile =
      NetworkRouter.getProfile(store.state.content['session']).then((res) {
        userProfile = res;
        store.dispatch(SaveProfileAction(userProfile));
        store.dispatch(SaveProfileStatusAction(RequestStatus.successful));
      });
      final ucs =
      NetworkRouter.getCurrentCourseUnits(store.state.content['session'])
          .then((res) => store.dispatch(SaveUcsAction(res)));
      await Future.wait([profile, ucs]);
    } catch(e) {
      Logger().e('Failed to get User UCS');
      store.dispatch(SaveProfileStatusAction(RequestStatus.failed));
    }
    action.complete();
  };
}

/// Manages the 'UCs' section of the app.
class CourseUnitsPageViewState extends SecondaryPageViewState {

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
    List<CourseUnit> courseUnits;
    return null;
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
    return null;
  }
}
