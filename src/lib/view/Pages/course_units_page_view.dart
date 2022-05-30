import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:uni/view/Pages/secondary_page_view.dart';
import 'package:uni/model/entities/course_unit.dart';
import 'package:uni/view/Widgets/page_transition.dart';
import 'package:html/parser.dart' as parser;
import 'package:http/http.dart' as http;
import '../../model/app_state.dart';
import '../Widgets/page_transition.dart';
import 'course_unit_page_view.dart';

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
                            final response = await extractData();
                            print(response[0]);
                            print(response[1]);
                            print(response[2]);

                            /*Navigator.of(context).push(
                                PageTransition.makePageTransition(
                                    page: CourseUnitPageView(uc: ucs3[index])));*/
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

  Future<List<String>> extractData() async {
//Getting the response from the targeted url
    final response =
    await http.Client().get(Uri.parse('https://sigarra.up.pt/feup/pt/ucurr_geral.ficha_uc_view?pv_ocorrencia_id=484404'));
    //Status Code 200 means response has been received successfully
    if (response.statusCode == 200) {
      //Getting the html document from the response
      var document = parser.parse(response.body);
      try {
        //Scraping the first article title
        var responseString1 = document
            .getElementById('conteudoinner').children[48];



        //Scraping the second article title
        var responseString2 = document.querySelector('#conteudoinner').querySelector('responsabilidades');;



        //Scraping the third article title
        var responseString3 = document.getElementsByClassName('responsabilidades').elementAt(0).getElementsByClassName('dados').first.children[0].text.trim();

        //Converting the extracted titles into string and returning a list of Strings
        return [
          responseString1.text.trim(),
          //responseString2.text.trim(),
          //responseString3.text.trim()
        ];
      } catch (e) {
        return ['', '', 'ERROR!'];
      }
    } else {
      return ['', '', 'ERROR: ${response.statusCode}.'];
    }
  }
}
