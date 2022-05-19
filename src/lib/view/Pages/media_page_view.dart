import 'package:flutter/material.dart';
import 'package:uni/view/Pages/secondary_page_view.dart';

import 'package:uni/model/entities/course_unit.dart';

class MediaPageView extends StatefulWidget {
  CourseUnit uc;

  @override
  State<StatefulWidget> createState() => MediaPageViewState();

  MediaPageView({this.uc});
}

/// Manages the 'UCs' section of the app.
class MediaPageViewState extends SecondaryPageViewState {
  CourseUnit uc;

  MediaPageViewState({this.uc
  });


  @override
  Widget getBody(BuildContext context) {
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
        title: Text(uc.name,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.black,

      ),


    );
  }

}
