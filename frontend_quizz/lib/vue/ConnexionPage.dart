import 'package:flutter/material.dart';
import 'package:frontend_quizz/controller/UtilisateurController.dart';
import 'package:http/http.dart' as http;

class ConnexionPage extends StatelessWidget {
  UtilisateurController utilisateurController;
  ConnexionPage(this.utilisateurController);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _email = '';
  String _motDepasse = '';
  bool _validation = false;

  Future<void> _submitForm() async {

    Future<int> codeStatusResponse = utilisateurController.connexion(_email, _motDepasse);
    var code = await codeStatusResponse;
    if (code == 200) {
      _validation = true;
    }
    else
    {
      //si 401  pseudo ou mot de passe incorrect
      //si 422 données entrée non valide
      // Si 500 serveur indisponible
      _validation = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Authentification',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Page de connexion'),
          backgroundColor: Colors.redAccent,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
                    SizedBox(height: 20),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              _submitForm();
                              Future.delayed(const Duration(seconds: 1), () {
                                if (_validation) {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          utilisateurController.goToPageAccueil(),
                                    ),
                                  );
                                  _validation = false;
                                }
                              });
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red,
                          ),
                          child: Text('Connexion'),
                        ),
                        SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    utilisateurController.goToPageInscription(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red,
                          ),
                          child: Text('Inscription'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

}