import 'package:flutter/material.dart';
import 'package:uni/view/Pages/secondary_page_view.dart';
import 'package:uni/model/entities/course_unit.dart';

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
    uc.teachers = 'Pedro Manuel Pinto Ribeiro \nAna Paula Cunha da Rocha';
    if(uc.teachers!=null){
      aux.add('Professores');
      aux.add(uc.teachers);
    }
    uc.learningResult = 'No final da unidade curricular, os estudantes deverão ter competência para: modelar problemas recorrendo ao paradigma da orientação por objetos; resolver problemas fazendo uso de tipos de dados abstratos e estruturas de dados simples lineares e não lineares.';
    if(uc.learningResult!=null) {
      aux.add('Resultados da aprendizagem');
      aux.add(uc.learningResult);
    }
    uc.evaluationType = 'Avaliação distribuída sem exame final ';
    if(uc.evaluationType!=null) {
      aux.add('Avaliação');
      aux.add(uc.evaluationType);
    }
    uc.evaluationComp = 'Designação\tPeso(%)\nTeste\t60,00\nTrabalho laboratorial\t40,00\n  Total:\t100,00';

    if(uc.evaluationComp!=null) {
      aux.add('Composição da Avaliação');
      aux.add(uc.evaluationComp);
    }
    uc.formula = 'A avaliação será baseada nas seguintes componentes:\nCIP = componente prática de programação, a realizar individualmente (média dos momentos de avaliação a realizar durante o semestre)\nCIT = componente teórica através de questionários de respostas múltiplas, a realizar individualmente\nCG = componente de grupo. Inclui 2 trabalhos (CG1 e CG2) a realizar em grupo (de 3 estudantes), de igual peso, sendo em cada um destes pontos de avaliação contabilizado o empenho e assiduidade do estudante no trabalho de grupo.';
    if(uc.formula!=null) {
      aux.add('Fórmula');
      aux.add(uc.formula);
    }
    uc.specialWorks = 'Os estudantes inscritos ao abrigo de regimes especiais sem frequência de aulas práticas:\n\t podem efetuar a Componente de Grupo (CG) de avaliação constituindo grupo com outros colegas ou sozinhos, devendo acordar com os docentes o trabalho a realizar e as datas de avaliação dos mesmos\n\t devem realizar a avaliação individual CIP e CIT nas datas estipuladas.';
    if(uc.specialWorks!= null) {
      aux.add('Trabalhos especiais');
      aux.add(uc.specialWorks);
    }
    this.infoUc = aux;

  }
}
