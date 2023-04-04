import 'package:flutter/material.dart';
import 'package:frontend_quizz/controller/UtilisateurController.dart';

class ConnexionPage extends StatelessWidget {
  late UtilisateurController utilisateurController;
  ConnexionPage(this.utilisateurController);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Quizz UP"),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.widgets),
              color: Colors.white,
              onPressed: () {},
            )
          ],
          backgroundColor: Colors.redAccent,
          leading: IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {},
            color: Colors.white,
          ),
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 0),
              pseudoSection,
              listeThemeSection,
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          color: Colors.redAccent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: IconButton(
                  icon: const Icon(Icons.shopping_cart),
                  color: Colors.white,
                  onPressed: () {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: IconButton(
                  icon: const Icon(Icons.home),
                  color: Colors.white,
                  onPressed: () {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: IconButton(
                  icon: const Icon(Icons.list),
                  color: Colors.white,
                  onPressed: () {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: IconButton(
                  icon: const Icon(Icons.add),
                  color: Colors.white,
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),


      ),

    );
  }

  Widget pseudoSection = Container(
    height: 500,
    padding: EdgeInsets.all(20),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(0),
      color: Colors.white,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center, // Centrer les éléments horizontalement
      crossAxisAlignment: CrossAxisAlignment.center, // Centrer les éléments verticalement
      children: [
        const CircleAvatar(
            radius: 100,
            backgroundColor: Colors.redAccent,
            child: Icon(
              Icons.android,
              size: 80,
              color: Colors.white,
            )
        ),

        SizedBox(width: 20),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Arouf Gangsta',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'aroufgangsta@gmail.com',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ],
    ),
  );



  Widget listeThemeSection = Container(
    color: Colors.redAccent,
    padding: EdgeInsets.all(30),
    margin: EdgeInsets.all(10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            TextButton(
              onPressed: () {},
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Icon(Icons.movie, size: 50, color: Colors.white),
              ),
            ),
            SizedBox(height: 10),
            Text("Film", style: TextStyle(color: Colors.white)),
          ],
        ),
        Column(
          children: [
            TextButton(
              onPressed: () {},
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Icon(Icons.music_note, size: 50, color: Colors.white),
              ),
            ),
            SizedBox(height: 10),
            Text("Musique", style: TextStyle(color: Colors.white)),
          ],
        ),
        Column(
          children: [
            TextButton(
              onPressed: () {},
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Icon(Icons.work, size: 50, color: Colors.white),
              ),
            ),
            SizedBox(height: 10),
            Text("Métier", style: TextStyle(color: Colors.white)),
          ],
        ),
        Column(
          children: [
            TextButton(
              onPressed: () {},
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Icon(Icons.school, size: 50, color: Colors.white),
              ),
            ),
            SizedBox(height: 10),
            Text("Ecole", style: TextStyle(color: Colors.white)),
          ],
        ),
        Column(
          children: [
            TextButton(
              onPressed: () {},
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Icon(Icons.travel_explore, size: 50, color: Colors.white),
              ),
            ),
            SizedBox(height: 10),
            Text("Pays", style: TextStyle(color: Colors.white)),
          ],
        ),
        Column(
          children: [
            TextButton(
              onPressed: () {},
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Icon(Icons.sports_soccer, size: 50, color: Colors.white),
              ),
            ),
            SizedBox(height: 10),
            Text("Sports", style: TextStyle(color: Colors.white)),
          ],
        ),
      ],
    ),
  );
}