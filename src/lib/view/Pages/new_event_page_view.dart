import 'package:flutter/material.dart';
import 'package:uni/view/Pages/secondary_page_view.dart';
import 'package:uni/model/entities/course_unit.dart';
import 'package:uni/view/Widgets/page_transition.dart';

import '../Widgets/page_transition.dart';
import 'course_unit_page_view.dart';

class NewEventPageView extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => NewEventPageViewState();

  NewEventPageView();
}

class NewEventPageViewState extends SecondaryPageViewState {

  @override
  Widget getBody(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: Size.zero,
          child: Container(
            margin: EdgeInsets.only(left: borderMargin, right: borderMargin),
            color: Theme.of(context).dividerColor,
            height: 1.5,
          ),
        ),
        title: Text("Novo Evento",
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
