import 'question.dart';
import 'dart:core';

class Theme{

    int id;
    String thematique;
    List<Question> questions = [];

    Theme(this.id,this.thematique);

    int get_id(){ return id;}
    @override
  String toString() {
    // TODO: implement toString
    return 'id:$id && thematique:$thematique';
  }
    void ajouter_question(Question question){
        this.questions.add(question);
    }

    void afficher()
    { 
        
        print('Thematique: $thematique\n');
        for(Question question in questions)
        {
            question.afficher();
        }
    }

}