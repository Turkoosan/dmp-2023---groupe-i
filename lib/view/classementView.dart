import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projet_quiz/modele/joueur.dart';
import 'package:projet_quiz/services/liste_joueur_bloc.dart';


class ClassementView extends StatelessWidget {

  const ClassementView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListeJoueurBloc, ListeJoueurState>(builder: (context, state){
      List<Joueur> listeJoueurs = [];

      if(state is ListeJoueurInitialState){
        listeJoueurs = state.listJoueur;
     }
      return ListView.builder(
        itemCount: listeJoueurs.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(listeJoueurs[index].username,
              ),
            ),
          );
        },
      );
    }
    );
  }
}