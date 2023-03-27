import 'dart:core';
import 'Recompense.dart';
class Utilisateur{
    int id;
    String pseudo;
    String motDepasse;
    List<int> questions = [];
    int score = 0;
    List<Recompense> recompense = [];

    Utilisateur(this.id,this.pseudo,this.motDepasse);

    getId(){return id;}
    getPseudo(){return pseudo;}
    
    List<int> getQuestions(){ return questions;}

    void setMotDepasse(String motDepasse){
        this.motDepasse = motDepasse; 
    }
    void setScore(int score){this.score = score;}

    void afficher(){
        print('id:$id\npseudo : $pseudo\nmpd:$motDepasse');
    }

}