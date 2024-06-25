import 'dart:io';

import 'package:appmarajoticketsales/page/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Venda de Passagens - Marajó',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: HomeScreen(), // Aqui define-se a HomeScreen como a tela inicial do aplicativo
    );
  }
}

 class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}