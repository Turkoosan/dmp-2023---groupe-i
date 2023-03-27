import 'dart:core';
import 'Realisation.dart';
class Utilisateur{
    int id;
    String pseudo;
    String motDepasse;
    List<int> questions = [];
    int score = 0;
    List<Realisation> realisations = [];

    Utilisateur(this.id,this.pseudo,this.motDepasse);

    int getId(){return id;}
    String getPseudo(){return pseudo;}
    List<Realisation> getRealisations()=> realisations;
    void ajouterRealisation(Realisation realisation)=> realisations.add(realisation);
    List<int> getQuestions(){ return questions;}

    void setMotDepasse(String motDepasse){
        this.motDepasse = motDepasse; 
    }
    void setScore(int score){this.score = score;}

    void afficher(){
        print('id:$id\npseudo : $pseudo\nmpd:$motDepasse');
    }

}