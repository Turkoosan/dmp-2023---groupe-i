part of 'liste_joueur_bloc.dart';

@immutable
abstract class ListeJoueurEvent extends Equatable{
  const ListeJoueurEvent();

  @override
  List<Object> get props => [];
}

//class OnInitializeListeJoueurEvent extends ListeJoueurEvent{}

class _OnJoueurUpdatedListeJoueurEvent extends ListeJoueurEvent{
  final List<Joueur> joueurs;

  const _OnJoueurUpdatedListeJoueurEvent({required this.joueurs});

  @override
  List<Object> get props => [joueurs,];
}
