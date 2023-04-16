import 'package:flutter/material.dart';
import 'package:frontend_quizz/service/QuestionnaireService.dart';

import '../controller/QuestionnaireController.dart';
import 'QuestionnaireDetailsPage.dart';



class ListeQuestionnaires extends StatefulWidget {

  late QuestionnaireController questionnaireController;
  ListeQuestionnaires(this.questionnaireController ,{super.key});

  @override
  _ListeQuestionnairesState createState() => _ListeQuestionnairesState(questionnaireController);
}

/**
 * todo
 */
class _ListeQuestionnairesState extends State<ListeQuestionnaires> {
  late QuestionnaireController questionnaireController;
  final QuestionnaireService _questionnaireService = QuestionnaireService();
  List<dynamic> _questionnaires = [];


  _ListeQuestionnairesState(this.questionnaireController){
    _getQuestionaires() ;
  }

  void _getQuestionaires()  async {
    _questionnaires = await questionnaireController.getQuestionnaires();
    print(_questionnaires);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Questionnaire créé par ${questionnaireController.utilisateur.pseudo}'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: questionnaireController.getQuestionnaires(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(child: Text('Erreur lors de la récupération des questionnaires'));
          }
          final questionnaires = snapshot.data!;
          if (questionnaires.isEmpty) {
            return const Center(child: Text('Aucun questionnaire trouvé pour cet utilisateur.'));
          }
          return ListView.builder(
            itemCount: questionnaires.length,
            itemBuilder: (BuildContext context, int index) {
              final questionnaire = questionnaires[index];
              final sujet = questionnaire['questionnaire']['sujet'];
              final id_questionnaire = questionnaire['questionnaire']['id'];
              return Card(
                child: ListTile(
                  title: Text(
                    sujet,
                    style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.play_arrow_outlined),
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute
                                (builder: (context)=>
                                  questionnaireController.goToJouer(id_questionnaire)
                              ));
                          // handle edit button tap
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}





