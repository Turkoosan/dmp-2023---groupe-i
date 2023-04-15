import 'package:frontend_quizz/modele/Questionnaire.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class QuestionnaireService 
{
  QuestionnaireService();

  Future<int> ajouterQuestionnaire(dynamic questionnaire_json) async
  {
   
    Uri uri = Uri.http('localhost:8000','/api/ajouterQuestionnaire');
    print(uri);

    Future<http.Response> req = http.post(
      uri,
      body: questionnaire_json );
    
    var rep = await req ;
  var data_response = jsonDecode(rep.body);
    ///print(rep.body);
    print(rep.statusCode);
    return rep.statusCode;


  }

  
  
  Future<http.Response> getQuestionnaires() async {
  
  Uri uri = Uri.http('localhost:8000','/api/recupererQuestionnaire');
  print(uri);

  Future<http.Response> req = http.get(
    uri);
  
  var rep = await req ;
  var data1_response = jsonDecode(rep.body);
  print(rep.body);
  print(rep.statusCode);

  return rep;

  }


  Future<http.Response> getQuestionnairesById(int utilisateur_id) async {
  
  Uri uri = Uri.http('localhost:8000','/api/recupererQuestionnaire/${utilisateur_id}');
  print(uri);

  Future<http.Response> req = http.get(uri);
  
  var rep = await req ;
  var data1_response = jsonDecode(rep.body);
  print(rep.body);
  print(rep.statusCode);

  return rep;

  }


}