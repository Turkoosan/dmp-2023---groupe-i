import 'dart:convert';

import 'package:frontend_quizz/modele/Utilisateur.dart';
import 'package:frontend_quizz/service/AuthentifactionService.dart';
import 'package:frontend_quizz/vue/CreationQuestionnaire.dart';
import 'package:frontend_quizz/vue/InscriptionPage.dart';
import 'package:http/http.dart' as http;
import '../vue/ConnexionPage.dart';
import '../vue/AccueilPage.dart';

class UtilisateurController
{
  Utilisateur utilisateur = Utilisateur.parDefaut();
  late InscriptionPage inscriptionPage;
  late ConnexionPage connexionPage;
  late AccueilPage accueilPage;
  late CreationQuestionnaire creationQuestionnaire;
  late var token ;
  UtilisateurController()
  {
    inscriptionPage = InscriptionPage(this);
    connexionPage = ConnexionPage(this);
    accueilPage = AccueilPage(this);
    creationQuestionnaire = CreationQuestionnaire(this);

  }

  InscriptionPage goToPageInscription()
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

  CreationQuestionnaire goTocreateQuestionnaire()
  {
    return creationQuestionnaire;
  }
  

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