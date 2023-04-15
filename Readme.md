***(0)Configuration du serveur laravel***

- éxecuter composer install
- créer un fichier database.sqlite dans le dossier database 
-  le .env doit ressembler à ça :
    - APP_NAME=Laravel
    - APP_ENV=local
    -   APP_KEY=base64:qNZawZDFgt17qJKDqC0aNhrRsrkzrDLbsp0oycX2m3w=
    -   APP_DEBUG=true
    -   APP_URL=http://localhost

    -   LOG_CHANNEL=stack
    -   LOG_DEPRECATIONS_CHANNEL=null
    -   LOG_LEVEL=debug

    -   DB_CONNECTION=sqlite
 - éxecuter [php artisan migrate] dans le but d'initialiser la base de donnée
 - éxecuter [php artisan serve] afin de démarrer le serveur


***Configuration de flutter***

-> executer pub get


   
***Mise en place du MVC***
- La mise en place du mvc a debuté :
    - l'ensemble des modèles de la database ont presque été implèmaenter
    - Trois services d'appel à l'api laravel ont été initialisé :
        - UtilisateurService ( complété à 0%)
        - QuestionnaireService (complété à 0%)
        - AuthentificationService (complété à 80% )
    - De nouveau service son susceptibe d'être rajouter et ceux enoncé peut être modifier
    - Mise en place de deux controller pour l'instant:
        - UtilisateurController (complété à 5%)
        - UtilisateurQuestionnaire (complété à 0%)
    - Il reste à créer les vue et les liées au controlleur          
- 1) le mvc a été mis en place avec succès sur UtilisateurController    :
    - a) on peut inscrire un utilisateur sur la vue (InscriptionPage )
    - b) on peut se connecter sur la vue (ConnexionPage)
    - Après l'action a ou b on est redirigé vers la vue menu (MenuPage)
- 2) Le questionnaire Mvc a déjà été mis en place:
    - a) On peut créer un questionnaires , la gestion des erreurs est aussi complète du coté flutter.
    - Toutefois le user_id est définit arbitrairement pour faciliter le test , un changement sera fait pour ce point
    - b) Le service permettant de récupérer l'ensemble des questionnaires a été mis en place mais il nécessaire de le convertir en list d'objet.
    - Ensuite défint un service du coté back à fin d'obtenir les questionnaires d'un utilisateur donnée.
    - Le service dart a déjà été implémenter.       


***Avancée de la database***
- 04/04 à 2h18 :
    - relation N..N (Many to Many ):
        - table theme et questionnaires fonctionnel
    - relation 1..N (One to Many ):
        - table user et questionnaire fonctionnel
        - table questionnaire et question fonctionnel
        - table question et reponse fonctionnel

***(1)Comment tester les relations ?***
- effectuer un [php artisan db:seed] et regarder le résultat sur votre base de donnée


**Comment tester la création de questionnaire**
- effectuer (0) et (1)
- pour faciliter le test la création de questionnaire est la première page visible
