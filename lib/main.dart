import 'package:flutter/material.dart';
import 'package:ticket_qrcode_scanner/login.dart';

  void main() => runApp(MyApp());

 class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // information
    return new MaterialApp(
      title: 'Lecteur de QR Code',
      theme: new ThemeData(
        primarySwatch: Colors.red
      ),
      debugShowCheckedModeBanner: false,
      home: new Login(),
    );
  }
 }
