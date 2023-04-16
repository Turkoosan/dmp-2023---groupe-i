import 'dart:convert';

import 'package:frontend_quizz/modele/Questionnaire.dart';
import 'package:frontend_quizz/modele/Utilisateur.dart';
import 'package:frontend_quizz/service/QuestionnaireService.dart';
import 'package:frontend_quizz/vue/ListQuestionnaires.dart';
import 'package:frontend_quizz/vue/QuestionnaireDetailsPage.dart';
import 'package:http/http.dart' as http;

import '../vue/CreerQuestionnairePage.dart';


class QuestionnaireController {
  dynamic id_questionnaire;
  Utilisateur utilisateur;

  late CreerQuestionnairePage creerQuestionnairePage;
  late QuestionnaireDetailsPage questionnaireDetailsPage;
  late ListeQuestionnaires listeQuestionnaires;

  // late AffichageModifSupressionAllQuestionnaire affichageModifSupressionAllQuestionnaire;
  // late ModifQuestionnaire modifQuestionnaire;
  QuestionnaireService questionnaireService = QuestionnaireService();
  Questionnaire questionnaire = Questionnaire.parDefaut();


  QuestionnaireController(this.utilisateur) {
    creerQuestionnairePage = CreerQuestionnairePage(this);
    questionnaireDetailsPage =
    QuestionnaireDetailsPage(this, id_questionnaire: id_questionnaire);

    listeQuestionnaires = ListeQuestionnaires(this);

    // affichageModifSupressionAllQuestionnaire = AffichageModifSupressionAllQuestionnaire(this);
    // modifQuestionnaire = ModifQuestionnaire(this,id_questionnaire:id_questionnaire);
  }

  void setUtilisateur(Utilisateur utilisateur) =>
      this.utilisateur = utilisateur;

  void sujetQuestionnaire(Questionnaire questionnaire) =>
      this.questionnaire = questionnaire;

  Utilisateur getUtilisateur() => utilisateur;

  dynamic goToCreerQuestionnairePage() {
    return creerQuestionnairePage;
  }

  // dynamic goToModifierAndDeleteQuestionnaire(){
  //   return affichageModifSupressionAllQuestionnaire;
  // }

  dynamic goToModifQuestionnaire(id_questionnaires) {
    this.id_questionnaire = id_questionnaires;
    // return ModifQuestionnaire(this, id_questionnaire: id_questionnaire);
  }


  dynamic goToJouer(id_questionnaires) {
    this.id_questionnaire = id_questionnaires;
    return QuestionnaireDetailsPage(this, id_questionnaire: id_questionnaire);
  }

  goToListQuestionnaire() {
    return ListeQuestionnaires(this);

  }

  Future<int> creerQuestionnaire() async {
    Future<int> code = questionnaireService.ajouterQuestionnaire(
        questionnaire.questionnaireToJson());
    return code;
  }


//TODO voir id on rajoute le +1 car ici a chaque fois l'id vaut -1
//   Future<List> getQuestionnaireByID() async {
//     Future<String> code = questionnaireService.getQuestionnairesById(utilisateur.id+1);
//     String codeString = await code;
//     var data1Response = jsonDecode(codeString);
//     final List<dynamic> questionnaires = data1Response['questionnaires'];
//     return questionnaires;
//   }
//
//   Future<int> removeQuestionnaire(questionnaireId) {
//     Future<int> code = questionnaireService.supprimerQuestionnaire(utilisateur.id+1,questionnaireId);
//     return code;
//   }

  Future<dynamic> getQuestionnaireByIdQuestionnaire(id_questionnaire) async {
    Future<String> code = questionnaireService.getQuestionsByQuestionnaireId(
        id_questionnaire);
    String codeString = await code;
    var data1Response = jsonDecode(codeString);
    final dynamic questionnaire = data1Response['questionnaire'];
    return questionnaire;
  }

  Future<List> getQuestionnaires() async {

    String code = await questionnaireService.getQuestionnaires();
    var data1Response = jsonDecode(code);
    final dynamic questionnaire = data1Response["questionnaires"];
    return questionnaire;
  }

}