<?php
namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Question;
use App\Models\Questionnaires;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

class QuestionnaireController extends Controller
{

    // TODO
    public function ajouterQuestionnaire(Request $request): JsonResponse
    {
        // Valider les données envoyées dans la requête
        $validatedData = $request->validate([
            'questions' => 'required|array',
            'questions.*.problematique' => 'required|string',
            'questions.*.level_id' => 'required|integer|exists:levels,id',
            'theme_id' => 'required|integer|exists:themes,id',
        ]);

        // Créer un nouveau questionnaire avec les données validées
        $questionnaire = new Questionnaires;
        $questionnaire->theme_id = $validatedData['theme_id'];
        $questionnaire->save();

        // Créer une nouvelle question pour chaque question envoyée avec les données validées et lier chaque question au questionnaire créé
        foreach ($validatedData['questions'] as $questionData) {
            $question = new Question;
            $question->problematique = $questionData['problematique'];
            $question->level_id = $questionData['level_id'];
            $question->save();

            $questionnaire->questions()->attach($question->id);
        }

        // Retourner une réponse JSON pour indiquer que le questionnaire a été créé avec succès
        return response()->json(['message' => 'Questionnaire créé avec succès.'], 201);
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

        return response()->json();
    }

}
