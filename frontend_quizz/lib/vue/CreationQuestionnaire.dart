import 'package:flutter/material.dart';
import 'package:frontend_quizz/controller/QuestionnaireController.dart';
import 'package:frontend_quizz/modele/Utilisateur.dart';

import '../controller/UtilisateurController.dart';



class CreationQuestionnaire extends StatefulWidget {

  late UtilisateurController utilisateurController;
  CreationQuestionnaire(this.utilisateurController, {super.key});

  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<CreationQuestionnaire> {

  late QuestionnaireController questionnaireController;

  _MyWidgetState(){
    questionnaireController = QuestionnaireController(Utilisateur.parDefaut());
  }


  String? dropdownValue = 'One';
  String? sujetQuestionnaire = "";
  String? themQuestion = "";
  String? niveauQuestion = "";

  final List<String> _reponses = [];
  bool _showForm = false;

  final TextEditingController _problematiqueController = TextEditingController();
  final TextEditingController _reponseController = TextEditingController();
  final _textController = TextEditingController();

  void _toggleForm() {
    setState(() {
      sujetQuestionnaire = _textController.text;
      //questionnaireController.enregistrerQuestion(themQuestion, niveauQuestion, sujetQuestionnaire);
      _reponses.clear();
      _showForm = !_showForm;
    });
  }

  void _ajouterReponse() {
    setState(() {
      _reponses.add(_reponseController.text);

      _reponseController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Creation Questionnaire'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                //TODO voir controller
                controller: _textController,
                decoration: const InputDecoration(
                  labelText: 'Sujet du questionnaire',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez saisir un nom pour le questionnaire';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                // or MainAxisAlignment.spaceBetween or MainAxisAlignment.spaceEvenly depending on your desired layout
                children: [
                  const Text('Niveau du questionnaire :'),
                  const SizedBox(width: 10),
                  // Add some space between the text and the dropdown button
                  DropdownButton<String?>(
                    value: dropdownValue,
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue;
                        niveauQuestion = newValue;
                      });
                    },
                    items: <String>['One', 'Two', 'Three', 'Four']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ],
              ),


              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _toggleForm,
                child: const Text('Ajouter une question'),
              ),


              if (_showForm) ...[
                const SizedBox(height: 16.0),
                const Text('Mon formulaire :'),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _problematiqueController,
                  decoration: const InputDecoration(
                    labelText: 'Problematique',
                  ),
                ),
                TextFormField(
                  controller: _reponseController,
                  decoration: const InputDecoration(
                    labelText: 'Reponse',
                  ),
                ),

                ElevatedButton(
                  onPressed: _ajouterReponse,
                  child: const Text('Ajouter  une réponse'),
                ),

                const SizedBox(height: 16.0),
                const Text('Réponses :'),
                const SizedBox(height: 16.0),
                Expanded(
                  child: ListView.builder(
                      itemCount: _reponses.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: Text(_reponses[index]),
                        );
                      }
                  ),
                ),


                ElevatedButton(
                  onPressed: _toggleForm,
                  child: const Text('Enregistrer la question'),
                ),
              ],

            ],
          ),
        ),
      ),
    );
  }
}