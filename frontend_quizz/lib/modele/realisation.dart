class Realisation{
  int id;
  String titre;
  String description;
  bool debloque;
  
  Realisation(this.id,this.titre,this.description,this.debloque);

  int getId() => id;
  String getTitre() => titre;
  String getDescription() => description;
  bool estDebloque() => debloque;
}