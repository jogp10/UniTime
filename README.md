# 2LEIC04T2

## Members

- António Oliveira Ferreira - 202004375
- João Francisco Ferreira Maldonado - 202004244
- João de Oliveira Gigante Pinheiro - 202008133
- Ricardo Almeida Cavalheiro - 202005103
- Ricardo Filipe da Costa Cabral Ferreira - 201907835

# Product Name

UniTime

## Vision Stament
A UniTime é uma aplicação desenhada para estudantes que facilita o processo de organização do tempo de estudo e de consulta de informação das Unidades Curriculares. Ao contrário do Sigarra, na UniTime, o conteúdo estará bem organizado e a sua utilização será simples.

## Elevator Pitch
Don't you ever desired there was an application who gave you all the information you needed to know about your course?

## Main Features
 - **Consultar todos os momentos de avaliação** - Com esta aplicação, o usuário terá a possibilidade de consultar a data e hora de todos os momentos de
 avaliação futuros (como frequências, entregas de projetos e exames, por ex.).
 - **Notificar os utilizadores da aproximação de um momento de avaliação** - Quando faltar, por exemplo, uma semana para uma frequência ou entrega,
o utilizador receberá uma notificação, com uma periodicidade a definir, a avisá-lo de quantos dias é que faltam para esse determinado momento de avaliação.
- **Verificar as informações de cada cadeira** - Ao usar esta app, o utilizador possuirá a capacidade de verificar, de forma mais
resumida e fácil de compreender, todas as informações relativas às diversas unidades curriculares que frequenta (objetivos, métodos de avaliação,
professores, bibliografias, etc.).
- **Calcular a média** - O processo de cálculo da média global e específica a cada unidade curricular será agilizado com o uso desta aplicação. 
À medida que o user vai tendo conhecimento das suas notas, este pode colocar as suas classificações na app, de forma a ter uma noção de quanto é que poderá
ser a sua nota final.
- **Visualizar o calendário escolar pessoal** - Uma das funcionalidades desta aplicação é a visualização de um calendário escolar em que o utilizador poderá visualizar
todos os eventos que decorrerão ao longo do ano letivo (como exames, aulas, reuniões e outros eventos pessoais).

## Required API's
- Perfil do estudante do Sigarra
- Informação de cada UC do Sigarra
- Calendário escolar do Sigarra
- Serviço de validação do login de um utilizador no Sigarra

## Requirements

### Use case model
#### - Diagram

![](https://i.imgur.com/6M7Crbz.jpg)

---
#### - Tables


|||
| ----------- |-----------|
|*Name* &nbsp;&nbsp;        | **Check an UC's information** |
| *Actor* | Student |
| *Description* | The student checks the information (bibliography, objectives, teachers, etc.) regarding a certain UC. |
| *Preconditions* | - The student needs to be logged in on their account;<br> - The UC needs to exist. |
| *Postconditions* | - The student obtained the information they wanted to check. |
| *Normal flow* | 1. The student opens the app; <br> 2. The system asks the user to log in, if they aren't already;<br> 3. The student goes to the menu and selects the "Subjects" tab;<br> 4. The system shows the name of the subjects the student is enrolled in; <br> 5. The student chooses the subject it wants to check, by clicking on its name; <br> 6. The system shows all the information about the chosen subject; <br> 7. The student scrolls until they find the pretended information.|
| *Alternative flows and exceptions* | 1. [Another way to access a certain UC] If the student, in step 3, <br> selects the "Calendar" tab instead, the system then shows them their current <br> academic calendar. Then, the student can click on a subject's name and check its information.<br> |

<br>

|||
| --- | --- |
|*Name*  | **Notify upcoming evaluation moments** |
| *Actor* | Student |
| *Description* | The student will receive a notification on their phone to remind them of an upcoming evaluation moment. |
| *Preconditions* | - The student needs to be logged in on their account; <br> - The student must be enrolled in an UC that has, at least, one evaluation moment.|
| *Postconditions* | - A notification will appear on the notification system of the student's phone. |
| *Normal flow* | 1. The system is notified that an evaluation moment is coming up; <br> 2. The system sends a notification to the student's phone, reminding them of said moment; <br> 3. The student receives the notification. |

<br>

|||
| ----------- |-----------|
|*Name*         | **Grade Average Calculation** |
| *Actor* | Student |
| *Description* | The student inputs their grades and the grade calculation formula of a certain UC and then the average is displayed. |
| *Preconditions* | - The student needs to be logged in on their account; <br> - The UC needs to exist; <br> - The student must be enrolled in the UC. |
| *Postconditions* | - The student grades and grade calculation formula are stored; <br> - The student’s course grade average is updated. |
| *Normal flow* | 1. The student opens the app; <br> 2. The system asks the user to log in, if they aren't already; <br> 3. The student goes to the menu and selects the "Grades" tab; <br> 4. The system shows the name of the subjects the student is enrolled in; <br> 5. The student chooses the subject they want to calculate the grade average, by clicking on its name; <br> 6. The system asks the user to input the grade average formula with percentages and respective labels; <br> 7. The system asks the user to input the grades, displaying the labels; <br> 8. The system stores the grade, the grade average formula and updates the course grade. |
| *Alternative flows and exceptions* | 1. [Grade formula calculation already given] Step 6 can be skipped if the student has already given the UC grade average formula (the formula can also be edited later on). |

<br>

|||
| ----------- |-----------|
|*Name*         | **View School Calendar** |
| *Actor* | Student |
| *Description* | The student can check their personal school calendar, where they can view their schedule and events (evaluations, meetings, holidays, etc.). |
| *Preconditions* | -	The student needs to be logged in on their account;|
| *Postconditions* | -	The student viewed their school calendar and the scheduled events. |
| *Normal flow* | 1. The student opens the app; <br> 2. The system asks the user to log in, if they aren't already;<br> 3.	The student goes to the menu and selects the “Calendar” tab;<br> 4. The system shows the calendar; |

<br>

|||
| ----------- |-----------|
|*Name*         | **View evaluation dates** |
| *Actor* | Student |
| *Description* | The student can check each UC’s evaluation dates including project deliveries, exams and tests. |
| *Preconditions* | - The student needs to be logged in on their account.;<br> - The student must be enrolled in, at least, one UC.<br> -	The UC needs to have evaluation moments. |
| *Postconditions* | - The student obtains the information of the UC’s evaluations moments. |
| *Normal flow* | 1.	The student opens the app; <br> 2.	The system asks the user to log in if they aren’t already;<br> 3.	The student goes to the menu and selects the “Evaluations” tab;<br>4. The system shows the name of the subjects the student is enrolled in;<br> 5. The student chooses the subject it wants to check, by clicking on its name;<br>6. The system shows all the information about the evaluation moments of the UC.|
| *Alternative flows and exceptions* | 1. [Another way to view evaluation moments] If the student, in step 3, <br> selects the "Calendar" tab instead, the system then shows them their personal calendar. <br> Then, the student can view in which days they have an evaluation moment. |
