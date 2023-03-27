<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Theme;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

class ThemeController extends Controller
{
    public function ajouterTheme(Request $request): JsonResponse
    {

        dd( $request->input('nom'));
        // Valider les données de la requête
        $request->validate([
            'nom' => 'required|string|max:255|unique:themes'
        ]);

        // Créer un nouveau thème
        $theme = new Theme();
        $theme->nom = $request->input('nom');
        $theme->save();

        // Retourner une réponse JSON
        return response()->json(['theme' => $theme], 201);
    }

    public function recupererTheme(): JsonResponse
    {
        // Récupérer tous les thèmes
        $themes = Theme::all();

        // Retourner une réponse JSON
        return response()->json(['themes' => $themes], 200);
    }
}
