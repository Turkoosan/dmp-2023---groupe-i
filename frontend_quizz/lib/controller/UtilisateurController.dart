import 'package:flutter/material.dart';
import 'package:frontend_quizz/modele/Utilisateur.dart';
import 'package:frontend_quizz/service/AuthentifactionService.dart';
import 'package:frontend_quizz/vue/InscriptionPage.dart';
import 'package:frontend_quizz/vue/MenuPage.dart';
import 'package:http/http.dart' as http;
import '../vue/ConnexionPage.dart';

class UtilisateurController
{
  Utilisateur utilisateur = Utilisateur.parDefaut();
  late InscriptionPage inscriptionPage;
  late ConnexionPage connexionPage;
  late MenuPage menuPage;
  late var token ;
  UtilisateurController()
  {
    inscriptionPage = InscriptionPage(this);
    connexionPage = ConnexionPage(this);
    menuPage = MenuPage(this);
    
  }

  InscriptionPage goToPageInscription()
  {
    return inscriptionPage;
  }

  ConnexionPage goToPageConnexion()
  {
    return connexionPage;
  }

   MenuPage goToPageMenu()
  {
    return menuPage;
  }
  

  Utilisateur getUtilisateur(){ return utilisateur;}
  String getToken() => token.toString();
  void setToken(var token) => this.token = token;
  void setUtilisateur(int id , String pseudo , String motDepasse){
    utilisateur.seId(id) ; 
    utilisateur.setPseudo(pseudo) ;
    utilisateur.setMotDepasse(motDepasse);
    //utilisateur = Utilisateur(id, pseudo, motDepasse);
  }
  Future<http.Response> inscription(String nom, String email , String mp) async {
    AuthentificationService authentificationService = AuthentificationService();
    Future<http.Response> response = authentificationService.post(nom, email, mp);
    return response;
  }

  Future<http.Response> connexion(String pseudo , String motDepasse) async {
    AuthentificationService authentificationService = AuthentificationService();
  
    Future<http.Response> response = authentificationService.login(pseudo, motDepasse);
    var reponse = await response;
    if(reponse.statusCode == 200)
      setUtilisateur(0, pseudo, motDepasse);

    return response;
  }
  
   

}