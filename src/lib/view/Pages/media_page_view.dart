import 'package:flutter/material.dart';
import 'package:uni/view/Pages/medias_page_view.dart';
import 'package:uni/view/Pages/secondary_page_view.dart';

import 'package:uni/model/entities/course_unit.dart';

import '../../model/entities/media.dart';

class MediaPageView extends StatefulWidget {
  final CourseUnit uc;
  final Media media;

  @override
  State<StatefulWidget> createState() => MediaPageViewState(uc, media);

  MediaPageView({this.uc, this.media});
}

/// Manages the 'UCs' section of the app.
class MediaPageViewState extends SecondaryPageViewState {
  CourseUnit uc;
  Media media;

  static TextEditingController _controller1;
  static TextEditingController _controller2;
  static TextEditingController _controller3;
  static TextEditingController _controller4;
  static TextEditingController _controller5;
  static TextEditingController _controller6;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  MediaPageViewState(CourseUnit uc, Media media) {
    this.uc = uc;
    this.media = media;
    _controller1 = TextEditingController(text: media.weightExam.toString());
    _controller2 = TextEditingController(text: media.gradeExam.toString());
    _controller3 = TextEditingController(text: media.weightTests.toString());
    _controller4 = TextEditingController(text: media.gradeTests.toString());
    _controller5 = TextEditingController(text: media.weightProjects.toString());
    _controller6 = TextEditingController(text: media.gradeProjects.toString());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget getBody(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      body: ListView(children: <Widget>[
        ListTile(
          onTap: null,
          leading: CircleAvatar(
            backgroundColor: Colors.transparent,
          ),
          title: Row(
            children: <Widget>[
              Container(
                  margin: const EdgeInsets.all(5.0),
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    uc.name,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  )),
            ],
          ),
        ),
        Column(
          children: [
            Container(
              margin: const EdgeInsets.all(4),
              padding: const EdgeInsets.all(4),
              child: const Text(
                'Exames',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
            ),
            Row(children: <Widget>[
              Container(
                margin: const EdgeInsets.all(2.5),
                padding: const EdgeInsets.all(2.5),
                child: const Text(
                  'Peso : ',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
              ),
              Flexible(
                  child: Container(
                margin: const EdgeInsets.all(2.5),
                padding: const EdgeInsets.all(2.5),
                child: TextField(
                  controller: _controller1,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                ),
              )),
            ]),
            Row(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.all(2.5),
                  padding: const EdgeInsets.all(2.5),
                  child: const Text(
                    'Nota : ',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                ),
                Flexible(
                    child: Container(
                  margin: const EdgeInsets.all(2.5),
                  padding: const EdgeInsets.all(2.5),
                  child: TextField(
                    controller: _controller2,
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                    ),
                  ),
                )),
              ],
            ),
            Container(
              margin: const EdgeInsets.all(4),
              padding: const EdgeInsets.all(4),
              child: const Text(
                'Testes',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
            ),
            Row(children: <Widget>[
              Container(
                margin: const EdgeInsets.all(2.5),
                padding: const EdgeInsets.all(2.5),
                child: const Text(
                  'Peso : ',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
              ),
              Flexible(
                  child: Container(
                margin: const EdgeInsets.all(2.5),
                padding: const EdgeInsets.all(2.5),
                child: TextField(
                  controller: _controller3,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                ),
              )),
            ]),
            Row(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.all(2.5),
                  padding: const EdgeInsets.all(2.5),
                  child: const Text(
                    'Nota : ',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                ),
                Flexible(
                    child: Container(
                  margin: const EdgeInsets.all(2.5),
                  padding: const EdgeInsets.all(2.5),
                  child: TextField(
                    controller: _controller4,
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                    ),
                  ),
                )),
              ],
            ),
            Container(
              margin: const EdgeInsets.all(4),
              padding: const EdgeInsets.all(4),
              child: const Text(
                'Projetos',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
            ),
            Row(children: <Widget>[
              Container(
                margin: const EdgeInsets.all(2.5),
                padding: const EdgeInsets.all(2.5),
                child: const Text(
                  'Peso : ',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
              ),
              Flexible(
                  child: Container(
                margin: const EdgeInsets.all(2.5),
                padding: const EdgeInsets.all(2.5),
                child: TextField(
                  controller: _controller5,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                ),
              )),
            ]),
            Row(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.all(2.5),
                  padding: const EdgeInsets.all(2.5),
                  child: const Text(
                    'Nota : ',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                ),
                Flexible(
                    child: Container(
                  margin: const EdgeInsets.all(2.5),
                  padding: const EdgeInsets.all(2.5),
                  child: TextField(
                    controller: _controller6,
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                    ),
                  ),
                )),
              ],
            ),
          ],
        )
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          media.weightExam = double.parse(_controller1.text);
          media.gradeExam = double.parse(_controller2.text);
          media.weightTests = double.parse(_controller3.text);
          media.gradeTests = double.parse(_controller4.text);
          media.weightProjects = double.parse(_controller5.text);
          media.gradeProjects = double.parse(_controller6.text);
          media.calculateGrade();
          updateMedia(media);
          Navigator.pop(context);
        },
        child: const Text('Save'),
      ),
    );
  }
}
