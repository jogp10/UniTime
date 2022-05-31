import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:uni/view/Pages/secondary_page_view.dart';
import 'package:uni/model/entities/course_unit.dart';
import 'package:uni/view/Widgets/page_transition.dart';
import '../../model/app_state.dart';
import '../Widgets/page_transition.dart';
import 'course_unit_page_view.dart';
import 'package:html/parser.dart' as parser;
import 'package:http/http.dart' as http;
class CourseUnitsPageView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CourseUnitsPageViewState();
}

/// Manages the 'UCs' section of the app.
class CourseUnitsPageViewState extends SecondaryPageViewState {
  @override
  Widget getBody(BuildContext context) {
    return StoreConnector<AppState, List<List<dynamic>>>(
      converter: (store) {
        final DateTime startFirstSemester =
        DateTime(store.state.content['currentTime'].year, 8);
        final DateTime startSecondSemester =
        DateTime(store.state.content['currentTime'].year, 2);
        final bool firstSemester = startFirstSemester.month <=
            store.state.content['currentTime'].month &&
            store.state.content['currentTime'].month <
                startSecondSemester.month;
        final List<CourseUnit> ucs = store.state.content['currUcs'];
        final List<CourseUnit> filteredUCS = [];
        final List<CourseUnit> filteredUCS2 = [];
        for (var i = 0; i < ucs.length; i++) {
          if (ucs[i].semesterCode == '1S') {
            filteredUCS.add(ucs[i]);
          } else if (ucs[i].semesterCode == '2S') {
            filteredUCS2.add(ucs[i]);
          }
        }
        return [filteredUCS, filteredUCS2];
      },
      builder: (context, ucs) {
        return CourseList(ucs: ucs[0], ucs2: ucs[1]);
      },
    );
  }
}

class CourseList extends StatelessWidget {
  final List<CourseUnit> ucs;
  final List<CourseUnit> ucs2;
  Map<String, String> map = {'Algoritmos e Estruturas de Dados': '484404',
    'Bases de Dados': '484405' , 'Competências Transversais: Comunicação Profissional': '489822',
    'Física II':'484406', 'Laboratório de Desenho e Teste de Software' : '484407',
    'Desenho de Algoritmos' : '484424', 'Engenharia de Software' : '484425' , 'Laboratório de Computadores' : '484426',
    'Linguagens e Tecnologias Web' : '484427', 'Sistemas Operativos' : '484378', 'Teoria da Computação' : '484403'};
  Map<String, String> form = {'Algoritmos e Estruturas de Dados': 'A avaliação será baseada nas seguintes componentes:\nCIP = componente prática de programação, a realizar individualmente (média dos momentos de avaliação a realizar durante o semestre)\nCIT = componente teórica através de questionários de respostas múltiplas, a realizar individualmente\nCG = componente de grupo. Inclui 2 trabalhos (CG1 e CG2) a realizar em grupo (de 3 estudantes), de igual peso, sendo em cada um destes pontos de avaliação contabilizado o empenho e assiduidade do estudante no trabalho de grupo.\nClassificação final = 30% CIP + 30% CIT + 40% CG\nObservações:\n1. É exigida classificação mínima de 40% em todas as componentes CIP, CIT, CG1 e CG2\n2. Terá lugar uma prova de recuperação (componente prática + componente teórica) para estudantes admitidos e que não obtiveram a nota mínima nas componentes CIP e/ou CIT. A nota desta prova substitui as avaliações CIP e CIT e é limitada a 50% em cada uma destas.',
    'Bases de Dados': 'AD - Avaliação Distribuída (mínimo: 8 valores), composta por: \n  PROJ - Projeto/Trabalho de grupo\n\nEF - Exame Final (mínimo: 8 valores)\n\nNota = arredonda(0,35 PROJ + 0,65 EF)\nO projeto consiste na avaliação de um trabalho de grupo que será avaliado em três momentos diferentes: cada uma das duas primeiras entregas vale 25% e a última vale 50% da avaliação do projeto.' , 'Competências Transversais: Comunicação Profissional':'40% participação nas aulas + 60% teste de avaliação\n\nNota: os estudantes que não obtiverem aprovação poderão ter acesso à época de recurso, via exame em que o mesmo terá a ponderação de 100%.',
    'Física II':'Sendo T a nota do teste e E a nota do exame, a nota final calcula-se com a fórmula seguinte:\n\nMáximo ( E; 0.4*T + 0.6*E )\n\nOu seja, se a nota do teste for mais elevada que a nota do exame, o peso do teste é 40% e o peso do exame é 60%. Mas se a nota do exame for mais elevada, ignora-se e a nota do teste e a nota final é a nota do exame. No exame final as notas arredondam-se a uma casa decimal e não há nota mínima. A nota final é arredondada para um inteiro (9.5 arredonda-se para 10, mas 9.4999 arredonda-se para 9).', 'Laboratório de Desenho e Teste de Software' : 'Fórmula de avaliação:\n  10% - participação nas aulas práticas;\n  60% - realização do projecto integrado (grupos de 3 elementos)\n  30% - prova individual de escolha múltipla em computador.\n\nTodas as componentes têm uma classificação mínima de 40%.\n\nA classificação do projeto integrado é composta por:\n  10% - relatório intermédio\n  30% - relatório final\n  60% - produto desenvolvido\n\nDe notar que o relatório deve fundamentar o contributo individual de cada elemento no projeto.', 'Teoria da Computação': 'AD: Avaliação Distribuída (mín: 7,0 valores) constituída por três componentes:\n - Atividades de preparação\n - Atividades de avaliação\n - Desafios\nNota de AD\n  Ad, se AD <= EF+3, OU\n  EF+3, senão\n EF: exame final (as regras implicam que é necessário obter pelo menos 8,75 valores no EF para obter aprovação à UC)\N Nota final = arredonda(0,25 AD + 0,75 EF).',
    'Desenho de Algoritmos' : 'A nota final é baseada nas seguintes componentes:\n -Exame final (EF) com consulta condicionada na parte prática (somente livros e slides das aulas teóricas), com duração de 2 horas.\n -Componente distribuída (CD), composta por dois trabalhos práticos de grupo:\n   Trabalho de grupo 1 (T1);\n   Trabalho de grupo 2 (T2);\n\nA classificação CD correspondente à componente distribuída é calculada da seguinte forma:\n -CD = 0,40 *T1 + 0,60 * T2, onde T1 >= 8 valores e T2 >= 8 valores\n\nA nota final (NF) é calculada da seguinte forma:\n -NT = 0,7 * EF + 0,3 * CD, onde EF >= 8 valores\n ',
    'Engenharia de Software' : 'Componentes de classificação:\n -PQ - classificação relacionada com participação nas aulas e resposta a quizzes;\n -TP - classificação obtida no projeto em equipa;\n -EF - classificação obtida no exame final.\nFórmula de cálculo da classificação final:\n  CF = round(min(10% PQ + 55% TP + 35% EF; EF )\nNotas finais superiores ou iguais a 18 valores podem requerer uma prova oral, que incidirá sobre todos as aspetos abordados na UC.\nÉ exigida uma nota mínima de 40% em todas as componentes (PQ, TP e EF).\nA classificação final não pode exceder em mais de 4 valores a classificação obtida no exame final.\nNo caso dos estudantes dispensados da regra de assiduidade, a componente PQ não se aplica, passando o exame final a ter um peso de 45%.\nA classificação da componente TP pode variar entre estudantes do mesmo grupo de projeto.' ,
    'Laboratório de Computadores' : '0,5 PP + 0,5 * min(Proj, PP+4)\n\nonde:\n\nPP = (PP1+PP2)/2\n\nPP1, PP2 - classificação da primeira e da segunda provas de programação, respetivamente\n\nProj - classificação do projeto\n\nEmbora o projeto seja realizado em grupos de 4 estudantes, excecionalmente de 3 estudantes, membros do mesmo grupo podem ter classificações diferentes dependendo da sua contribuição.\n\nPara aprovação na unidade curricular, os estudantes têm que:\n  -ter frequência\n  -ter uma classificação mínima de 8 valores em cada teste de programação (PP1 >= 8 e PP2>=8\n  -ter uma classificação mínima de 10 valores na média das provas de programação (PP >= 10).',
    'Linguagens e Tecnologias Web' : 'Nota mínima de 8 valores no Trabalho e Exame\nNota Final = 0.5 * Trabalho + 0.5 * Exame\nNote-se que para a obtenção da nota mínima não são considerados arredondamentos. Ou seja, a nota mínima do exame é 40%. Ex: 7,95 < 8 => logo reprova.', 'Sistemas Operativos' : 'A nota final (Final) é obtida pela expressão:\n  Final =  TP + T1 + T2\n(Observação: TP, avaliado para 6 valores; T1 e T2, avaliados para 7 valores cada)\nPara se obter a aprovação à disciplina exige-se uma classificação mínima na soma das componentes T1 e T2 de 50% da escala (7 valores em 14).\nA realização de exame de recurso permite obter aprovação a uma ou ambas as componentes T1 e T2.'};
  List<CourseUnit> ucs3 = [];
  static bool semester1 = true;
  static bool semester2 = true;

  CourseList({Key key, @required this.ucs, this.ucs2}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (semester1 && semester2) {
      if (ucs==null) {
        ucs3 = ucs2;
      } else if(ucs2==null) {
        ucs3 = ucs;
      } else {
        ucs3 = ucs + ucs2;
      }
    } else if (semester1) {
      ucs3 = ucs;
    } else if (semester2) {
      ucs3 = ucs2;
    }
    return Scaffold(
        body: Column(
          children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Container(
            width: 150,
            child: TextButton(
                style: ButtonStyle(
                  backgroundColor: semester1
                      ? MaterialStateProperty.all<Color>(Colors.white)
                      : MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 0x1a, 0x18, 0x18)),
                  foregroundColor:
                  MaterialStateProperty.all<Color>(Colors.blue),
                  overlayColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.hovered))
                        return Colors.blue.withOpacity(0.04);
                      if (states.contains(MaterialState.focused) ||
                          states.contains(MaterialState.pressed))
                        return Colors.blue.withOpacity(0.12);
                      return null; // Defer to the widget's default.
                    },
                  ),
                ),
                onPressed: () {
                  semester1 ? semester1 = false : semester1 = true;
                  Navigator.of(context).push(PageTransition.makePageTransition(
                      page: CourseUnitsPageView()));
                },
                child: Text(
                  '1 Semester',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                )),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
              width: 150,
              child:
              TextButton(

                style: ButtonStyle(
                  backgroundColor: semester2
                      ? MaterialStateProperty.all<Color>(Colors.white)
                      : MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 0x1a, 0x18, 0x18)),
                  foregroundColor: MaterialStateProperty.all<Color>(
                      Colors.blue),
                  overlayColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.hovered))
                        return Colors.blue.withOpacity(0.04);
                      if (states.contains(MaterialState.focused) ||
                          states.contains(MaterialState.pressed))
                        return Colors.blue.withOpacity(0.12);
                      return null; // Defer to the widget's default.
                    },
                  ),
                ),
                onPressed: () {
                  semester2 ? semester2 = false : semester2 = true;
                  Navigator.of(context).push(PageTransition.makePageTransition(
                      page: CourseUnitsPageView()));
                },
                child: Text('2 Semester',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    )),
              ))
              ]),
          Expanded(
            child: ListView.builder(
                itemCount: ucs3.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 1.0, horizontal: 8.0),
                    child: Card(
                        child: ListTile(
                          onTap: () async {
                                  final response = await extractData(ucs3[index]);
                            Navigator.of(context).push(
                                PageTransition.makePageTransition(
                                    page: CourseUnitPageView(uc: ucs3[index])));
                          },
                          //(PageTransition.makePageTransition(page: CourseUnitPageView(), settings: )) {},
                          title: Text(
                            ucs3[index].name,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          textColor: Colors.blue,
                        )),
                  );
                }),
          )
        ],
        ));
  }
  Future<List<String>> extractData(CourseUnit uc) async {
//Getting the response from the targeted url
    final response =
    await http.Client().get(Uri.parse('https://sigarra.up.pt/feup/pt/ucurr_geral.ficha_uc_view?pv_ocorrencia_id='+ map[uc.name]));
    //Status Code 200 means response has been received successfully
    if (response.statusCode == 200) {
      //Getting the html document from the response
      var document = parser.parse(response.body);
      try {

        var objects = document.querySelectorAll('#conteudoinner h3');
        var objects2 = document.querySelectorAll('#conteudoinner')[0].nodes;

        String teachers = '';
        String ok;
        String evaluationType, evaluationComp,formula,specialWorks, html;
        for(int i = 0; i < objects2.length; i++){
          try{
             ok = objects2[i].nodes[0].text;
          }
          catch(e){}
          if(ok == 'Tipo de avaliação'){
            evaluationType = objects2[i+1].text.trim();break;}
        }
        for(int i = 0; i < objects.length; i++){
          switch(objects[i].text){
            case 'Componentes de Avaliação':
              final table1 = objects[i].nextElementSibling;
              evaluationComp = 'Designação\tPeso(%)\n';
              for(var row in table1.querySelectorAll('tr.d')){
                String doc = row.children[0].text.trim();
                String doc2 = row.children[1].text.trim();
                evaluationComp += doc + '\t' + doc2 + '\n';
              }
              break;
            case 'Fórmula de cálculo da classificação final':
              formula = form[uc.name];
              break;
            case 'Docência - Responsabilidades':
              final table2 = objects[i].nextElementSibling;
              for(var row in table2.querySelectorAll('tr.d')){
                String doc = row.children[0].text.trim();
                teachers += doc + '\n';

              }
              break;
            case 'Avaliação especial (TE, DA, ...)':
              html = objects[i].nextElementSibling.innerHtml;
              specialWorks = html.trim();
              specialWorks = specialWorks.replaceAll('<br><br>', '\n');
              specialWorks = specialWorks.replaceAll('<br>', '\n');
              specialWorks = specialWorks.replaceAll('&nbsp;', ' ');
              break;

          }
        }
        if(teachers!=''){
          uc.teachers = teachers;
        }

        if(formula!=''){
          uc.formula = formula;
        }

        if(specialWorks!=''){
          uc.specialWorks = specialWorks;
        }
        if(evaluationComp!=''){
          uc.evaluationComp = evaluationComp;
        }
        if(evaluationType!=''){
          uc.evaluationType = evaluationType;
        }
        return [
          formula,
          specialWorks,
          teachers
        ];
      } catch (e) {
        return ['', '', 'ERROR!'];
      }
    } else {
      return ['', '', 'ERROR: ${response.statusCode}.'];
    }
  }
}
