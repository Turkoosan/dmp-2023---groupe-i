import 'dart:convert';

import 'package:frontend_quizz/modele/Question.dart';
import 'package:frontend_quizz/modele/Questionnaire.dart';
import 'package:frontend_quizz/modele/Reponse.dart';
import 'package:frontend_quizz/modele/Utilisateur.dart';
import 'package:frontend_quizz/service/AuthentifactionService.dart';
import 'package:frontend_quizz/service/QuestionnaireService.dart';
import 'package:frontend_quizz/vue/Chrono.dart';
import 'package:frontend_quizz/vue/CreationQuestionnaire.dart';
import 'package:frontend_quizz/vue/CreerQuestionnairePage.dart';
import 'package:frontend_quizz/vue/InscriptionPage.dart';
import 'package:frontend_quizz/vue/ListQuestionnaires.dart';
import 'package:frontend_quizz/vue/QuestionnaireDetailsPage.dart';
import 'package:http/http.dart' as http;
import '../vue/ConnexionPage.dart';
import '../vue/AccueilPage.dart';
import 'QuestionnaireController.dart';

class UtilisateurController
{
  Utilisateur utilisateur = Utilisateur.parDefaut();
  late InscriptionPage inscriptionPage;
  late ConnexionPage connexionPage;
  late AccueilPage accueilPage;
  late CreationQuestionnaire creationQuestionnaire;


  late Chrono chrono ;
  late ListeQuestionnaires listeQuestionnaires;

  //controller
  late QuestionnaireController questionnaireController ;
  
  late var token ;
  UtilisateurController()
  {
    inscriptionPage = InscriptionPage(this);
    connexionPage = ConnexionPage(this);
    accueilPage = AccueilPage(this);
    creationQuestionnaire = CreationQuestionnaire(this);
    questionnaireController = QuestionnaireController(utilisateur);

    // listeQuestionnaires = ListeQuestionnaires();
    chrono = Chrono();

  }

  

  InscriptionPage goToPageInscription ()
  {
    return inscriptionPage;
  }

  ConnexionPage goToPageConnexion()
  {
    return connexionPage;
  }

   AccueilPage goToPageAccueil()
  {
    return accueilPage;
  }


  goToListQuestionnaires() {
    return listeQuestionnaires ;
  }


  goToChrono(){
    return chrono ;
  }

  CreationQuestionnaire goTocreateQuestionnaire()
  {
    return creationQuestionnaire;
  }
  
  QuestionnaireController getQuestionnaireController() => questionnaireController;

  Utilisateur getUtilisateur(){ return utilisateur;}
  String getToken() => token.toString();
  void setToken(var token) => this.token = token;
  void setUtilisateur(int id , String pseudo , String motDepasse){
    utilisateur.seId(id) ; 
    utilisateur.setPseudo(pseudo) ;
    utilisateur.setMotDepasse(motDepasse);
  }
  Future<int> inscription(String nom, String pseudo , String motDepasse) async {
    AuthentificationService authentificationService = AuthentificationService();
    Future<http.Response> response = authentificationService.post(nom, pseudo, motDepasse);
    var reponse = await response;
    if(reponse.statusCode == 200)
      {
        var donnees = jsonDecode(reponse.body);
        setUtilisateur(0, pseudo, motDepasse);
        setToken(donnees['token']);
        print('controller : ,${reponse.body}');
      }

      return reponse.statusCode;
  }

  Future<int> connexion(String pseudo , String motDepasse) async {
    AuthentificationService authentificationService = AuthentificationService();
  
    Future<http.Response> response = authentificationService.login(pseudo, motDepasse);
    var reponse = await response;
    if(reponse.statusCode == 200){
      var donnees = jsonDecode(reponse.body);
      setUtilisateur(0, pseudo, motDepasse);
      setToken(donnees['token']);
      print(reponse.body);
    }
    return reponse.statusCode;
  }
}