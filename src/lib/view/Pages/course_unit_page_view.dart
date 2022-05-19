import 'package:flutter/material.dart';
import 'package:uni/view/Pages/secondary_page_view.dart';

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:uni/model/entities/course_unit.dart';

import '../Widgets/secondary_page_back_button.dart';

class CourseUnitPageView extends StatefulWidget {
  CourseUnit uc;

  @override
  State<StatefulWidget> createState() => CourseUnitPageViewState(uc: uc);

  CourseUnitPageView({this.uc});


}

/// Manages the 'UCs' section of the app.
class CourseUnitPageViewState extends SecondaryPageViewState {
  CourseUnit uc;
  List<String> infoUc;
  CourseUnitPageViewState({this.uc
  });
  @override
  Widget getBody(BuildContext context) {
    loadUcInfo();
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
        title: Text(uc.name,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.black,

      ),

      body:
          ListView.builder(
          itemCount:  infoUc.length~/2,
          itemBuilder: (context, index) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.only(
                    top:32.0,bottom:32, left: 16,right: 16
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(infoUc[2*index],
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                        color: Colors.blue
                      )
                    ),
                    Text(infoUc[2*index+1],
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
  loadUcInfo(){
    List<String> aux = [];
    if(uc.teachers!=''){
      aux.add('Professores');
      aux.add(uc.teachers);
    }
    if(uc.learningResult!='') {
      aux.add('Resultados da aprendizagem');
      aux.add(uc.learningResult);
    }
    if(uc.evaluationType!='') {
      aux.add('Avaliação');
      aux.add(uc.evaluationType);
    }
    if(uc.evaluationComp!='') {
      aux.add('Composição da Avaliação');
      aux.add(uc.evaluationComp);
    }
    if(uc.formula!='') {
      aux.add('Fórmula');
      aux.add(uc.formula);
    }
    if(uc.specialWorks!='') {
      aux.add('Trabalhos especiais');
      aux.add(uc.specialWorks);
    }
    this.infoUc = aux;

  }
}
