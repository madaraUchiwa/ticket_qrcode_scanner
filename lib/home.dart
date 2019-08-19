import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

class Home extends StatelessWidget {

 Home(String titre)  {
   this.titre = titre;
   events =  listeEvents();
 }
 dynamic events;
 String titre;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(titre),
      ),
      body: new Center(
          child: new Text('Bonjour'),
      ),
    );
  }

 Future<dynamic> listeEvents() async {
   String url = 'http://aec42831.ngrok.io/Api/eventsOfDay';
   dynamic _data;
   http.Response response = await http.get(url);
   //print(response.body);
   _data = json.decode(response.body);
   print(_data['events']);
   return  _data;
 }
}





