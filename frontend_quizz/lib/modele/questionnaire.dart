import 'Theme.dart';
import 'question.dart';
import 'dart:core';
import 'Niveau.dart';

class Questionnaire {
    int id;
    int id_createur;
    String sujet;
    Niveau niveau;
    List<Question> questions = [];
    List<Theme> thematiques =  [];

    Questionnaire(this.id,this.id_createur,this.sujet,this.niveau);

    //Questionnaire(this.id,this.id_createur,this.sujet,this.questions);

    int getId(){return id;}
    int getIdCreateur(){ return id_createur;}
    List<Question> getQuestion(){ return questions;}
    List<Theme> getThematiques(){ return thematiques;}

    void ajouterQuestion(Question question){ questions.add(question);}
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

    @override
  String toString() {
    // TODO: implement toString
    int nb_question = questions.length;
    int nb_thematique = thematiques.length;
    return 'id:$id - nombre de question : $nb_question - nombre de thematique : $nb_thematique';
  }



}