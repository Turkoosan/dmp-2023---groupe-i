import 'dart:convert';

class Reponse{
    int id;
    String reponse;
    bool reponse_est_vrai;

    Reponse(this.id, this.reponse,this.reponse_est_vrai);

    int get_id(){ return id;}
    String get_reponses(){ return reponse;}
    bool get_reponse_est_vrai(){ return reponse_est_vrai;}

    void set_reponse( String reponse){ this.reponse = reponse;}
    void set_reponse_est_vrai(bool reponse_est_vrai){ this.reponse_est_vrai = reponse_est_vrai;}

    
    dynamic reponseToJson()
    {
        return 
       
        {
          'id' : id  ,
          'reponse' : reponse,
          'est_correct':  reponse_est_vrai
          };

    }
  
}