import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:uni/view/Pages/secondary_page_view.dart';
import 'package:uni/model/entities/course_unit.dart';
import 'package:uni/view/Widgets/page_transition.dart';

import '../../model/app_state.dart';
import '../Widgets/page_transition.dart';
import 'media_page_view.dart';

class MediasPageView extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => MediasPageViewState();

}

/// Manages the 'UCs' section of the app.
class MediasPageViewState extends SecondaryPageViewState {
  @override
  Widget getBody(BuildContext context) {
    return StoreConnector<AppState, List<dynamic>>(
      converter: (store) {
        final List<CourseUnit> ucs = store.state.content['currUcs'];
        return ucs;
      },
      builder: (context, ucs) {
        return MediasList(ucs: ucs);
      },
    );
  }

}

class MediasList extends StatelessWidget {
  final List<CourseUnit> ucs;

  MediasList({Key key, @required this.ucs}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: ucs.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 1.0, horizontal: 8.0),
              child: Card(
                  child: ListTile(

                    onTap: () {
                      if(ucs[index].grade!=''){
                        AlertDialog alert = AlertDialog(
                          title: Text(
                            'This Course Unit is already graded.'
                                ,
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
                      }
                      else{
                        Navigator.of(context).push(
                            PageTransition.makePageTransition(
                                page: MediaPageView(uc: ucs[index])
                            )
                        );
                      }

                    },
                    //(PageTransition.makePageTransition(page: CourseUnitPageView(), settings: )) {},
                    title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[

                          Text(ucs[index].name,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue
                        ),
                          ),
                          ucs[index].grade!=''? Text(

                              'Grade : ' + ucs[index].grade,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green)
                          ) : Text(

                              '',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)
                          )

                        ]
                    ),

                    textColor: Colors.blue,
                  )
              ),
            );
          }
      ),
    );
  }
}
