
import 'package:flutter/material.dart';
import 'package:frontend_quizz/controller/QuestionnaireController.dart';
import 'package:frontend_quizz/controller/UtilisateurController.dart';
import 'package:frontend_quizz/modele/Question.dart';
import 'package:frontend_quizz/modele/Questionnaire.dart';
import 'package:frontend_quizz/modele/Reponse.dart';
import 'package:frontend_quizz/modele/Utilisateur.dart';
import 'package:frontend_quizz/service/QuestionnaireService.dart';

class CreerQuestionnairePage extends StatefulWidget
{
  late QuestionnaireController questionnaireController;
  CreerQuestionnairePage(this.questionnaireController , {super.key});


  @override
  State<CreerQuestionnairePage> createState() => _CreerQuestionnairesPage(questionnaireController);

}

class _CreerQuestionnairesPage extends State<CreerQuestionnairePage> 
{

  Questionnaire q1 = Questionnaire.parDefaut();
  QuestionnaireService questionnaireService = QuestionnaireService();
  QuestionnaireController questionnaireController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  int compteurFormQuestion = 0;
  int _formQuestionCount = 0;
  bool _reponse_est_vrai = false;  
  bool validation = false;
  int _code_status = 0;
  bool questionnaire_valide = true;

  _CreerQuestionnairesPage(this.questionnaireController);

  List<TextEditingController> questions = List.generate(10, (_) => TextEditingController());
  List<List<TextEditingController>> reponses =  List.generate(10, (_) => List.generate(10, (_) => TextEditingController()));
  var _reponses_est_vrai = 
  [
  [false,false,false,false,false],[false,false,false,false,false],
  [false,false,false,false,false],[false,false,false,false,false],
  [false,false,false,false,false],[false,false,false,false,false],
  [false,false,false,false,false],[false,false,false,false,false],
  [false,false,false,false,false],[false,false,false,false,false],
  [false,false,false,false,false],[false,false,false,false,false],
  [false,false,false,false,false],[false,false,false,false,false],
  [false,false,false,false,false],[false,false,false,false,false],
   ] ;



  


  List<int> listCompteurFormReponses = [];
  Questionnaire questionnaire = Questionnaire.parDefaut();
  String? _data = '';
  String? _theme = '';
  String? _sujet = '';

  void _verification ()
  {


          // On recupérer les questions et réponses 
          //à l'aide des TextEditingController définit
          //dans les variables questions et reponses 
          for(int i = 0 ; i < compteurFormQuestion ; i++)
          {
            // récuperation de la question 
            var editQuestion = questions[i].text;

            if(editQuestion.isEmpty)
                {
                  questionnaire_valide = false;
                  break;
                }  
            
            for(int j = 0 ; j < listCompteurFormReponses[i] ; j++)
            {
                // récuperation de la réponse
                var editReponse = reponses[i][j].text;
                
                if(editReponse.isEmpty)
                {
                  questionnaire_valide = false;
                  break;
                }  
            }

           if(!questionnaire_valide)
            break;

          }


  }

   void _submitQuestionnaire()  async
{
          // On recupérer les questions et réponses 
          //à l'aide des TextEditingController définit
          //dans les variables questions et reponses 
          for(int i = 0 ; i < compteurFormQuestion ; i++)
          {
            // récuperation de la question 
            var editQuestion = questions[i].text;

            // création d'un objet Question
            var question = Question(0, editQuestion);
            
            for(int j = 0 ; j < listCompteurFormReponses[i] ; j++)
            {
                // récuperation de la réponse
                var editReponse = reponses[i][j].text;
                var estVrai = _reponses_est_vrai[i][j];
                
                // création d'un objet Reponse
                var reponse = Reponse(0, editReponse, estVrai);
                
                question.ajouterReponse(reponse);

            }

            questionnaire.ajouterQuestion(question);

          }

      questionnaire.setSujet(_sujet!); questionnaire.setTheme(_theme!);  
      print(questionnaire.questionnaireToJson());

      questionnaireController.sujetQuestionnaire(questionnaire);
      Future<int> response_code =  questionnaireController.creerQuestionnaire();
      _code_status =  await response_code; 


      
     
                    
  }

  @override
  Widget build(BuildContext context)
  {
    
    return Scaffold(
      appBar: AppBar(title: const Text('Création de Questionnaire'),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 19),
              const Text('Rédiger votre questionnaire',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.amber,
                fontSize: 22)),
                Form(
                  key: _formKey,  
                  child: Column(
                  children:[
                       TextFormField(
                    decoration: InputDecoration(labelText: 'Sujet'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Pourriez vous entrez votre nom';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _sujet = value!;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Theme'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Pourriez vous entrez votre nom';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _theme = value!;
                    },
                  ),
                  ]
                  ), 
                ),
                const Text('\n\nQuestions ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.amber,
                fontSize: 18)),
                const SizedBox(height: 20),
                ...List.generate(compteurFormQuestion, (index) => formulaireQuestion(index)),
                buttonAjouterQuestion(),
                const SizedBox(height: 30),

              IconButton(
              onPressed: () { 
                  setState(() {
                     validation = true;  
                     _verification();
                  });
                
                 if (_formKey.currentState!.validate() && questionnaire_valide) {
                  
                _formKey.currentState!.save();
                _submitQuestionnaire();

                 Future.delayed(const Duration(seconds: 3),(){


                  print("code status : ${_code_status}");  
                    if(_code_status == 201)
                      {
                        setState(() {
                          _alertDialogQuestionnaireCreer();
                        });
                      }
                    else {

                        setState(() {
                          _alertDialogQuestionnaireErreur();
                        });
                    }  
                  
                 });
               
                 }
                  
                 }           
              , 
              icon: const  Icon(Icons.star))
            ],
          ) 
          ) 
        ),
    );
  }


  Widget buttonAjouterReponse(int key) =>
    Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:
        [
         IconButton(
        onPressed:(){setState(() {
          if( listCompteurFormReponses[key] < 5)
            listCompteurFormReponses[key]+=1;
          
          else
            {
              setState(() {
                _alertDialogMaximumReponse();
              });
            }
        });}, 
        icon: Icon(
          Icons.add_circle), 
          color: Colors.greenAccent,
          tooltip: "Ajouter une reponse ",

          ), 

      Visibility(
        visible: 
          listCompteurFormReponses[key] > 0,
        child:
          IconButton(
        onPressed:(){
          setState(() {
          listCompteurFormReponses[key]-=1 ;
        });}, 
        icon: Icon(
          Icons.remove_circle, 
          color: Colors.redAccent
          ),
          tooltip: "Supprimer la reponse"
          )  

      
      ),
      ],); 


  Widget formulaireQuestion(int key) =>
        Column( children :<Widget>[ Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: TextFormField(
          controller: questions[key],
          decoration: InputDecoration(
            hintText: 'Problematique ${key + 1}',
            errorText: (questions[key].text.isEmpty && validation)? " La problematique n°${key + 1} ne peut être vide ":null ,
            ),
          


        ),
        
        
        
      ) ,  ...List.generate(listCompteurFormReponses[key], (index) => formulaireReponse(index,key)), 
        buttonAjouterReponse(key)
        ]);


      Widget formulaireReponse(int key_reponse, key_question){

    
      return
      Column(
        children: [
          
       Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: TextFormField(
          decoration: InputDecoration(
            hintText: 'Reponse ${key_reponse + 1}',
            errorText: (reponses[key_question][key_reponse].text.isEmpty && validation)? " La réponse n°${key_reponse + 1} de la problèmatique n°${key_question+1} ne peut être vide ":null
          ),
          controller: reponses[key_question][key_reponse],
          
        ),
        
      ),
           Row( 
             mainAxisAlignment: MainAxisAlignment.center, 
             children: <Widget>[ 
               Switch( 
                   value: _reponses_est_vrai[key_question][key_reponse], 
                   activeColor: Colors.green, 
                   activeTrackColor: Colors.amber, 
                   inactiveTrackColor: Colors.red[200], 
                   inactiveThumbColor: Colors.red, 
                   onChanged: (value) { 
                     setState(() { 
                       _reponses_est_vrai[key_question][key_reponse]= value;
                       
                     }); 
                   }), 
             ], 
           ), 
           Text(_reponses_est_vrai[key_question][key_reponse] ? 'Vrai' : 'Faux') 
         ], 
       );

      } 
      
     



 

  Widget buttonAjouterQuestion() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Visibility(
            visible: compteurFormQuestion > 0,
            child: IconButton(
                onPressed: () {
                  setState(() {
                    compteurFormQuestion--;
                    listCompteurFormReponses.remove(listCompteurFormReponses.length -1);
                  });
                },
                icon: const CircleAvatar(
                  backgroundColor: Colors.redAccent,
                    child: Icon(
                    Icons.remove,
                    color: Colors.amber,
                  ),
                  
                ),
                tooltip: "Supprimer la question",  
                ),
          ),
          if(compteurFormQuestion > 0  )
          SizedBox( width: 40 ,),
          IconButton(
              onPressed: () {
                setState((){ 
                  if(compteurFormQuestion < 5)
                  {
                    compteurFormQuestion++ ; 
                    listCompteurFormReponses.add(0);
                  }
                  else
                  {
                     setState(() {
                       _alertDialogMaximumQuestion();
                     }); 
                  }
                    }) ;
              },
              icon: const CircleAvatar(
                backgroundColor: Colors.teal,
                child: Icon(
                  Icons.add,
                  color: Colors.amber,
                ),
              ),
              tooltip: "Ajouter une question",  
              ),
        ],
      );


     void _alertDialogMaximumQuestion() async 
     {
      await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Ajout de question'),
            content: Text(
              'Vous avez atteint le nombre maximum d\'ajout de question !' +
              '\nSi vous souhaitez depasser cette limite il est possible de changer d\'abonnement\n'
              +'Ou bien d\'acheter un crédit de  questions supplementaires ! '
              ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Fermer'),
              ),
            ],
          );
        },
    );
  }


   void _alertDialogMaximumReponse() async 
     {
      await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Ajout de Reponse'),
            content: Text(
              'Vous avez atteint le nombre maximum d\'ajout de reponse !' +
              '\nSi vous souhaitez depasser cette limite il est possible de changer d\'abonnement\n'
              +'Ou bien d\'acheter un crédit de  reponses supplementaires ! '
              ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Fermer'),
              ),
            ],
          );
        },
    );
  }
  
  void _alertDialogQuestionnaireCreer() async {
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Création Réussi'),
            content: Text(
              'Votre questionnaire a été créé avec succès !'
              ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Fermer'),
              ),
            ],
          );
        },
    );
  }
  
  void _alertDialogQuestionnaireErreur() async {
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Erreur inattendue'),
            content: Text(
              'Malheuresement le questionnaire n\'a pu être créé veuillez réessayer plus tard .\n'
              + 'Le service est momentanément indisponible .'
              ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Fermer'),
              ),
            ],
          );
        },
    );
  }


}