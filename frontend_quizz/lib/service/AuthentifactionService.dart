import 'package:http/http.dart' as http;

class AuthentificationService {

  AuthentificationService();
  
  Future<int> post(String nom, String email, String mp) async
  {
    Uri uri = Uri.http('localhost:8000','/api/auth/register');


    Future<http.Response> requete = http.post(
      uri,
      body:{
        'name':nom,
        'email': email,
        'password':mp,
      });
    
    var reponse =  await requete ;
    //var data1_response = jsonDecode(rep.body);

    return reponse.statusCode; 
  
  }


  Future<int> login(String email , String mp) async
  {
    
    Uri uri = Uri.http('localhost:8000','/api/auth/login');
    print(uri);

    Future<http.Response> requete = http.post(
      uri,
      body:{
        'email': 'el@el',
        'password':'elelel',
      });
    
    var reponse = await requete ;
    //var data1_response = jsonDecode(rep.body);
    return reponse.statusCode;
  }

  Future<int> supprimer(String email) async 
  {
    Uri uri = Uri.http('localhost:8000','/api/auth/delete');
    print(uri);

    Future<http.Response> requete = http.post(
      uri,
      body:{
        'email': 'el@el',
      });
    
    var reponse = await requete ;
    //var data1_response = jsonDecode(rep.body);
    return reponse.statusCode;
  }
}