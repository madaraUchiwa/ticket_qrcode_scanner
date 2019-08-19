import 'package:flutter/material.dart';
import 'package:ticket_qrcode_scanner/home.dart';
import 'package:ticket_qrcode_scanner/api_services.dart';
import 'package:http/http.dart' as  http;
//import '';



// class pour login widget
class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Login_();
  }
}

class _LoginData {
  String login = "";
  String password = "";
}


//class _Login_
class _Login_ extends State<Login>{
  //style des elements
  final _formKey = GlobalKey<FormState>();
   Future<Post> post;
  _LoginData _data = new _LoginData();
  TextStyle style = TextStyle(fontSize: 20.0);
  @override
  Widget build(BuildContext context) {
    //le champs email
    final emailField = TextFormField(
      obscureText: false,
      textAlign: TextAlign.center,
      style: style,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
        hintText: "E-mail",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
      ),
      validator: (value) {
        if(value.isEmpty) {
          return "Entrez votre E-mail";
        } else {
          _data.login = value;
        }
      },
    );

    //le champ password
    final passwordField = TextFormField(
      obscureText: true,
      textAlign: TextAlign.center,
      style: style,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
        hintText: "Mot de passe",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
      ),
      validator: (value) {
        if(value.isEmpty) {
          return "Entrez Votre mot de passe";
        }else {
          _data.password = value;
        }
      },
    );
    //button login
    final loginButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.red,
      child: MaterialButton(onPressed:login,
        minWidth: MediaQuery.of(context).size.width,
        child: Text(
          "Connexion",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: Center(
        child: Container(
          margin: EdgeInsets.all(10.0),
          height: 500,
          width: MediaQuery.of(context).size.width,

          child: Card(

            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,

              children: [
                Container(
                  width: MediaQuery.of(context).size.width /1.1,
                  child: SingleChildScrollView(
                      child: Form(
                        key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Padding(
                                  padding: const EdgeInsets.only(top:50.0),
                                  child: Center(
                                    child: Image.asset("assets/index_r2_c2_s1.jpg",
                                      fit: BoxFit.contain,
                                      width: MediaQuery.of(context).size.width / 1.25,
                                      height: 90.0,
                                    ),
                                  ),
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(top:20.0,bottom:40.0),
                                  child: Center(

                                    child: Text(
                                      "Bienvenu sur ticket.Abidjan.net connectez vous pour profiter de nos service",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        //fontSize: 15.0,
                                      ),
                                    ),
                                  ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: emailField,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: passwordField,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: loginButton,
                                ),
                              ),
                            ],
                          ),
                      ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void login() async {
    /*if(_formKey.currentState.validate()) {
      _data.login = _data.login;
      _data.password = _data.password;
      print(_data.login);
      print(_data.password);
      Post newpost = new Post(email: _data.login,password: _data.password);
      Post p = await fetchPost();
      print(p);
    }*/
   Navigator.push(context,
    new MaterialPageRoute(builder: (BuildContext context) {
      return new Home('Liste des évènements');
    })
    );
  }

  // login function
Future<Object> login2() async {
    String url = 'http://aec42831.ngrok.io/Api/';
    http.Response response = await http.get(url);
    print(response.body);
    return response.body;
}

}
