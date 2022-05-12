/// Stores information about a course unit.
class CourseUnit {
  int id;
  String code;
  String abbreviation;
  String name;
  int curricularYear;
  int occurrId;
  String semesterCode;
  String semesterName;
  String type;
  String status;
  String grade;
  String ectsGrade;
  String result;
  num ects;

  CourseUnit({this.id,
  this.code,
  this.abbreviation,
  this.name,
  this.curricularYear,
  this.occurrId,
  this.semesterCode,
  this.semesterName,
  this.type,
  this.status,
  this.grade,
  this.ectsGrade,
  this.result,
  this.ects});

  /// Creates a new instance from a JSON object.
  static CourseUnit fromJson(dynamic data) {
    return CourseUnit(
      id: data['ucurr_id'],
      code: data['ucurr_codigo'],
      abbreviation: data['ucurr_sigla'],
      name: data['ucurr_nome'],
      curricularYear: data['ano'],
      occurrId: data['ocorr_id'],
      semesterCode: data['per_codigo'],
      semesterName: data['per_nome'],
      type: data['tipo'],
      status: data['estado'],
      grade: data['resultado_melhor'],
      ectsGrade: data['resultado_ects'],
      result: data['resultado_insc'],
      ects: data['creditos_ects']
    );
  }

  static List<CourseUnit> getUCs() {
    List<CourseUnit> ucs;

    ucs.add(CourseUnit(
        id: 1,
        code: 'LEIC011',
        abbreviation: 'ES',
        name: 'Engenharia de Software',
        curricularYear: 2022,
        occurrId: 4,
        semesterCode: '2nd',
        semesterName: 'segundo',
        type: 'cadeirão',
        status: 'state',
        grade: '19',
        ectsGrade: '5.6',
        result: '17',
        ects: 6
    ));
    ucs.add(CourseUnit(
        id: 2,
        code: 'LEIC012',
        abbreviation: 'BD',
        name: 'Base de Dados',
        curricularYear: 2022,
        occurrId: 7,
        semesterCode: '2nd',
        semesterName: 'segundo',
        type: 'cadeirão',
        status: 'state',
        grade: '13',
        ectsGrade: '3.6',
        result: '13',
        ects: 6
    ));

    return ucs;
  }

}