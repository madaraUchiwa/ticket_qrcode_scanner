import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


class Post {
  final String email;
  final String password;
  //final Object data;

  Post({ this.email, this.password});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      email: json['email'],
      password: json['password'],
    );
  }
}

Future<Object> fetchPost() async {
  final url = "http://aec42831.ngrok.io/Api/login-partenaire";
  final response =
  await http.post(url);
//print(response);
  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    return Post.fromJson(json.decode(response.body));
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}



