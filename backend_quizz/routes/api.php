<?php

use App\Http\Controllers\Api\AuthentificationController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});


// pas de middleware
Route::post('/auth/login', [\App\Http\Controllers\Api\AuthentificationController::class, 'login']);
Route::post('/auth/register', [\App\Http\Controllers\Api\AuthentificationController::class, 'register']);


Route::post('/ajouterTheme', [\App\Http\Controllers\Api\ThemeController::class, 'ajouterTheme']);
Route::get('/recupererTheme', [\App\Http\Controllers\Api\ThemeController::class, 'recupererTheme']);

Route::post('/ajouterLevel', [\App\Http\Controllers\Api\LevelController::class, 'ajouterLevel']);
Route::get('/recupererLevel', [\App\Http\Controllers\Api\LevelController::class, 'recupererLevel']);



Route::post('/ajouterQuestionnaire', [\App\Http\Controllers\Api\QuestionnaireController::class, 'ajouterQuestionnaire']);
Route::get('/supprimerQuestionnaire', [\App\Http\Controllers\Api\QuestionnaireController::class, 'supprimerQuestionnaire']);
Route::get('/modifierQuestionnaire', [\App\Http\Controllers\Api\QuestionnaireController::class, 'modifierQuestionnaire']);
Route::get('/recupererQuestionnaire', [\App\Http\Controllers\Api\QuestionnaireController::class, 'recupererQuestionnaire']);


Route::group(['middleware' => ['auth:sanctum']], function(){
    Route::get('auth/profile', [AuthentificationController::class , 'profile'] );
    Route::put('auth/edit_profile', [AuthentificationController::class , 'edit'] );
    Route::post('auth/logout', [AuthentificationController::class, 'logout']);
});

