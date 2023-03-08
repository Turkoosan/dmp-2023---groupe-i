<?php

namespace App\Http\Controllers\Api;
use App\Models\User;
use App\Http\Controllers\Controller;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\ValidationException;
use Illuminate\Support\Facades\Validator;

class AuthentificationController extends Controller
{
    /**
     * Connexion de l'utilisateur
     * @param Request $request
     * @return JsonResponse
     * @throws ValidationException
     */
    public function login(Request $request): JsonResponse
    {
        try {
            $reuperationReq = $request->all();
            $validator = Validator::make($reuperationReq, [
                "email" => "required|email",
                "password" => "required",
            ]);

            if ($validator->fails()) {
                return response()->json([
                    "email" => false,
                    "password" => "Validation incorrecte",
                    "errors" => $validator->errors(),
                ], 422);
            }

            // Vérification de l'authentification avec l'email et le mot de passe fournis
            if(!Auth::attempt(['email' => $request->email, 'password' => $request->password])){
                $errors = [
                    "email" => "Adresse e-mail incorrecte",
                    "password" => "Mot de passe incorrect"
                ];

                return response()->json([
                    "email" => false,
                    "password" => "Email ou mot de passe incorrect",
                    "errors" => $errors,
                ], 401);
            }

            $user = User::where('email', $request->email)->first();

            return response()->json([
                "email" => true,
                "password" => "Connected",
                "data" => [
                    "token" => $user->createToken('auth_user')->plainTextToken,
                    "token_type" => "Bearer"
                ],
            ]);

        } catch (\Throwable $throwable) {
            return response()->json([
                "status" => false,
                "message" => $throwable->getMessage(),
            ], 500);
        }
    }


    /**
     * Enregistrement de l'utilisateur
     * @param Request $request
     * @return JsonResponse
     * @throws ValidationException
     */
    public function register(Request $request): JsonResponse
    {
        try {
            $validator = Validator::make($request->all(), [
                'name' => 'required|string|max:255',
                'email' => 'required|string|email|unique:users,email',
                'password' => 'required|string|min:6',
            ]);

            if ($validator->fails()) {
                return response()->json([
                    'status' => false,
                    'message' => 'Validation failed',
                    'errors' => $validator->errors(),
                ], 422);
            }

            $user = new User();
            $user->name = $request->input('name');
            $user->email = $request->input('email');
            $user->password = Hash::make($request->input('password'));
            $user->save();

            return response()->json([
                'status' => true,
                'message' => 'User created',
                'data' => [
                    'token' => $user->createToken('auth_token')->plainTextToken,
                    'token_type' => 'Bearer',
                ],
            ]);
        } catch (\Throwable $throwable) {
            return response()->json([
                'status' => false,
                'message' => $throwable->getMessage(),
            ], 500);
        }
    }



}
