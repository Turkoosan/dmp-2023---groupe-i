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
            // Récupération de l'id de l'utilisateur
          
            // Ajout des questionnaires et questions
            if (isset($jsonData['questionnaire'])) {
                $questionnaireData = $jsonData['questionnaire'];
              //  foreach ($questionnairesData as $questionnaireData) {
                $user = User::find(intval($questionnaireData['user_id']));

                    
                    // Récupération du thème
                    $theme = null;
                    if (isset($questionnaireData['theme'])) {
                        $theme = Theme::where('thematique', $questionnaireData['theme'])->first();
                        if (!$theme) {
                            // Si le thème n'existe pas, on le crée
                            $theme = new Theme();
                            $theme->thematique = $questionnaireData['theme'];
                            $theme->save();
                        }
                    }
                    
                    $questionnaire = new Questionnaire();
                    $questionnaire->sujet = $questionnaireData['sujet'];
                    $theme->questionnaires()->save($questionnaire);
                    $user->questionnaires()->save($questionnaire);
                    
                    $questionnaire->save();
                     
                    //la liste de question récupéré liè à un thème
                    $questions_recupere = [];
                    //la liste de reponnse récupéré lié à une question 
                    $reponses_recupere = [];

                    $questionsData = $questionnaireData['questions'];

                    foreach ($questionsData as $questionData) {
                        $question = Question::create(['problematique'=>$questionData['problematique']]);   
                        //Remise à null 
                        $reponses_recupere = [];

                        $reponsesData = $questionData['reponses'];
                        foreach ($reponsesData as $reponseData) {
                            
                            $reponse = Reponse::create(['reponse'=>$reponseData['reponse'] , 'est_correct' =>$reponseData['est_correct']]); 
                            array_push($reponses_recupere,$reponse);
                        }

                        $question->reponses()->saveMany($reponses_recupere);
                        array_push($questions_recupere,$question);

                    }

                    $questionnaire->questions()->saveMany($questions_recupere);
               // }
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
    
        $questionnaires_partielle = Questionnaire::all();
        $questionnaire_complet = [];

        foreach($questionnaires_partielle as $questionnaire)
        {
            //récupération des questions du questionnaires
            $questions = Question::where('questionnaire_id',$questionnaire->id)->get();
            $question_reponses = [];
            foreach($questions as $question )
            {
               // récupération des reponses du questionnaires   
               $reponses = Reponse::where('question_id',$question->id)->get();
               array_push($question_reponses,['question'=> $question,'reponses'=>$reponses]);
            }
            array_push($questionnaire_complet,['questionnaire' => $questionnaire , 'questions' => $question_reponses ] );
        }
        return response()->json(['message' => "questionnaires récupéré avec succès" , 'questionnaires' => $questionnaire_complet , 200]);
    }

}
