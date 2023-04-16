import 'package:flutter/material.dart';

import '../controller/QuestionnaireController.dart';

class QuestionnaireDetailsPage extends StatefulWidget {
  final dynamic id_questionnaire;
  late QuestionnaireController questionnaireController;

  QuestionnaireDetailsPage(this.questionnaireController,
      {Key? key, required this.id_questionnaire})
      : super(key: key);

  @override
  State<StatefulWidget> createState() =>
      _QuestionnaireDetailsPage(questionnaireController, id_questionnaire);
}

class _QuestionnaireDetailsPage extends State<QuestionnaireDetailsPage> {
  QuestionnaireController questionnaireController;
  dynamic questionnaire;
  dynamic id_questionnaire;

  _QuestionnaireDetailsPage(this.questionnaireController, this.id_questionnaire);

  Future<dynamic> _getQuestionnaireByIdQuestionnaire() async {
    return questionnaireController.getQuestionnaireByIdQuestionnaire(id_questionnaire);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Détails du questionnaire'),
      ),
      body: FutureBuilder<dynamic>(
        future: _getQuestionnaireByIdQuestionnaire(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text('Une erreur s\'est produite : ${snapshot.error}'),
            );
          }
          questionnaire = snapshot.data;
          return Center(
            child: Text('Sujet du questionnaire : ${questionnaire['questions']}'),
          );
        },
      ),
    );
  }
}
