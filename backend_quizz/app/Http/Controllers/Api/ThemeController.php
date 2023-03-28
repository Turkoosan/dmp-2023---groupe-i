<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Theme;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class ThemeController extends Controller
{
    public function ajouterTheme(Request $request): JsonResponse
    {

        // Valider les données de la requête
        $request->validate([
            'nom' => 'string|max:255|unique:themes'
        ]);

        try {

            $json = $request->getContent();
            $data = json_decode($json, true);

            $nom = $data['nom'];

            $theme = Theme::create(['nom' => $nom]);

            return response()->json(['theme' => $theme], 201);

        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }

    public function recupererTheme(): JsonResponse
    {
        // Récupérer tous les thèmes
        $themes = Theme::all();

        // Retourner une réponse JSON
        return response()->json(['themes' => $themes], 200);
    }
}
