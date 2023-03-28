import 'package:http/http.dart' as http;

class AuthentificationService {

  AuthentificationService();
  
  Future<http.Response>post(String nom, String email, String mp) async
  {
    Uri uri = Uri.http('localhost:8000','/api/auth/register');

     print(uri);
    Future<http.Response> requete = http.post(
      uri,
      body:{
        'name':nom,
        'email': email,
        'password':mp,
      });
    
    var reponse =  await requete ;
    print(reponse.body);
    //var data1_response = jsonDecode(rep.body);

    return reponse; 
  
  }


  Future<http.Response> login(String email , String mp) async
  {
    
    Uri uri = Uri.http('localhost:8000','/api/auth/login');
    print(uri);

    Future<http.Response> requete = http.post(
      uri,
      body:{
        'email': email,
        'password':mp,
      });
 
    
    var reponse = await requete ;
    print(reponse.body);
    //var data1_response = jsonDecode(rep.body);
    return reponse;
  }

  Future<int> supprimer(String email) async 
  {
    Uri uri = Uri.http('localhost:8000','/api/auth/delete');
    print(uri);

    Future<http.Response> requete = http.post(
      uri,
      body:{
        'email': email,
      });

    var reponse = await requete ;
    //var data1_response = jsonDecode(rep.body);
    return reponse.statusCode;
  }
}