# 2LEIC04T2

## Members

- António Oliveira Ferreira - 202004735
- João Francisco Ferreira Maldonado - 202004244
- João de Oliveira Gigante Pinheiro - 202008133
- Ricardo Almeida Cavalheiro - 202005103
- Ricardo Filipe da Costa Cabral Ferreira - 201907835

---

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

<br>

## Use case model
### - Diagram

![](https://i.imgur.com/B35acc9.jpg)

---
### - Tables


|||
| ----------- |-----------|
|*Name* &nbsp;&nbsp;        | **View an UC's details** |
| *Actor* | Student |
| *Description* | The student checks the information (bibliography, objectives, teachers, etc.) regarding a certain UC. |
| *Preconditions* | - The student needs to be logged in on their account;<br> - The UC needs to exist. |
| *Normal flow* | 1. The student opens the app; <br> 2. The system asks the user to log in, if they aren't already;<br> 3. The student goes to the menu and selects the "Minhas UC's" tab;<br> 4. The system shows the name of the subjects the student is enrolled in; <br> 5. The student chooses the subject it wants to check;<br> 6. The system shows all the information about the chosen subject; <br> 7. The student scrolls until they find the pretended information.|
| *Alternative flows and exceptions* | 1. [Another way to access a certain UC] If the student, in step 3, <br> selects the "Calendário" tab instead, the system then shows them their current <br> academic calendar. Then, the student can click on a subject's name and check its information.<br> |

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
| *Normal flow* | 1. The student opens the app; <br> 2. The system asks the user to log in, if they aren't already; <br> 3. The student goes to the menu and selects the "Grades" tab; <br> 4. The system shows the name of the subjects the student is enrolled in; <br> 5. The student chooses the subject they want to calculate the grade average;<br> 6. The system asks the user to input the grade average formula with percentages and respective labels; <br> 7. The system asks the user to input the grades; <br> 8. The system stores the grade, the grade average formula and updates the course grade. |
| *Alternative flows and exceptions* | 1. [Grade formula calculation already given] Step 6 can be skipped if the student has already given the UC grade average formula (the formula can also be edited later on). |

<br>

|||
| ----------- |-----------|
|*Name*         | **View School Calendar** |
| *Actor* | Student |
| *Description* | The student can check their personal school calendar, where they can view their schedule and events (evaluations, meetings, holidays, etc.). |
| *Preconditions* | -	The student needs to be logged in on their account;|
| *Normal flow* | 1. The student opens the app; <br> 2. The system asks the user to log in, if they aren't already;<br> 3.	The student goes to the menu and selects the “Calendário” tab;<br> 4. The system shows the calendar; |

<br>

|||
| ----------- |-----------|
|*Name*         | **View evaluation dates** |
| *Actor* | Student |
| *Description* | The student can check each UC’s evaluation dates including project deliveries, exams and tests. |
| *Preconditions* | - The student needs to be logged in on their account.;<br> - The student must be enrolled in, at least, one UC.<br> -	The UC needs to have evaluation moments. |
| *Normal flow* | 1.	The student opens the app; <br> 2.	The system asks the user to log in if they aren’t already;<br> 3.	The student goes to the menu and selects the “Evaluations” tab;<br>4. The system shows the name of the subjects the student is enrolled in;<br> 5. The student chooses the subject it wants to check;<br>6. The system shows all the information about the evaluation moments of the UC.|
| *Alternative flows and exceptions* | 1. [Another way to view evaluation moments] If the student, in step 3, <br> selects the "Calendário" tab instead, the system then shows them their personal calendar. <br> Then, the student can view in which days they have evaluation moments. |

---

## Domain Model

![](https://github.com/LEIC-ES-2021-22/2LEIC04T2/blob/main/images/domainModel.png)

### - Description
- **User** - User of the app that is identified by their email and password;
- **Calendar** - Academic calendar where the user can see all of their evaluation and personal events;
- **Event** - Every event related to a user identified by a date;
- **Personal** - Event not related to evaluations of UC's
- **Evaluation** - Evaluation moment that occurrs on a certain date and where the user gets a certain grade.
- **UC** - Course Unit that's characterized by its information, grade formula and bibliography;


---

## Architecture and Design

### Logical architecture
In order to provide a longer lasting and easier to maintain code, we divided our project into 3 main packages:
- Mobile App GUI that is responsible for the app's visual components and user interactions;
- Student Management Logic, composed of smaller packages (Calendar, Grades, Profile, UC) , is in charge of handling all the data accesses and modifications;
- Database Schema is where all the data related to the app is stored.

We also use two external packages - one that is used to retrieve all the information needed from Sigarra (Sigarra Database) and another that is responsible for sending notifications to the user's phone (Notification System).

![Imgur](https://i.imgur.com/vzFcGTG.png)

### Physical architecture
When our Mobile App is being used, all of logic behind the maintenance, code, security and software architecture, of the available features, is done by the application's Student Management
Logic Services. On the other hand, the Application Programming Interface (API) is percieved as a bridge, allowing
the communication between the user's machine and the app's referred management services. With this in mind, to use the students personal information, these services access external data
that's available in the Sigarra's database. This data is then stored in the server machine's Student Database.

![Imgur](https://i.imgur.com/42MVStU.png)

### Vertical prototype
The following small features were implemented:

![APK](https://github.com/LEIC-ES-2021-22/2LEIC04T2/tree/main/src/APK) 

- #### Notification - Example of a notification sent by UniTime
    - ##### Implementation:
 
![Imgur](https://i.imgur.com/t8oPaAGm.png) ![Imgur](https://i.imgur.com/fUmHEjLm.png)

- #### Calendar - Example of a student's calendar, where they can schedule and view personal events and evaluation moments 
    - ##### Implementation:

![Imgur](https://i.imgur.com/BsepjKQ.png)

- #### Grade Calculation Formula - Early example of a text form where the student can input the grade calculation formula of a certain UC
    - ##### Implementation:
 
![Imgur](https://i.imgur.com/cb7yoHK.png)![Imgur](https://i.imgur.com/NhFgS6Q.png)

### Project Management
You can find below information and references related with the project management in our team: 
* Backlog management: Product backlog and Iteration backlog in a [Github Projects board](https://github.com/LEIC-ES-2021-22/2LEIC04T2/projects/1);
* Release management: [v0](https://github.com/LEIC-ES-2021-22/2LEIC04T2/releases/tag/v0.0.1-alpha), [v1](https://github.com/LEIC-ES-2021-22/2LEIC04T2/releases/tag/v1.0.0), [v2](https://github.com/LEIC-ES-2021-22/2LEIC04T2/releases/tag/v1.0.9), v3;
* Iteration planning and retrospectives:
  * Plans:
    * First iteration begin ![Imgur](https://i.imgur.com/QNAxjy5.png)
    * First iteration end ![Imgur](https://i.imgur.com/brje6p9.png)
  * Retrospectives:
    *  [Iteration 1](https://github.com/LEIC-ES-2021-22/2LEIC04T2/blob/main/docs/retrospective1.md);

