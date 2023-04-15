import 'dart:convert';

import 'Reponse.dart';
import 'dart:core';
class Question{
   int id;
   String problematique;
   List<Reponse> reponses = []; 
  

   Question(this.id , this.problematique);

   List<Reponse> getReponses(){ return reponses;} 

   void ajouterReponse(Reponse reponse) { reponses.add(reponse);}
   
   void ajouterReponses(List<Reponse> _reponses) 
   { 
      for(var reponse in _reponses)
        reponses.add(reponse);
      
   }

   String getProblematique()
   {
    return problematique;
   }
   void supprimerReponse(int id){reponses.removeAt(id);}
   
   void modifierReponse(int indice , Reponse reponse) => reponses[indice] = reponse;

   
   dynamic questionToJson()
   {
        dynamic reponsesTojson = [];

        for (var reponse in reponses) {
          reponsesTojson.add(reponse.reponseToJson());
        }

        return
         
        {
           'id': id,
           "problematique":problematique,
           "reponses" : reponsesTojson  
        };
   }

   void afficher()
   { 
      print('id : $id\nQuestion: $problematique\nReponse:\n');
      for(Reponse reponse in reponses){
         print(reponse.toString());
      }
   }   
   

}