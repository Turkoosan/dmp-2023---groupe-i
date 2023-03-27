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
    @override
  String toString() {
    // TODO: implement toString
    return ' id: $id\n reponse: $reponse\n validité: $reponse_est_vrai';
  }
}