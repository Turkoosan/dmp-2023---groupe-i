import 'dart:convert';

import 'Theme.dart';
import 'Question.dart';
import 'dart:core';
import 'Niveau.dart';

class Questionnaire {
    int id = 0;
    late int id_createur = 1;
    late String sujet;
    late String theme;
    late Niveau niveau;
    List<Question> questions = [];
    List<Theme> thematiques =  [];

    Questionnaire(this.id,this.id_createur,this.sujet);

    Questionnaire.parDefaut();
    //Questionnaire(this.id,this.id_createur,this.sujet,this.questions);

    int getId(){return id;}
    int getIdCreateur(){ return id_createur;}
    List<Question> getQuestion(){ return questions;}
    List<Theme> getThematiques(){ return thematiques;}

    void setSujet(String sujet) => this.sujet = sujet;
    void setTheme(String theme) => this.theme = theme; 
    void setCreateur(int id) => id_createur = id;
    void ajouterNiveau(Niveau niveau){ this.niveau = niveau;}
    void ajouterQuestion(Question question){ questions.add(question);}
    void ajouterQuestions(List<Question> _questions)
    {  
      for( var question in _questions) 
        questions.add(question);
    }
    void modifierQuestion(int indice , Question q) => questions[indice] = q;
    void ajouterThematique(Theme theme){thematiques.add(theme);}
    void supprimerThematique(int id){thematiques.removeAt(id);}    
    void supprimerQuestion(Question question)
    {  
      questions.removeAt(questions.indexOf(question));
        
    }

    void afficher(){
        print('-- Thematiques --\n');
        
        for(Theme theme in thematiques)
        {
            print(theme.toString());
        }

        print('-- Question/Reponse---');
        
        for(Question question in questions)
        {
            question.afficher();
        }
    }

    dynamic questionnaireToJson()
   {
        dynamic questionsTojson = [];

        for (var reponse in questions) {
          questionsTojson.add(reponse.questionToJson());
        }

        return 
        jsonEncode({

          'questionnaire':{
           'id': id,
           'user_id' : id_createur,
           'sujet':sujet,
           'theme':theme,
           'questions' : questionsTojson
        }
        });
   }

    @override
  String toString() {
    // TODO: implement toString
    int nb_question = questions.length;
    int nb_thematique = thematiques.length;
    return 'id:$id - nombre de question : $nb_question - nombre de thematique : $nb_thematique';
  }



}