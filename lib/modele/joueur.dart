import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'achievement.dart';


class Joueur{
  int id;
  String username;
  String password;
  int score;


  Joueur({required this.id,required this.username,required this.password,required this.score});

  Map<String, dynamic> toJson(){
    return{
      'id':id,
      'username':username,
      'password':password,
    };
  }
  @override
  String toString(){
    return 'Joueur{id: $id, username: $username, password: $password, score : $score}';
  }
}