// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//   final _formKey = GlobalKey<FormState>();
//   String _email = '';
//   String _password = '';
//   String _errorMessage = '';
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Login'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: <Widget>[
//               TextFormField(
//                 decoration: InputDecoration(
//                   labelText: 'Email',
//                 ),
//                 validator: (value) {
//                   if (value.isEmpty) {
//                     return 'Please enter your email';
//                   }
//                   return null;
//                 },
//                 onSaved: (value) {
//                   _email = value;
//                 },
//               ),
//               TextFormField(
//                 obscureText: true,
//                 decoration: InputDecoration(
//                   labelText: 'Password',
//                 ),
//                 validator: (value) {
//                   if (value.isEmpty) {
//                     return 'Please enter your password';
//                   }
//                   return null;
//                 },
//                 onSaved: (value) {
//                   _password = value;
//                 },
//               ),
//               SizedBox(height: 24.0),
//               RaisedButton(
//                 child: Text('Login'),
//                 onPressed: () async {
//                   if (_formKey.currentState.validate()) {
//                     _formKey.currentState.save();
//                     final response = await http.post(
//                       Uri.parse('http://yourapi.com/auth/login'),
//                       headers: {
//                         'Content-Type': 'application/json',
//                       },
//                       body: jsonEncode({
//                         'email': _email,
//                         'password': _password,
//                       }),
//                     );
//                     if (response.statusCode == 200) {
//                       // Login successful, navigate to home page
//                       Navigator.pushReplacementNamed(context, '/home');
//                     } else {
//                       // Login failed, display error message
//                       final responseBody = jsonDecode(response.body);
//                       setState(() {
//                         _errorMessage = responseBody['message'];
//                       });
//                     }
//                   }
//                 },
//               ),
//               if (_errorMessage.isNotEmpty) ...[
//                 SizedBox(height: 12.0),
//                 Text(
//                   _errorMessage,
//                   style: TextStyle(
//                     color: Colors.red,
//                   ),
//                 ),
//               ],
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
