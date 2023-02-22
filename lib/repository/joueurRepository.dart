import 'dart:async';

import 'package:sqflite/sqflite.dart';
import '../modele/joueur.dart';

class JoueurRepository{
  final Database database;
  final List<Map<String, dynamic>> listJoueur;

  JoueurRepository({
    required this.database,
    required this.listJoueur}){
    int i = 0;
    int j = 0;

  List<Joueur> joueurs = listJoueur.map((e) => Joueur(
      id : 1,
      username : e["username"],
      password : e["password"],
      score : 0)).toList();
  }

  Stream<List<Joueur>> get streamListeJoueur => _joueurController.stream;

  final StreamController<List<Joueur>> _joueurController = StreamController<List<Joueur>>();

  Future<void> insertJoueur(Joueur joueur)async {
    await database.insert('joueur', joueur.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
    _joueurController.add(joueur as List<Joueur>);
    listJoueur.add(joueur as Map<String, dynamic>);
  }
  Future<List<Joueur>> joueurs() async {

    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await database.query('joueur');

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return Joueur(
        id: maps[i]['id'],
        username: maps[i]['username'],
        password: maps[i]['password'],
        score: maps[i]['score'],
      );
    });
  }

  Future<void> init() async {
    int i = 0;
    int j = 0;

    final List<Map<String, dynamic>> maps = await database.query('joueur');

    List<Joueur> joueurs = listJoueur.map((e) => Joueur(
        id : i++,
        username : e["username"],
        password : e["password"],
        score : j++))
        .toList();
  }

}