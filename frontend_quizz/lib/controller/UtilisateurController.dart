import 'package:frontend_quizz/modele/Utilisateur.dart';
import 'package:frontend_quizz/vue/LoginPage.dart';
class UtilisateurController
{
  late Utilisateur utilisateur;
  late LoginPage loginPage;

  UtilisateurController()
  {
    loginPage = LoginPage(this);
  }

  Utilisateur getUtilisateur()=> utilisateur;
  void setUtilisateur(int id , String pseudo , String motDepasse) => utilisateur = Utilisateur(id, pseudo, motDepasse);

 

}