import 'Niveau.dart';
class Recompense 
{
  int id;
  String titre;
  String description;
  late Niveau niveau;
  int score = 0;
  bool debloque;
  
  Recompense(this.id,this.titre,this.description,this.niveau,this.score,this.debloque);

  int getId() => id;
  String getTitre() => titre;
  String getDescription() => description;
  Niveau getNiveau()=> niveau;
  int getScore()=> score;
  bool estDebloque() => debloque;

}