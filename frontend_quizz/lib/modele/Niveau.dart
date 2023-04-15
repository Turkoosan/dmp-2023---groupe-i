class Niveau
{
  int id;
  String titre;
  String difficulte;
  bool debloque;


  Niveau(this.id,this.titre,this.difficulte,this.debloque);

  int getId()=> id;
  String getTitre()=> titre;
  String getDifficulte()=> difficulte;
  bool getDebloque()=> debloque;
  void setTitre(String titre) => this.titre = titre;
  void setDifficulte(String difficulte)=> this.difficulte = difficulte;
  void setDebloque(bool debloque)=> this.debloque = debloque;
}