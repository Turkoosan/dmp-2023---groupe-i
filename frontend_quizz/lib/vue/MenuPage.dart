
import 'package:flutter/material.dart';
import 'package:frontend_quizz/controller/UtilisateurController.dart';
import 'package:frontend_quizz/modele/Utilisateur.dart';
import 'package:http/http.dart' as http;
class MenuPage extends StatelessWidget  
{
  UtilisateurController utilisateurController;
  MenuPage(this.utilisateurController);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Menu',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Menu'),
        ),
        body: SingleChildScrollView(
          child: Center(

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('email : ${utilisateurController.getUtilisateur().getPseudo()}'),
                  Text('mot de passe : ${utilisateurController.getUtilisateur().getMotDepasse()}'),
                  Text('token : ${utilisateurController.getToken()}'),
                  IconButton(
                    onPressed:()=>{  Navigator.push(
                                context, 
                                MaterialPageRoute
                                (builder: (context)=> utilisateurController.goToPageConnexion()))}, 
                    icon: Icon(Icons.logout)
                  )  
                ]
                ,
              ),
            ),
          ),
        ),
    );
  }
}