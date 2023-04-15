import 'package:frontend_quizz/modele/Question.dart';
import 'package:frontend_quizz/modele/Questionnaire.dart';
import 'package:frontend_quizz/modele/Utilisateur.dart';
import 'package:frontend_quizz/service/QuestionnaireService.dart';
import 'package:http/http.dart' as http;

import '../modele/Reponse.dart';
import '../vue/CreerQuestionnairePage.dart';
class QuestionnaireController 
{

Utilisateur utilisateur ;
late CreerQuestionnairePage creerQuestionnairePage;
QuestionnaireService questionnaireService = QuestionnaireService();
Questionnaire questionnaire  = Questionnaire.parDefaut();
QuestionnaireController(this.utilisateur)
{
  creerQuestionnairePage = CreerQuestionnairePage(this);
}

void setUtilisateur(Utilisateur utilisateur) => this.utilisateur = utilisateur; 
void sujetQuestionnaire(Questionnaire questionnaire) => this.questionnaire = questionnaire; 

Utilisateur getUtilisateur() => utilisateur;

dynamic goToCreerQuestionnairePage()
{
  return creerQuestionnairePage;
}


Future<int> creerQuestionnaire() async
{
 Future<int> code = questionnaireService.ajouterQuestionnaire(questionnaire.questionnaireToJson());
 return code;
}



}