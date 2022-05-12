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

}