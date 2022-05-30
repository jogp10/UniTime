/// Stores information about a course unit grade.
class Media {
  int id;
  int grade;
  double gradeExam;
  double gradeTests;
  double gradeProjects;
  double weightExam;
  double weightTests;
  double weightProjects;

  Media({
    this.id,
    this.grade,
    this.gradeExam,
    this.gradeTests,
    this.gradeProjects,
    this.weightExam,
    this.weightTests,
    this.weightProjects,
  });

  int calculateGrade() {
    this.grade = (gradeExam * weightExam +
        gradeProjects * weightProjects +
        gradeTests * weightTests)
        .toInt();
    return this.grade;
  }
}
