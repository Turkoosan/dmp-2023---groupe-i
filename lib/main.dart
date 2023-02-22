import 'package:flutter/material.dart';
import 'package:projet_quiz/modele/joueur.dart';
import 'package:projet_quiz/repository/joueurRepository.dart';
import 'package:projet_quiz/services/liste_joueur_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import 'home_page.dart';

final List<Map<String, dynamic>> listJoueur= [];

Future<void> main() async{
  var joueur = Joueur(id : 1 , username : 'Semih', password: 'semihg', score: 0);
  WidgetsFlutterBinding.ensureInitialized();

  final Database database = await openDatabase(
    join(await getDatabasesPath(), 'quizup.db'),
    onCreate: (db, version){
      return db.execute('CREATE TABLE joueur(id INTEGER PRIMARY KEY, username TEXT, password TEXT, score INTEGER)');
    },
    version: 1,
  );

  final JoueurRepository joueurRepository = JoueurRepository(database: database, listJoueur: listJoueur);
  await joueurRepository.init();
  runApp(MyApp(database: database,));
}

class MyApp extends StatelessWidget {
  final Database database;

  const MyApp({super.key, required this.database});

  @override
  Widget build(BuildContext context) {
    final JoueurRepository joueurRepository = JoueurRepository(listJoueur: listJoueur, database: database);
    return MultiBlocProvider(
        providers: [BlocProvider<ListeJoueurBloc>(
          lazy: false,
          create: (context) => ListeJoueurBloc(joueurRepository)),
        ],
        child: const MaterialApp(
        title: 'Quiz Up',
        home: HomePage(),
        )
    );
  }
}