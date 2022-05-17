import 'package:flutter/material.dart';
import 'package:uni/view/Pages/secondary_page_view.dart';

import 'package:uni/model/entities/course_unit.dart';

import '../Widgets/secondary_page_back_button.dart';

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
    if(uc.learningResult!='') {
      aux.add('Exames');
      aux.add(uc.learningResult);
    }
    if(uc.evaluationType!='') {
      aux.add('Testes');
      aux.add(uc.evaluationType);
    }
    if(uc.evaluationComp!='') {
      aux.add('Projetos');
      aux.add(uc.evaluationComp);
    }
    this.infoUc = aux;

  }
}
