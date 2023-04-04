import 'package:frontend_quizz/modele/Question.dart';
import 'package:frontend_quizz/modele/Utilisateur.dart';
import 'package:http/http.dart' as http;

import '../modele/Reponse.dart';
class QuestionnaireController 
{

Utilisateur utilisateur = Utilisateur.parDefaut();

var reponseQuestion = <Reponse>[];
var questionQuestionnaire = <Question>[];
var themeQuestionnaire = "";
var niveauQuestionnaire = "";
var sujetGlobalQuestionnaire = "";


QuestionnaireController(){
  reponseQuestion = [];
  questionQuestionnaire = [];
  themeQuestionnaire = "";
  niveauQuestionnaire = "";
  sujetGlobalQuestionnaire = "";

}

void enregistrerQuestion(var themQuestion, var niveauQuestion, var sujetQuestionnaire){
  themeQuestionnaire = themQuestion;
  niveauQuestionnaire = niveauQuestion;
  sujetGlobalQuestionnaire = sujetQuestionnaire;
  print("$sujetGlobalQuestionnaire ");
  print("$themeQuestionnaire ");
  print("$niveauQuestionnaire ");

}


}