import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

import '../modele/joueur.dart';
import '../repository/joueurRepository.dart';


part 'liste_joueur_event.dart';
part 'liste_joueur_state.dart';

class ListeJoueurBloc extends Bloc<ListeJoueurEvent, ListeJoueurState> {
  final JoueurRepository joueurRepository;

  ListeJoueurBloc(this.joueurRepository)
      : super(ListeJoueurInitialState(listJoueur: List<Joueur>.from([]))) {
    joueurRepository.streamListeJoueur.listen((streamListeJoueur) {
      add(_OnJoueurUpdatedListeJoueurEvent(joueurs: streamListeJoueur));
    });
    on<_OnJoueurUpdatedListeJoueurEvent>((event, emit) {
      emit(ListeJoueurInitialState(listJoueur: event.joueurs));
    });
  }
}
