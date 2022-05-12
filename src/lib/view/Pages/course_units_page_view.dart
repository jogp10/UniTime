import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:uni/view/Pages/secondary_page_view.dart';

import 'package:uni/model/entities/course_unit.dart';
import 'package:uni/view/Widgets/back_button_exit_wrapper.dart';

import '../../controller/networking/network_router.dart';
import '../../model/app_state.dart';
import '../../redux/actions.dart';

class CourseUnitsPageView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CourseUnitsPageViewState();
}

/// Manages the 'UCs' section of the app.
class CourseUnitsPageViewState extends SecondaryPageViewState {
  List<String> options = ['Base de Dados', 'Sistemas Operativos'];

  @override
  Widget getBody(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: options.length,
          itemBuilder: (context, index) {
            return Card(
                child: ListTile(
                  onTap: () {},
                  title: Text(options[index]),
                  textColor: Colors.blue,
                )
            );
          }
      ),
    );
  }
}



