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

  // Future<List<dynamic>> getQuestionnaires() async {
  //   Uri uri = Uri.http('localhost:8000', '/api/recupererQuestionnaire');
  //   http.Response response = await http.get(uri);
  //   if (response.statusCode == 200) {
  //     final data = jsonDecode(response.body)['questionnaires'];
  //     if (data is List) {
  //       return data;
  //     } else {
  //       throw Exception('Invalid response');
  //     }
  //   } else {
  //     throw Exception('Failed to load questionnaires');
  //   }
  // }


  Future<String> getQuestionnaires() async {

    Uri uri = Uri.http('localhost:8000','/api/recupererQuestionnaire');
    print(uri);

    Future<http.Response> req = http.get(
        uri);

    var rep = await req ;
    // print(rep.body);
    return rep.body;

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

  Future<String> getQuestionsByQuestionnaireId(dynamic idQuestionnaire) async {
    Uri uri = Uri.http('localhost:8000', '/api/recupererUnSeulQuestionnaire/${idQuestionnaire}');
    print(uri);

    Future<http.Response> req = http.get(uri);
    var rep = await req ;
    return rep.body;

  }



}