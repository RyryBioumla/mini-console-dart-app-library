class Livre {
  late String titre;
  
  Livre(this.titre);
}

class Bibliotheque {
  Set<Livre> livres = {};
  
  Bibliotheque();
  
  void ajoutLivre(Livre livre){
    livres.add(livre);
  }
  
  void afficherLivre(){
    for (var livre in livres){
      print('- ${livre.titre}');
    }
  }
  
  Future<void> recherche(String nom) async{
    await Future.delayed(Duration(seconds:5));
    var result = livres.where((livre)=>livre.titre.toLowerCase()==nom.toLowerCase()).toList();
    if (result.isNotEmpty){
      print('Le livre $nom existe bel et bien');
    } else {
      print('Le livre $nom n\'existe pas!');
    }
  }
}

Future<void> main() async{
  Bibliotheque biblia = Bibliotheque();
  
  biblia.ajoutLivre(Livre('montaigu'));
  biblia.ajoutLivre(Livre('Une saison blanche et seche'));
  biblia.ajoutLivre(Livre('chataigne de montesquieu'));
  biblia.ajoutLivre(Livre('Le mariage de Figaro'));
  biblia.ajoutLivre(Livre('Né un jeudi'));
  
  print('-- Affichage de livres --');
  biblia.afficherLivre();
  
  print('-- Recherche de livre --');
  await biblia.recherche('Majoran');
  await biblia.recherche('Une saison blanche et seche');
}
