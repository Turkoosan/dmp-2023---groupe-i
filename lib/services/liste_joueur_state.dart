part of 'liste_joueur_bloc.dart';

@immutable
abstract class ListeJoueurState extends Equatable{
  const ListeJoueurState();

  @override
  List<Object> get props => [];
}

class ListeJoueurInitialState extends ListeJoueurState {
  final List<Joueur> listJoueur;

  const ListeJoueurInitialState({required this.listJoueur});
  @override
  List<Object> get props => [
    listJoueur
  ];

}
