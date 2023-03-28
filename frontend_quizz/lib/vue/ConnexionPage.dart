import 'package:flutter/material.dart';
import 'package:frontend_quizz/controller/UtilisateurController.dart';
import 'package:frontend_quizz/modele/Utilisateur.dart';
import 'package:frontend_quizz/vue/InscriptionPage.dart';
import 'package:http/http.dart' as http;

class ConnexionPage extends StatelessWidget {
  UtilisateurController utilisateurController;
  ConnexionPage(this.utilisateurController);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _email = '';
  String _motDepasse = '';
  /** 
   void _submitForm() async {
    
    Future<http.Response> response = utilisateurController.connexion(_email, _motDepasse);
    var reponse = await response; 
    if (reponse.statusCode == 200) {
      print('OUI ${reponse.body}');  
      utilisateurController.goToPageMenu();
    }
     else {
      print('NON ${reponse.body}');

    }
  } **/


  bool _submitForm(){
    utilisateurController.setUtilisateur(0, _email, _motDepasse);
    utilisateurController.setToken("edjizjdkziocziziczojeoi");
    return true;
  }

   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Authentification',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Page de connexion'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  IconButton(
                    tooltip: "s'inscrire",
                    onPressed:()=>
                    {
                      Navigator.push(
                        context, MaterialPageRoute(builder: (context)=> utilisateurController.goToPageInscription()
                        ),
                      ) 
                     }, 
                    icon: Icon(Icons.app_registration)
                  )  
                ]
                ,
              ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Email'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Pourriez vous entrez votre mail';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _email = value!;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Mot de Passe'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Pourriez vous entrez votre mot de passe';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _motDepasse = value!;
                    },
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          if(_submitForm())
                              Navigator.push(
                                context, 
                                MaterialPageRoute
                                (builder: (context)=> utilisateurController.goToPageMenu()));
                        }
                      },
                      child: Text('Connexion'),
                    ),
                  ),
                ],
              ),
            ),
            
          ),
        ),
      ),
    );
  }

}