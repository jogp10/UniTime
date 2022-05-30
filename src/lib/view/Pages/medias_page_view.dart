import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:get_storage/get_storage.dart';
import 'package:uni/view/Pages/secondary_page_view.dart';
import 'package:uni/model/entities/course_unit.dart';
import 'package:uni/view/Widgets/page_transition.dart';

import '../../model/app_state.dart';
import '../../model/entities/media.dart';
import '../Widgets/page_transition.dart';
import 'media_page_view.dart';

List<Media> medias = [];
final box = GetStorage();
List storageList = [];
int entrou = 1;

void addAndStoreMedia(Media media) {
  final storageMap = {};
  final index = medias.length + 1;
  final id = 'id$index';
  final wExamsKey = 'wExams$index';
  final wTestsKey = 'wTests$index';
  final wProjectsKey = 'wProjects$index';
  final gExamsKey = 'gExams$index';
  final gTestsKey = 'gTests$index';
  final gProjectsKey = 'gProjects$index';
  final grade = 'grade$index';

  storageMap[id] = media.id;
  storageMap[wExamsKey] = media.weightExam;
  storageMap[wTestsKey] = media.weightTests;
  storageMap[wProjectsKey] = media.weightProjects;
  storageMap[gExamsKey] = media.gradeExam;
  storageMap[gTestsKey] = media.gradeTests;
  storageMap[gProjectsKey] = media.gradeProjects;
  storageMap[grade] = media.grade;

  if (storageList == null) {
    storageList = [];
    storageList.add(storageMap);
    box.write('medias', storageList);
  } else {
    box.remove('medias');
    storageList.add(storageMap);
    box.write('medias', storageList);
  }

  print('entrou uma media\n');
}

void restoreMedias() {
  storageList = box.read('medias');
  String wExamsKey,
      wTestsKey,
      wProjectsKey,
      gExamsKey,
      gTestsKey,
      gProjectsKey,
      grade,
      id;
  medias = [];

  if (storageList != null && storageList.isNotEmpty) {
    print('entrou\n');
    for (int i = 0; i < storageList.length; i++) {
      final map = storageList[i];

      final index = i + 1;

      id = 'id$index';
      wExamsKey = 'wExams$index';
      wTestsKey = 'wTests$index';
      wProjectsKey = 'wProjects$index';
      gExamsKey = 'gExams$index';
      gTestsKey = 'gTests$index';
      gProjectsKey = 'gProjects$index';
      grade = 'grade$index';

      final media = Media(
          id: map[id],
          weightTests: map[wTestsKey],
          weightProjects: map[wProjectsKey],
          weightExam: map[wExamsKey],
          gradeTests: map[gTestsKey],
          gradeProjects: map[gProjectsKey],
          gradeExam: map[gExamsKey],
          grade: map[grade]);
      medias.add(media);
    }
  }
}

void updateMedia(Media media) {
  storageList = box.read('medias');
  box.remove('medias');

  for (int i = 0; i < storageList.length; i++) {
    final index = i + 1;
    if (storageList[i]['id$index']==media.id) {
        storageList[i]['wExams$index'] = media.weightExam;
        storageList[i]['wTests$index'] = media.weightTests;
        storageList[i]['wProjects$index'] = media.weightProjects;
        storageList[i]['gExams$index'] = media.gradeExam;
        storageList[i]['gTests$index'] = media.gradeTests;
        storageList[i]['gProjects$index'] = media.gradeProjects;
        storageList[i]['grade$index'] = media.calculateGrade();
    }
  }
  box.write('medias', storageList);
}

class MediasPageView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MediasPageViewState();
}

/// Manages the 'UCs' section of the app.
class MediasPageViewState extends SecondaryPageViewState {
  @override
  void initState() {
    restoreMedias();
    super.initState();
  }

  @override
  Widget getBody(BuildContext context) {
    return StoreConnector<AppState, List<dynamic>>(
      converter: (store) {
        final List<CourseUnit> ucs = store.state.content['currUcs'];
        for (int i = 0; i < ucs.length; i++) {
          bool has = false;
          for (int j = 0; j < medias.length; j++) {
            if (ucs[i].id == medias[j].id) {
              has = true;
              break;
            }
          }
          if (!has && ucs[i].grade != '') {
            getNewMedia(ucs[i].id, 0.5, 0, 0.3, 0, 0.2, 0);
          }
          restoreMedias();
        }
        return ucs;
      },
      builder: (context, ucs) {
        return MediasList(ucs: ucs, medias: medias);
      },
    );
  }
}

class MediasList extends StatelessWidget {
  final List<CourseUnit> ucs;
  List<Media> medias;

  MediasList({Key key, @required this.ucs, @required this.medias})
      : super(key: key);

  List<Media> getMedia() {
    return medias;
  }

  void setMedia(List<Media> medias) {
    this.medias = medias;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: ucs.length,
          itemBuilder: (context, index) {
            int i = 0;
            for (int j = 0; j < medias.length; j++) {
              if (ucs[index].id == medias[j].id) i = j;
            }
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 1.0, horizontal: 8.0),
              child: Card(
                  child: ListTile(
                onTap: () {
                  if (ucs[index].grade != '') {
                    final AlertDialog alert = AlertDialog(
                      title: Text(
                        'This Course Unit is already graded.',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    );
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return alert;
                      },
                    );
                  } else {
                    Navigator.of(context)
                        .push(PageTransition.makePageTransition(
                            page: MediaPageView(
                      uc: ucs[index],
                      media: medias[i],
                    )));
                  }
                },
                title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        ucs[index].name,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                      ),
                      ucs[index].grade != null
                          ? Text('Grade : ' + ucs[index].grade,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white54))
                          : Text(
                              'Grade : ' + medias[i].grade.toString(),
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                            )
                    ]),
                textColor: Colors.blue,
              )),
            );
          }),
    );
  }
}

void getNewMedia(
    int id,
    double weightExam,
    double gradeExam,
    double weightTests,
    double gradeTests,
    double weightProjects,
    double gradeProjects) {
  addAndStoreMedia(createNewMedia(id, weightExam, gradeExam, weightTests,
      gradeTests, weightProjects, gradeProjects));
}

Media createNewMedia(
    int id,
    double weightExam,
    double gradeExam,
    double weightTests,
    double gradeTests,
    double weightProjects,
    double gradeProjects) {
  final double grade = weightExam * gradeExam +
      weightTests * gradeTests +
      weightProjects * gradeProjects;
  final Media media = Media(
      id: id,
      gradeExam: gradeExam,
      gradeProjects: gradeProjects,
      gradeTests: gradeTests,
      weightExam: weightExam,
      weightProjects: weightProjects,
      weightTests: weightTests,
      grade: grade.toInt());
  return media;
}
