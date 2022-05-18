import 'dart:async';

import 'package:flutter/material.dart';
import 'package:uni/model/app_state.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:uni/model/entities/session.dart';
import 'package:uni/view/Pages/secondary_page_view.dart';

import 'package:uni/model/entities/course_unit.dart';

import 'package:uni/controller/networking/network_router.dart';
import 'package:uni/redux/action_creators.dart';

class MediaPageView extends StatefulWidget {
  CourseUnit uc;


  @override
  State<StatefulWidget> createState() => MediaPageViewState(uc: uc);

  MediaPageView({this.uc});

}

/// Manages the 'UCs' section of the app.
class MediaPageViewState extends SecondaryPageViewState {
  CourseUnit uc;
  List<String> infoUc;
  MediaPageViewState({this.uc
  });
  @override
  Widget getBody(BuildContext context) {
    Store<AppState> store;
    final List<CourseUnit> ucs = store.state.content['ucs'];
    getUCs();
    loadUcInfo();
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: Size.zero,
          child: Container(
            margin: EdgeInsets.only(left: borderMargin, right: borderMargin),
            color: Theme
                .of(context)
                .dividerColor,
            height: 1.5,
          ),
        ),
        title: Text(ucs[0].name,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.black,

      ),

      body:
      ListView.builder(
          itemCount: infoUc.length ~/ 2,
          itemBuilder: (context, index) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 32.0, bottom: 32, left: 16, right: 16
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(infoUc[2 * index],
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue
                        )
                    ),
                    Text(infoUc[2 * index + 1],
                      style: TextStyle(

                      ),
                    ),
                  ],
                ),
              ),
            );
          }
      ),
    );
  }

  loadUcInfo() async {
    List<String> aux = [];
    if(uc.evaluationComp!='') {
      aux.add('Fórmula');
      aux.add(uc.evaluationComp);
    }
    this.infoUc = aux;
  }

  static Future<List<CourseUnit>> getUCs() async {
    Completer<Null> userInfo = Completer();
    ThunkAction<AppState> info;
    info = getUserInfo(userInfo);

    Store<AppState> store;
    final Session session = store.state.content['session'];
    final List<CourseUnit> ucs = await NetworkRouter.getCurrentCourseUnits(session);
    print(ucs[0].name);
    return ucs;
  }
}
