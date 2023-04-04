import 'dart:core';

import 'package:frontend_quizz/modele/Realisation.dart';

class Utilisateur{
    int id = 0;
    late var pseudo; 
    late var motDepasse ;
    List<int> questions = [];
    int score = 0;
    List<Realisation> realisations = [];

    Utilisateur.parDefaut();
    Utilisateur(this.id,this.pseudo,this.motDepasse);

    int getId(){return id;}
    String getPseudo(){return pseudo;}
    String getMotDepasse()=> motDepasse;
    List<Realisation> getRealisations()=> realisations;
    void ajouterRealisation(Realisation realisation)=> realisations.add(realisation);
    List<int> getQuestions(){ return questions;}
    void seId(int id)=> this.id = id;
    void setPseudo(var pseudo)=> this.pseudo = pseudo;
    void setMotDepasse(var motDepasse){
        this.motDepasse = motDepasse; 
    }
    void setScore(int score){this.score = score;}

    void afficher(){
        print('id:$id\npseudo : $pseudo\nmpd:$motDepasse');
    }

}