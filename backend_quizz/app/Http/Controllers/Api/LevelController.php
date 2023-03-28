<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Level;
use App\Models\Theme;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

class LevelController extends Controller
{
    public function ajouterLevel(Request $request): JsonResponse
    {
        // Valider les données de la requête
        $request->validate([
            'nom' => 'string|max:255|unique:levels',
            'difficultes' => 'string'
        ]);

        try {
            $json = $request->getContent();
            $data = json_decode($json, true);

            $nouveauLevel = Level::create([
                'nom' => $data['nom'],
                'difficultes' => $data['difficultes'],
                'unlocked' => false
            ]);

            return response()->json(['level' => $nouveauLevel], 201);

        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }



    public function recupererLevel(): JsonResponse
    {
        try {
            $levels = Level::all();
            return response()->json(['levels' => $levels], 200);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }

}
