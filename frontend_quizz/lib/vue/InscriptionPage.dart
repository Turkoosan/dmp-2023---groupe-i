import 'package:flutter/material.dart';
import 'package:frontend_quizz/controller/UtilisateurController.dart';
import 'package:frontend_quizz/modele/Utilisateur.dart';
import 'package:http/http.dart' as http;

class InscriptionPage extends StatelessWidget {
  late UtilisateurController utilisateurController;
  InscriptionPage(this.utilisateurController);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _name = '';
  String _email = '';
  String _password = '';
  bool _validation = false;
  
   void _submitForm() async {
    
    Future<int> codeStatusResponse = utilisateurController.inscription(_name, _email, _password);
    var code =  await codeStatusResponse; 
    if (code == 200) {
      _validation = true;
      print('validationPageInscription : ${_validation}');
    }
     else {
       //si 422  échec de l'inscription
      //si 401 un utilisateur avec ce pseudo existe déjà
      // Si 500 serveur indisponible
      _validation = false;

    }


  }

   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Laravel Inscription',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Laravel enregistrement'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('<-'),
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Name'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Pourriez vous entrez votre nom';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _name = value!;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Email'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Poourriez vous entrez votre mail';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _email = value!;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Password'),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Pourriez vous entrez votre mot de passe';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _password = value!;
                    },
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          _submitForm();
                          
                          Future.delayed(Duration(seconds: 1),(){
                            if(_validation){
                        
                              Navigator.pushReplacement(
                                context, 
                                MaterialPageRoute(builder: (context) => utilisateurController.goToPageMenu())
                              );
                              _validation = false;
                          }
                          });
                        }
                      },
                      child: Text('Register'),
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