<?php
namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Question;
use App\Models\Questionnaire;
use App\Models\Reponse;
use App\Models\Theme;
use App\Models\User;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

class QuestionnaireController extends Controller
{

    public function ajouterQuestionnaire(Request $request): JsonResponse
    {
        // Récupération des données du JSON
        $jsonData = $request->json()->all();

        // Début de la transaction pour assurer l'intégrité des données
        DB::beginTransaction();

        try {
//            dd($jsonData['users']);
//            dd($jsonData['questionnaires']);
            // Ajout des utilisateurs
//            if (isset($jsonData['users'])) {
//                $usersData = $jsonData['users'];
//                foreach ($usersData as $userData) {
//                    $user = new User();
//                    $user->name = $userData['name'];
//                    $user->email = $userData['email'];
//                    $user->password = bcrypt($userData['password']);
//                    $user->save();
//                }
//            }
//                TODO RECUPÉRER LE ID DE L'UTILISATEUR
            // Ajout des questionnaires et questions
            if (isset($jsonData['questionnaires'])) {
                $questionnairesData = $jsonData['questionnaires'];

                foreach ($questionnairesData as $questionnaireData) {
                    $questionnaire = new Questionnaire();
                    $questionnaire->sujet = $questionnaireData['sujet'];
                    $questionnaire->save();

                    $questionsData = $questionnaireData['questions'];
                    foreach ($questionsData as $questionData) {
                        $question = new Question();
                        $question->problematique = $questionData['problematique'];
                        $question->questionnaire_id = $questionnaire->id;
                        $question->save();

                        $reponsesData = $questionData['reponses'];
                        foreach ($reponsesData as $reponseData) {
                            $reponse = new Reponse();
                            $reponse->reponse = $reponseData['reponse'];
                            $reponse->est_correct = $reponseData['est_correct'];
                            $reponse->question_id = $question->id;
                            $reponse->save();
                        }
                    }
                }
            }

            // Ajout des thèmes et lien avec les questionnaires
            if (isset($jsonData['themes'])) {
                $themesData = $jsonData['themes'];
                foreach ($themesData as $themeData) {
                    $theme = new Theme();
                    $theme->thematique = $themeData['thematique'];
                    $theme->save();
                }
            }

            // Commit de la transaction si tout se passe bien
            DB::commit();

            // Réponse JSON pour confirmer l'ajout des données
            return response()->json(['message' => 'Données ajoutées avec succès'], 201);
        } catch (\Exception $e) {
            // Rollback de la transaction en cas d'erreur
            DB::rollback();
            return response()->json(['error' => 'Une erreur est survenue lors de l\'ajout des données : ' . $e->getMessage()], 500);
        }
    }


    // TODO
//    public function ajouterQuestionnaire(Request $request): JsonResponse
//    {
//
//        dd($request);
//        return response()->json(['message' => 'Questionnaire créé avec succès.'], 201);
//    }



    public function supprimerQuestionnaire(Request $request): JsonResponse
    {

        return response()->json();
    }

    public function modifierQuestionnaire(Request $request): JsonResponse
    {

        return response()->json();
    }

    public function recupererQuestionnaire(Request $request): JsonResponse
    {

        return response()->json();
    }

}
