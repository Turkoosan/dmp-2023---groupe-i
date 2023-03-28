import 'Reponse.dart';
import 'dart:core';
class Question{
   int id;
   String problematique;
   List<Reponse> reponses = []; 
  

   Question(this.id , this.problematique);

   List<Reponse> getReponses(){ return reponses;} 

   void ajouterReponse(Reponse reponse) { reponses.add(reponse);}
   
   void ajouterReponses(List<Reponse> reponses) 
   { 
      for(var reponse in reponses)
         reponses.add(reponse);
      
   }
   void supprimerReponse(int id){reponses.removeAt(id);} 
   

   void afficher()
   { 
      print('id : $id\nQuestion: $problematique\nReponse:\n');
      for(Reponse reponse in reponses){
         print(reponse.toString());
      }
   }   
   

}