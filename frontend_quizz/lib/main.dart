import 'package:flutter/material.dart';
import 'package:frontend_quizz/controller/UtilisateurController.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  UtilisateurController utilisateurController = UtilisateurController();
  runApp(MaterialApp(
      home: Scaffold(
        body: utilisateurController.getQuestionnaireController().goToCreerQuestionnairePage(),
      )
  ));
}