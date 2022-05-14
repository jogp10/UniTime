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

  List<String> teachers;
  String learningResult;
  String program;
  String evaluationType;
  String evaluationComp;
  String formula;
  String specialWorks;

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

  CourseUnit.fromSigarra({this.id,
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
    this.ects,
    this.teachers,
    this.learningResult,
    this.evaluationType,
    this.evaluationComp,
    this.formula,
    this.specialWorks});

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
        ects: data['creditos_ects']);
  }

  static List<CourseUnit> getUCs() {
    List<CourseUnit> ucs = [];
    List<String> teachers = [];

    teachers.add('Pedro Manuel Pinto Ribeiro');
    teachers.add('Ana Paula Cunha da Rocha');
    CourseUnit uc = CourseUnit.fromSigarra(
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
      ects: 6,
      teachers: teachers,
      learningResult: 'No final da unidade curricular, os estudantes deverão ter competência para: modelar problemas recorrendo ao paradigma da orientação por objetos; resolver problemas fazendo uso de tipos de dados abstratos e estruturas de dados simples lineares e não lineares.',
      evaluationType: 'Avaliação distribuída sem exame final ',
      evaluationComp: 'Designação\tPeso(%)\nTeste\t60,00\nTrabalho laboratorial\t40,00\n  Total:\t100,00',
      formula: 'A avaliação será baseada nas seguintes componentes:\nCIP = componente prática de programação, a realizar individualmente (média dos momentos de avaliação a realizar durante o semestre)\nCIT = componente teórica através de questionários de respostas múltiplas, a realizar individualmente\nCG = componente de grupo. Inclui 2 trabalhos (CG1 e CG2) a realizar em grupo (de 3 estudantes), de igual peso, sendo em cada um destes pontos de avaliação contabilizado o empenho e assiduidade do estudante no trabalho de grupo.',
      specialWorks: 'Os estudantes inscritos ao abrigo de regimes especiais sem frequência de aulas práticas:\n\t podem efetuar a Componente de Grupo (CG) de avaliação constituindo grupo com outros colegas ou sozinhos, devendo acordar com os docentes o trabalho a realizar e as datas de avaliação dos mesmos\n\t devem realizar a avaliação individual CIP e CIT nas datas estipuladas.'
    );
    ucs.add(uc);

    teachers.clear();
    teachers.add('Ademar Manuel Teixeira de Aguiar');
    teachers.add('João Carlos Pascoal Faria');
    uc = CourseUnit.fromSigarra(
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
        ects: 6,
        teachers: teachers,
        learningResult: 'No final da unidade curricular, os estudantes deverão ser capazes de:\n\tdescrever os princípios, conceitos e práticas da engenharia de software e do ciclo de vida do software;\n\tconhecer e saber aplicar as técnicas e ferramentas necessárias para executar e gerir as várias atividades do processo de desenvolvimento de software de qualidade;\n\texplicar os métodos e processos de construção de diferentes tipos de sistemas de software.',
        evaluationType: 'Avaliação distribuída com exame final ',
        evaluationComp: 'Designação\tPeso(%)\nTrabalho escrito\t25,00\nTrabalho prático\t30,00\nExame\t35,00\nParticipacao presencial\t10,00\n  Total:\t100,00',
        formula: 'Componentes de classificação:\n\tPQ - classificação relacionada com participação nas aulas e resposta a quizzes;\n\tTP - classificação obtida no projeto em equipa;\n\tEF - classificação obtida no exame final.\nFórmula de cálculo da classificação final:\n\tCF = round(min(10% PQ + 55% TP + 35% EF; EF + 4))\nNotas finais superiores ou iguais a 18 valores podem requerer uma prova oral, que incidirá sobre todos as aspetos abordados na UC.\nÉ exigida uma nota mínima de 40% em todas as componentes (PQ, TP e EF).\nA classificação final não pode exceder em mais de 4 valores a classificação obtida no exame final.\nNo caso dos estudantes dispensados da regra de assiduidade, a componente PQ não se aplica, passando o exame final a ter um peso de 45%.\nA classificação da componente TP pode variar entre estudantes do mesmo grupo de projeto.',
        specialWorks: '',
    );
    ucs.add(uc);
    uc = CourseUnit(name:'chines');
    ucs.add(uc);
    return ucs;
  }
}
